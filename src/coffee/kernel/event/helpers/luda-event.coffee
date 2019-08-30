import eventPath from './event-path.coffee'



class LudaEvent

  constructor: (event) -> @originalEvent = event

  isDefaultPrevented: -> @originalEvent.defaultPrevented

  isPropagationStopped: -> not @originalEvent.bubbles or @_propagationStopped

  isImmediatePropagationStopped: -> @_immediatePropagationStopped

  preventDefault: -> @originalEvent.preventDefault()

  stopPropagation: ->
    @originalEvent.stopPropagation()
    @_propagationStopped = true

  stopImmediatePropagation: ->
    @originalEvent.stopImmediatePropagation()
    @_immediatePropagationStopped = true

  eventPath: -> eventPath @originalEvent


export default (event) ->
  ludaEvent = new LudaEvent event
  new Proxy ludaEvent,
    get: (target, key) ->
      if key of target then target[key] else target.originalEvent[key]