import luda from '../../base/luda.coffee'
import {_access} from '../../base/access.coffee'
import nMatches from './namespace-matches.coffee'
import swipeEvent from './swipe-event.coffee'
import Variables from './variables.coffee'



export default removeEvent = (el, type, selector, callback, namespace) ->
  evtCache = _access el, Variables.expando
  return unless evtCache
  if not type
    for type, typeCache of evtCache
      removeEvent el, type, selector, callback, namespace
  else if type isnt 'handler' and typeCache = evtCache[type]
    typeCache.quene ||= []
    typeCache.quene = typeCache.quene.filter (item) ->
      return true if callback and callback isnt item.callback
      return true if selector and selector isnt item.selector
      return true if namespace and not nMatches(item.namespace, namespace)
    if not typeCache.quene.length and typeCache.binded and evtCache.handler
      el.removeEventListener type, evtCache.handler
      delete evtCache[type]
    swipeTypes = Object.values Variables.swipeEvents
    if swipeTypes.includes(type) and swipeTypes.every (t) -> not evtCache[t]
      swipeEvent.remove el
  length = Object.keys(evtCache).length
  if not length or (length is 1 and 'handler' of evtCache)
    _access el, Variables.expando, null