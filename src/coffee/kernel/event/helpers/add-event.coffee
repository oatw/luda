import luda from '../../base/luda.coffee'
import matches from '../../base/matches.coffee'
import {_access} from '../../cache/helpers/access.coffee'
import eventPath from './event-path.coffee'
import ludaEvent from './luda-event.coffee'
import nMatches from './namespace-matches.coffee'
import removeEvent from './remove-event.coffee'
import swipeEvent from './swipe-event.coffee'
import Variables from './variables.coffee'



addEvent = (el, type, selector, callback, namespace, kc, stop, prevent, _one) ->
  throw new Error 'handler cannot be used as event type' if type is 'handler'
  expando = Variables.expando
  evtCache = _access(el, expando) or _access(el, expando, {})
  typeCache = evtCache[type] ||= {}
  quene = typeCache.quene ||= []
  quene.push
    selector: selector
    callback: callback
    namespace: namespace
    key: kc
    stop: stop
    prevent: prevent
    one: _one
  handler = evtCache.handler ||= (event) ->
    self = this
    cached = _access self, Variables.expando
    eType = event.type
    return unless cached and cached[eType]
    collection = eventPath event
    collection = collection.slice 0, collection.indexOf(self) + 1
    event = event.ludaEvent or ludaEvent event
    # simulate event bubble behaviors
    # to make sure quene callbacks triggered from event.target to self
    collection.every (node) ->
      cached[eType].quene.every (it) ->
        if ((selector = it.selector) and matches node, selector) or \
        (not it.selector and node is self)
          if event.namespace and not nMatches(it.namespace, event.namespace)
            return true
          if event.keyCode and it.key.length \
          and not it.key.includes event.keyCode
            return true
          event.currentTarget = node
          returnValue = it.callback.call node, event, event.detail
          if it.one
            removeEvent self, eType, it.selector, it.callback, it.namespace
          event.stopPropagation() if it.stop or returnValue is false
          event.preventDefault() if it.prevent or returnValue is false
        # make sure callbacks in front called but callbacks behind not called
        # if immediate propagation called
        not event.isImmediatePropagationStopped()
      # make sure same level callbacks called
      # but parents level callbacks not called if propagation stoped
      not event.isPropagationStopped()
  swipeTypes = Object.values Variables.swipeEvents
  if swipeTypes.includes type
    swipeBinded = swipeTypes.some (type) -> evtCache[type]?.binded
    swipeEvent.add el unless swipeBinded
  unless typeCache.binded
    typeCache.binded = true
    el.addEventListener type, handler



export default addEvent