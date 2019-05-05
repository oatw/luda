import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'carousel'

  @_SELECTOR: '.carousel'
  @_ITEMS_SELECTOR: '.carousel-item'
  @_PREV_CONTROL_SELECTOR: '.carousel-prev'
  @_NEXT_CONTROL_SELECTOR: '.carousel-next'
  @_INDICATORS_SELECTOR: '.carousel-indicators .btn'
  @_INTERVAL_ATTRIBUTE: 'data-carousel-interval'
  @_WRAP_ATTRIBUTE: 'data-carousel-wrap'
  @_ACTIVATED_INDEX_ATTRIBUTE: 'data-carousel-activated-index'
  @_ITEM_ACTIVE_CSS_CLASS: 'carousel-item-active'
  @_ITEM_NEXT_CSS_CLASS: 'carousel-item-next'
  @_ITEM_PREV_CSS_CLASS: 'carousel-item-prev'
  @_ACTIVE_INDEX: 0
  @_INTERVAL: 5000
  @_WRAP: true
  @_FALSE: 'false'

  @_observerConfig:
    childList: true
    attributes: true
    subtree: true
    attributeFilter: [@_INTERVAL_ATTRIBUTE, @_WRAP_ATTRIBUTE]
 
  # public
  activate: (index) ->
    if @_$items.length and not @_isTransitioning()
      activatedIndex = @_activeIndex
      if index? \
      and index isnt @_activeIndex \
      and 0 <= index <= @_$items.length - 1 \
      and @_canTransition(index, activatedIndex)
        @_activeIndex = index
        action = if index < activatedIndex then '_slidePrev' else '_slideNext'
        @[action] activatedIndex

  next: ->
    if @_$items.length and not @_isTransitioning()
      activatedIndex = @_activeIndex
      index = activatedIndex + 1
      if index > @_$items.length - 1
        return unless @_wrap
        index = 0
      return unless @_canTransition(index, activatedIndex)
      @_activeIndex = index
      @_slideNext activatedIndex
      @_playTimeStamp = Date.now()
      @_pausedRemainTime = @_interval

  prev: ->
    if @_$items.length and not @_isTransitioning()
      activatedIndex = @_activeIndex
      index = activatedIndex - 1
      if index < 0
        return unless @_wrap
        index = @_$items.length - 1
      return unless @_canTransition(index, activatedIndex)
      @_activeIndex = index
      @_slidePrev activatedIndex
      @_playTimeStamp = Date.now()
      @_pausedRemainTime = @_interval

  pause: ->
    if @_intervaling?
      clearInterval @_intervaling
      @_intervaling = null
      @_pausedRemainTime = @_pausedRemainTime - (Date.now() - @_playTimeStamp)

  play: ->
    if @_interval and @_$items.length > 1
      @_playTimeStamp = Date.now()
      @pause()
      execute = =>
        @next()
        @_intervaling = setInterval @next.bind(this), @_interval
      @_intervaling = setTimeout execute, @_pausedRemainTime

  # private
  _getConfig: ->
    _$items = luda.$unnested \
    @constructor._ITEMS_SELECTOR, @_$component, @constructor._SELECTOR
    _$indicators = luda.$unnested \
    @constructor._INDICATORS_SELECTOR, @_$component, @constructor._SELECTOR
    _$prevControl = luda.$child \
    @constructor._PREV_CONTROL_SELECTOR, @_$component
    _$nextControl = luda.$child \
    @constructor._NEXT_CONTROL_SELECTOR, @_$component
    _activeIndex = _$items.indexOf \
    luda.$child ".#{@constructor._ITEM_ACTIVE_CSS_CLASS}", @_$component
    _activeIndex = @constructor._ACTIVE_INDEX if _activeIndex is -1
    _interval = @_$component.getAttribute(@constructor._INTERVAL_ATTRIBUTE)
    if _interval is @constructor._FALSE
      _interval = false
    else
      _interval = Math.abs(parseInt _interval, 10) or @constructor._INTERVAL
    _wrap = @_$component.getAttribute(@constructor._WRAP_ATTRIBUTE)
    _wrap = if _wrap is @constructor._FALSE then false else @constructor._WRAP
    {
      _$items,
      _$indicators,
      _$prevControl,
      _$nextControl,
      _activeIndex,
      _interval,
      _wrap
    }

  _constructor: ->
    {
      @_$items,
      @_$indicators,
      @_$prevControl,
      @_$nextControl,
      @_activeIndex,
      @_interval,
      @_wrap
    } = @_getConfig()
    @_intervaling = null
    @_playTimeStamp = 0
    @_pausedRemainTime = @_interval
    @_layout()
    @_handleTransitionCancel()
    @play()

  _onMutations: (mutations) ->
    {
      @_$items,
      @_$indicators,
      @_$prevControl,
      @_$nextControl,
      @_activeIndex,
      @_interval,
      @_wrap
    } = @_getConfig()
    @_setIndicatorsState()
    @_setDirectionControlState()
    @play()

  _destroy: ->
    @pause()

  _layout: ->
    @_$items.forEach ($item, index) =>
      $item.style.transition = 'none'
      if index > @_activeIndex
        $item.classList.add @constructor._ITEM_NEXT_CSS_CLASS
        $item.classList.remove @constructor._ITEM_PREV_CSS_CLASS
        $item.classList.remove @constructor._ITEM_ACTIVE_CSS_CLASS
      else if index < @_activeIndex
        $item.classList.add @constructor._ITEM_PREV_CSS_CLASS
        $item.classList.remove @constructor._ITEM_NEXT_CSS_CLASS
        $item.classList.remove @constructor._ITEM_ACTIVE_CSS_CLASS
      else
        $item.classList.add @constructor._ITEM_ACTIVE_CSS_CLASS
        $item.classList.remove @constructor._ITEM_NEXT_CSS_CLASS
        $item.classList.remove @constructor._ITEM_PREV_CSS_CLASS
      luda.reflow $item
      $item.style.transition = ''
    @_setIndicatorsState()
    @_setDirectionControlState()

  _slideNext: (activatedIndex) ->
    if @_$items.length > 1
      $item = @_$items[@_activeIndex]
      $activatedItem = @_$items[activatedIndex]
      $item.style.transition = 'none'
      $item.classList.remove @constructor._ITEM_PREV_CSS_CLASS
      $item.classList.add @constructor._ITEM_NEXT_CSS_CLASS
      luda.reflow $item
      $item.style.transition = ''
      $item.classList.remove @constructor._ITEM_NEXT_CSS_CLASS
      $item.classList.add @constructor._ITEM_ACTIVE_CSS_CLASS
      $activatedItem.classList.remove @constructor._ITEM_ACTIVE_CSS_CLASS
      $activatedItem.classList.add @constructor._ITEM_PREV_CSS_CLASS
      @_handleTransitionEnd @_activeIndex, activatedIndex
      @_setIndicatorsState()
      @_setDirectionControlState()

  _slidePrev: (activatedIndex) ->
    if @_$items.length > 1
      $item = @_$items[@_activeIndex]
      $activatedItem = @_$items[activatedIndex]
      $item.style.transition = 'none'
      $item.classList.remove @constructor._ITEM_NEXT_CSS_CLASS
      $item.classList.add @constructor._ITEM_PREV_CSS_CLASS
      luda.reflow $item
      $item.style.transition = ''
      $item.classList.remove @constructor._ITEM_PREV_CSS_CLASS
      $item.classList.add @constructor._ITEM_ACTIVE_CSS_CLASS
      $activatedItem.classList.remove @constructor._ITEM_ACTIVE_CSS_CLASS
      $activatedItem.classList.add @constructor._ITEM_NEXT_CSS_CLASS
      @_handleTransitionEnd @_activeIndex, activatedIndex
      @_setIndicatorsState()
      @_setDirectionControlState()

  _canTransition: (activeIndex, activatedIndex) ->
    not @_activatePrevented(@_$items[activeIndex], activeIndex) \
    and not @_deactivatePrevented(@_$items[activatedIndex], activatedIndex)

  _handleTransitionEnd: (activeIndex, activatedIndex) ->
    activateDuration = \
    @_handleActivateEnd @_$items[activeIndex], activeIndex
    deactivateDuration = \
    @_handleDeactivateEnd @_$items[activatedIndex], activatedIndex

  _handleTransitionCancel: ->
    if @_isActivating()
      index = parseInt @_getActivatingMark(), 10
      @_handleActivateCancel @_$items[index], index
    if @_isDeactivating()
      activatedIndex = parseInt @_getDeactivatingMark(), 10
      @_handleDeactivateCancel @_$items[activatedIndex], activatedIndex

  _setIndicatorsState: ->
    @_$indicators.forEach ($indicator, index) =>
      $indicator.disabled = index is @_activeIndex

  _setDirectionControlState: ->
    if @_$items.length <= 1
      @_$prevControl?.disabled = @_$nextControl?.disabled = true
    else
      @_$prevControl?.disabled = @_activeIndex is 0 and not @_wrap
      @_$nextControl?.disabled = \
      @_activeIndex is @_$items.length - 1 and not @_wrap
  
  @activate: ($carousel, index) -> @query($carousel).activate index

  @next: ($carousel) -> @query($carousel).next()

  @prev: ($carousel) -> @query($carousel).prev()

  @pause: ($carousel) -> @query($carousel).pause()

  @play: ($carousel) -> @query($carousel).play()

  # static private
  @_init: ->
    self = this
    luda.on 'click', @_INDICATORS_SELECTOR, (e) ->
      instance = self.query luda.$parent self._SELECTOR, this
      instance.activate instance._$indicators.indexOf this
    luda.on 'touchstart', @_SELECTOR, (e) ->
      self.query(this).pause()
    luda.on 'touchend', @_SELECTOR, (e) ->
      setTimeout => self.query(this).play()
    luda.on 'mouseover', @_SELECTOR, (e) ->
      self.query(this).pause()
    luda.on 'mouseout', @_SELECTOR, (e) ->
      self.query(this).play()
    luda.on luda._SWIPE_LEFT_OR_UP, @_SELECTOR, (startE, e) ->
      self.query(this).next()
    luda.on luda._SWIPE_RIGHT_OR_DOWN, @_SELECTOR, (startE, e) ->
      self.query(this).prev()
    luda.on 'click', @_PREV_CONTROL_SELECTOR, (e) ->
      self.query(luda.$parent self._SELECTOR, this).prev()
    luda.on 'click', @_NEXT_CONTROL_SELECTOR, (e) ->
      self.query(luda.$parent self._SELECTOR, this).next()