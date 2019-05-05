import './install.coffee'
import './dom.coffee'



luda
 
  _SWIPE_DISTANCE: 10
  _EVENT_TYPE_PREFIX: 'luda'
  _SWIPE_LEFT: 'swipeleft'
  _SWIPE_RIGHT: 'swiperight'
  _SWIPE_UP: 'swipeup'
  _SWIPE_DOWN: 'swipedown'
  _SWIPE_LEFT_OR_UP: 'swipeleft or swipeup'
  _SWIPE_RIGHT_OR_DOWN: 'swiperight or swipedown'
  _DOC_READY: 'docready'
  _FORM_RESET: 'reset'

  eventPath: (event) ->
    if event.composedPath
      path = event.composedPath()
    else if event.path
      path = event.path
    else
      path = [event.target].concat(luda.$parents '*', event.target)

  on: (event, selector..., handler) ->
    switch event
      when @_DOC_READY then @_onDocReady handler
      when @_FORM_RESET then @_onReset selector[0], handler
      when @_SWIPE_LEFT, \
      @_SWIPE_RIGHT, \
      @_SWIPE_UP, \
      @_SWIPE_DOWN, \
      @_SWIPE_LEFT_OR_UP, \
      @_SWIPE_RIGHT_OR_DOWN
      then @_onSwipe event, selector[0], handler
      else @_on event, selector[0], handler

  onOpposite: (event, selector, handler) ->
    _self = this
    document.addEventListener event, (e) ->
      trigger = _self.eventPath(e).every ($element) ->
        not $element.matches or not $element.matches selector
      handler e if trigger

  dispatch: ($target, type, detail, delayMilliseconds, options = {}) ->
    options.bubbles = true unless typeof options.bubbles is 'boolean'
    options.cancelable = true unless typeof options.cancelable is 'boolean'
    options.composed = true unless typeof options.composed is 'boolean'
    evt = new Event "#{@_EVENT_TYPE_PREFIX}:#{type}", options
    evt.detail = detail
    if typeof delayMilliseconds is 'number'
      setTimeout ->
        $target.dispatchEvent evt if $target
      , delayMilliseconds
    else
      $target.dispatchEvent evt
      evt
  
  _onDocReady: (handler) ->
    if document.readyState is 'loading'
      document.addEventListener 'DOMContentLoaded', handler
    else
      handler()

  _onReset: (selector, handler) ->
    document.addEventListener 'reset', (e) ->
      if selector?
        luda.$children(selector, e.target).forEach ($element) ->
          handler.bind($element)(e)
      else
        handler e
 
  _onSwipe: (event, selector, handler) ->
    _self = this
    watch = false
    $touchStartElement = document
    touchStartE = null
    touchStartX = 0
    touchStartY = 0
    document.addEventListener 'touchstart', (e) ->
      if e.touches.length is 1
        touchStartX = e.touches[0].screenX
        touchStartY = e.touches[0].screenY
        if selector?
          _self.eventPath(e).some ($element) ->
            if $element.matches and $element.matches selector
              $touchStartElement = $element
              touchStartE = e
              watch = true
              return true
        else
          watch = true

    document.addEventListener 'touchmove', (e) ->
      if watch and e.touches.length is 1
        touchDistanceX = e.touches[0].screenX - touchStartX
        touchDistanceY = e.touches[0].screenY - touchStartY
        eventX = undefined
        eventY = undefined
        eventXOrY = undefined
        if Math.abs(touchDistanceX) >= _self._SWIPE_DISTANCE
          if touchDistanceX > 0
            eventX = _self._SWIPE_RIGHT
          else
            eventX = _self._SWIPE_LEFT
        if Math.abs(touchDistanceY) >= _self._SWIPE_DISTANCE
          if touchDistanceY > 0
            eventY = _self._SWIPE_DOWN
          else
            eventY = _self._SWIPE_UP
        if eventX is _self._SWIPE_LEFT \
        or eventY is _self._SWIPE_UP
          eventXOrY = _self._SWIPE_LEFT_OR_UP
        if eventX is _self._SWIPE_RIGHT \
        or eventY is _self._SWIPE_DOWN
          eventXOrY = _self._SWIPE_RIGHT_OR_DOWN
        if (eventX? and eventX is event) \
        or (eventY? and eventY is event) \
        or eventXOrY is event
          if selector?
            _self.eventPath(e).some ($element) ->
              if $element is $touchStartElement
                watch = false
                handler.bind($element)(touchStartE, e)
                return true
          else
            watch = false
            handler touchStartE, e

  _on: (event, selector, handler) ->
    if selector is window
      window.addEventListener event, (e) -> handler e
    else
      _self = this
      document.addEventListener event, (e) ->
        if selector?
          _self.eventPath(e).some ($element) ->
            if $element.matches and $element.matches selector
              handler.bind($element)(e)
              return true
        else
          handler e