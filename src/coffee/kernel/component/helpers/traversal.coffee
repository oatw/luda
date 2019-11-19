import {luda, Luda} from '../../base/luda.coffee'
import splitValues from '../../base/split-values.coffee'
import Type from '../../base/type.coffee'
import unique from '../../base/unique.coffee'
import '../../traversal/parent.coffee'
import unnested from './unnested.coffee'



createGetter = (C, name, selector, nestable, cacheable) ->
  Object.defineProperty C.prototype, name,
    get: ->
      return luda() unless selector
      return selector if selector instanceof Luda
      return selector.call this if Type.isFunction selector
      return luda selector unless Type.isString selector
      return luda() unless rootEl = @root.els[0]
      cacheable and cache = C.instances[@id].traversal
      return cache[name] if cache and name of cache
      matched = luda(selector, rootEl).els
      not nestable and matched = unnested this, matched
      collection = luda unique(matched)
      return collection unless cache
      if collection.length then cache[name] = collection else collection

addTraversal = (C) ->
  traversals = C.helpers.find.call C.prototype
  nestable = Type.isDocument C.root
  cacheable = Type.isString C.root
  for name, selector of traversals
    if name of C.prototype
      msg = "'#{name}' was defined on prototype"
      msg = "#{msg}, skip adding traversal getter."
      console.warn msg
    else
      createGetter C, name, selector, nestable, cacheable
  cacheable and C.prototype.cleanTraversal = (name) ->
    return unless cached = @constructor.instances[@id]
    return unless traversal = cached.traversal
    cleanTraversal traversal, name

cleanTraversal = (cache, name) ->
  return unless cache
  name = '' unless Type.isString name
  names = if name then splitValues name else Object.keys cache
  names.forEach (n) -> delete cache[n]



export {addTraversal, cleanTraversal}