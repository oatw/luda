import luda from '../../base/luda.coffee'
import createMounter from '../../base/create-mounter.coffee'
import expando from '../../base/expando.coffee'
import guid from '../../base/guid.coffee'
import Type from '../../base/type.coffee'
import log from '../../log/log.coffee'
import {_access} from '../../cache/helpers/access.coffee'
import {addEvents, removeEvents} from './events.coffee'
import {addTraversal, cleanTraversal} from './traversal.coffee'
import {watch, stopWatch} from './watch.coffee'



class Base

  win: luda window
  doc: luda document

  constructor: (root) ->
    C = @constructor
    proto = C.prototype
    inses = C.instances
    unless Type.isString(C.root) or Type.isDocument C.root
      throw new Error 'Component root can only be selectors or document'
    return root if root instanceof C
    root = C.root if Type.isDocument C.root
    @root = luda root
    return unless rootEl = @root.els[0]
    @root = luda rootEl if @root.length > 1
    @id = rootEl[expando] ||= guid()
    return inses[@id].instance if @id of inses
    if (listen = C.helpers.listen) and not C.eventsBinded
      addEvents C
      C.eventsBinded = true
    if (find = C.helpers.find) and not C.traversalAdded
      addTraversal C
      C.traversalAdded = true
    traversal = {} if proto.cleanTraversal
    if traversal and not C.watches
      if definedWatch = C.helpers.watch
        C.helpers.watch = ->
          watches = definedWatch.call this
          watches.dom ||= []
          watches.dom.unshift [proto.cleanTraversal]
          watches
      else
        C.helpers.watch = -> {dom: [[proto.cleanTraversal]]}
    watcher = watch C, this if C.helpers.watch
    inses[@id] = {instance: this, traversal: traversal, watcher: watcher}
    _access rootEl, C.id, inses[@id]
    create.call this if create = C.helpers.create
    log "#{C.id} ID: #{@id} created.",
    'Root element', rootEl, 'Cache', inses[@id]

  @create: (selector, ctx) ->
    C = this
    selector = @root if Type.isDocument(@root) or not selector
    luda(selector, ctx).els.map (el) -> new C el

  @destroy: (selector, ctx) ->
    C = this
    inses = @instances
    selector = @root if Type.isDocument(@root) or not selector
    luda(selector, ctx).els.forEach (rootEl) ->
      return unless id = rootEl[expando]
      return unless id of inses
      instance = inses[id].instance
      watcher = inses[id].watcher
      destroy.call instance if destroy = C.helpers.destroy
      stopWatch instance, watcher if watcher
      delete inses[id]
      _access rootEl, C.id, null
      log "#{C.id} ID: #{id} destroied.",
      'Root element', rootEl, 'Cache', inses[id]
    hasInstances = Object.keys(inses).length
    if not hasInstances and C.eventsBinded
      removeEvents C
      C.eventsBinded = false
    this

  @help: (key, val) ->
    @help = createMounter @helpers, 'helping'
    @help key, val

  @include: (key, val) ->
    C = this
    fn = (name, value) ->
      C.included.push name
      value
    @include = createMounter @prototype, 'including', fn
    @include key, val

  @protect: (key, val) ->
    @protect = createMounter @prototype, 'protecting'
    @protect key, val

  @contains: (selector, ctx) ->
    inses = @instances
    luda(selector, ctx).els.some (el) ->
      (id = el[expando]) and inses[id]

  @each: (callback) ->
    Object.values(@instances).some (cache, index) ->
      instance = cache.instance
      rootEl = instance.root.els[0]
      callback(instance, rootEl, index, cache) is false
    this



  Object.defineProperty Base.prototype, 'html',
    get: -> luda document.documentElement

  Object.defineProperty Base.prototype, 'body',
    get: -> luda document.body

  Object.defineProperty Base.prototype, 'con',
    get: -> @constructor



export default Base