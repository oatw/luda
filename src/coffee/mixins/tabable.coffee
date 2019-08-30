import '../kernel/index.coffee'



luda.mixin 'tabable',

  # cls:
  #   tabable:
  #     active: string           # required
  #     indicatorActive: string  # required
  #     prev: string             # optional
  #     next: string             # optional

  # data:
  #   tabable:
  #     interruption: string  # required
  #     wrap: string          # optional

  # default:
  #   tabable:
  #     activeIndex: integer  # optional
  #     wrap: boolean         # optional

  # evt:
  #   tabable:
  #     activate: string     #required
  #     activated: string    #required
  #     deactivate: string   #required
  #     deactivated: string  #required

  # selector:
  #   tabable:
  #     targets: string     # required
  #     indicators: string  # required
  #     prevCtrl: string    # optional
  #     nextCtrl: string    # optional

  tabableActivate: (index) ->
    return unless luda.isNumeric index
    direction = if index < @tabableActiveIndex() then 'prev' else 'next'
    @tabableSlide index, direction

  tabableNext: ->
    index = @tabableActiveIndex() + 1
    if index >= @tabableTargets.length
      return unless @tabableWrapable()
      index = 0
    @tabableSlide index, 'next'

  tabablePrev: ->
    index = @tabableActiveIndex() - 1
    if index < 0
      return unless @tabableWrapable()
      index = @tabableTargets.length - 1
    @tabableSlide index, 'prev'

  tabableLayout: ->
    @tabableTargets.els.forEach (it, index) =>
      item = luda it
      return if (activeCls = @cls.tabable.active) and item.hasClass activeCls
      return if (nextCls = @cls.tabable.next) and item.hasClass nextCls
      return if (prevCls = @cls.tabable.prev) and item.hasClass prevCls
      isActive = index is @tabableActiveIndex()
      item.css('transition', 'none')
      .toggleClass(activeCls, isActive)
      .toggleClass(prevCls, index < @tabableActiveIndex())
      .toggleClass(nextCls, index > @tabableActiveIndex())
      .reflow().css('transition', '')
      isActive and item.trigger @evt.tabable.activated
    @tabableSetIndicatorsState()
    @tabableSetDirectionCtrlsState()

  tabableSlide: (index, direction) ->
    return unless luda.isNumeric index
    return if index is (activatedIndex = @tabableActiveIndex())
    return if index < 0 or index >= @tabableTargets.length
    item = @tabableTargets.eq index
    activated = @tabableTargets.eq activatedIndex
    activateEvt = item.trigger(@evt.tabable.activate, null, true)[0]
    return if activateEvt.isDefaultPrevented()
    deactivateEvt = activated.trigger(@evt.tabable.deactivate, null, true)[0]
    return if deactivateEvt.isDefaultPrevented()
    oppsite = if direction is 'next' then 'prev' else 'next'
    directionCls = @cls.tabable[direction]
    oppsiteCls = @cls.tabable[oppsite]
    activeCls = @cls.tabable.active
    item.css('transition', 'none')
    .addClass(directionCls).removeClass(oppsiteCls)
    .reflow().css('transition', '')
    .addClass(activeCls).removeClass(directionCls)
    activated.addClass(oppsiteCls).removeClass(activeCls)
    @tabableActivating = setTimeout =>
      delete @tabableActivating
      item.trigger @evt.tabable.activated
    , item.transitionDuration()
    @tabableDeactivateIndex = activatedIndex
    @tabableDeactivating = setTimeout =>
      delete @tabableDeactivating
      delete @tabableDeactivateIndex
      activated.trigger @evt.tabable.deactivated
    , activated.transitionDuration()
    @tabableSetIndicatorsState()
    @tabableSetDirectionCtrlsState()
    true

  tabableActiveIndex: ->
    index = @default?.tabable?.activeIndex or 0
    @tabableTargets.els.some (it, i) =>
      return false unless luda(it).hasClass @cls.tabable.active
      index = i
      true
    index

  tabableWrapable: ->
    wrapAttr = @data.tabable.wrap
    return false unless wrapAttr
    wrapable = @root.data wrapAttr
    return false if wrapable is false
    @default?.tabable?.wrap

  tabableTransitioning: ->
    'tabableActivating' of this or 'tabableDeactivating' of this

  tabableSetIndicatorsState: ->
    @tabableIndicators.els.forEach (it, index) =>
      activeCls = @cls.tabable.indicatorActive
      val = index is @tabableActiveIndex()
      luda(it).toggleClass activeCls, val

  tabableSetDirectionCtrlsState: ->
    prevCtrl = @tabablePrevCtrl
    nextCtrl = @tabableNextCtrl
    return unless prevCtrl or nextCtrl
    if @tabableTargets.length <= 1
      prevDis = nextDis = ''
    else if @tabableWrapable()
      prevDis = nextDis = null
    else
      index = @tabableActiveIndex()
      minIndex = 0
      maxIndex = @tabableTargets.length - 1
      prevDis = if index is minIndex then '' else null
      nextDis = if index is maxIndex then '' else null
    prevCtrl and prevCtrl.attr 'disabled', prevDis
    nextCtrl and nextCtrl.attr 'disabled', nextDis

  tabableActivateOnEvent: (e) ->
    return if @tabableTransitioning()
    index = e.detail?.tabable?.activeIndex
    unless index?
      index = @tabableIndicators.els.indexOf e.currentTarget
    @tabableActivate index

  tabablePrevOnEvent: (e) -> @tabablePrev() unless @tabableTransitioning()

  tabableNextOnEvent: (e) -> @tabableNext() unless @tabableTransitioning()

  tabableDestroy: ->
    if 'tabableActivating' of this
      clearTimeout @tabableActivating
      interruption = {activate: @tabableActiveIndex()}
    if 'tabableDeactivating' of this
      clearTimeout @tabableDeactivating
      interruption ||= {}
      interruption.deactivateIndex = @tabableDeactivateIndex
    @root.data @data.tabable.interruption, interruption

  tabableCreate: ->
    @tabableLayout()
    dataAttr = @data.tabable.interruption
    return unless interruption = @root.data dataAttr
    if (activate = interruption.activated)?
      @tabableTargets.eq(activated).trigger @evt.tabable.activated
    if (deactive = interruption.deactivated)?
      @tabableTargets.eq(deactivated).trigger @evt.tabable.deactivated
    @root.removeData dataAttr

  tabableFind: ->
    conf =
      tabableTargets: @selector.tabable.targets
      tabableIndicators: @selector.tabable.indicators
    conf.tabablePrevCtrl = prevCtrl if prevCtrl = @selector.tabable.prevCtrl
    conf.tabableNextCtrl = nextCtrl if nextCtrl = @selector.tabable.nextCtrl
    conf

  tabableWatch: ->
    attr = []
    wrapAttr = @data.tabable.wrap
    wrapAttr and attr.push [wrapAttr, @tabableSetDirectionControlState]
    attr: attr
    dom: [
      [@selector.tabable.targets, @tabableLayout]
      [@selector.tabable.indicators, @tabableSetIndicatorsState]
    ]

  tabableListen: ->
    listeners = [
      ['click', @selector.tabable.indicators, @tabableActivateOnEvent]
    ]
    if prevCtrl = @selector.tabable.prevCtrl
      listeners.push ['click', prevCtrl, @tabablePrevOnEvent]
    if nextCtrl = @selector.tabable.nextCtrl
      listeners.push ['click', nextCtrl, @tabableNextOnEvent]
    listeners