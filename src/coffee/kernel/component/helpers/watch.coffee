import arrayEqual from '../../base/array-equal.coffee'
import expando from '../../base/expando.coffee'
import find from '../../base/find.coffee'
import findAll from '../../base/find-all.coffee'
import matches from '../../base/matches.coffee'
import splitValues from '../../base/split-values.coffee'
import Type from '../../base/type.coffee'
import unique from '../../base/unique.coffee'
import log from '../../log/log.coffee'
import unnested from './unnested.coffee'



config =
  childList: true
  subtree: true
  attributes: true
  attributeOldValue: true

cur = (ins, callback, target) ->
  proto = ins.constructor.prototype
  isInProto = Object.values(proto).includes callback
  if isInProto then ins else target

runNodeCallbacks = (type, mutation, watches, nestable) ->
  ins = mutation.ins
  C = ins.constructor
  mu = mutation.mu
  nodes = Array.from mu["#{type}Nodes"]
  watches.node.forEach (node) ->
    els = []
    nodes.forEach (n) -> els = els.concat(findAll node.selector, n)
    return unless els.length
    not nestable and els = unnested ins, unique(els)
    els.length and node.callbacks.forEach (callback) ->
      ctx = cur ins, callback, els
      unless callback is C.prototype.cleanTraversal
        log "#{C.id} ID: #{ins.id} executes nodes #{type} callback.",
        'Root element', ins.root.els[0], 'Cache', C.instances[ins.id],
        "Nodes #{type}", els, "Callback #{callback.name or ''}", callback,
        'Context', ctx, 'Arguments', [els, type]
      callback.call ctx, els, type

runAttrCallbacks = (mutation, watches, nestable) ->
  ins = mutation.ins
  mu = mutation.mu
  C = ins.constructor
  name = mu.attributeName
  target = mu.target
  oldVal = mu.oldValue
  name and watches.attr.forEach (attr) ->
    return unless attr.name.includes name
    return unless matches target, attr.selector
    return if not nestable and not unnested(ins, [target]).length
    attr.callbacks.forEach (callback) ->
      ctx = cur(ins, callback, target)
      log "#{C.id} ID: #{ins.id} executes #{name} changed callback.",
      'Root element', ins.root.els[0], 'Cache', C.instances[ins.id],
      'Changed target', target, "Callback #{callback.name or ''}", callback,
      'Context', ctx, 'Arguments', [target, oldVal]
      callback.call ctx, target, oldVal

executeMutations = (C, mutations, nestable) ->
  mutations.forEach (mutation) ->
    runNodeCallbacks 'added', mutation, C.watches, nestable
    runNodeCallbacks 'removed', mutation, C.watches, nestable
    runAttrCallbacks mutation, C.watches, nestable

nodesEqual = (nodesOne, nodesTwo) ->
  arrayEqual Array.from(nodesOne), Array.from(nodesTwo), true

findSameMutation = (mutations, mu) ->
  theSameMutation = null
  mutations.some (mutation) ->
    return theSameMutation = mutation if mu is mutation.mu
    return unless mu.type is mutation.mu.type
    return unless mu.target is mutation.mu.target
    return unless mu.attributeName is mutation.mu.attributeName
    return unless mu.oldValue is mutation.mu.oldValue
    return unless nodesEqual mu.addedNodes, mutation.mu.addedNodes
    return unless nodesEqual mu.removedNodes, mutation.mu.removedNodes
    theSameMutation = mutation
  theSameMutation

createObserver = (C, instance) ->
  inses = C.instances
  rootEl = instance.root.els[0]
  nestable = Type.isDocument C.root
  observer = new MutationObserver (mus) ->
    mutations = mus.map (mu) -> {ins: instance, mu: mu}
    not nestable and find(C.root, rootEl).forEach (el) ->
      return unless cached = inses[el[expando]]
      return unless ins = cached.instance
      return unless watcher = cached.watcher
      watcher.takeRecords().forEach (mu) ->
        nestedMutation = findSameMutation mutations, mu
        nestedMutation.ins = ins if nestedMutation
    executeMutations C, mutations, nestable
  observer.observe rootEl, config
  observer

watch = (C, ins) ->
  unless C.watches
    conf = C.helpers.watch.call C.prototype
    C.watches =
      node: (conf.node or []).map (d) ->
        selector: if Type.isFunction d[0] then '*' else d[0]
        callbacks: if Type.isFunction d[0] then d else d.slice 1
      attr: (conf.attr or []).map (a) ->
        name: splitValues a[0]
        selector: if Type.isFunction a[1] then '*' else a[1]
        callbacks: if Type.isFunction a[1] then a.slice 1 else a.slice 2
  createObserver C, ins

stopWatch = (ins, watcher) -> watcher.disconnect()



export {watch, stopWatch}