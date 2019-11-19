import '../kernel/index.coffee'



luda.mixin 'toggleable',

  # cls:
  #   toggleable:
  #     active: string  #required

  # data:
  #   toggleable:
  #     interruption: string  # required
  #     toggle: string        # optional

  # default:
  #   toggleable:
  #     trigger: boolean  #optional

  # evt:
  #   toggleable:
  #     activate: string     # required
  #     activated: string    # required
  #     deactivate: string   # required
  #     deactivated: string  # required

  # selector:
  #   toggleable:
  #     target: string  # optional

  toggleableActive: -> @root.hasClass @cls.toggleable.active

  toggleableTriggerable: (e) ->
    return if @toggleableTransitioning()
    return true if /key/.test e.type
    return true unless @root.els[0].contains e.target
    trigger = @default?.toggleable?.trigger
    toggleAttr = @data.toggleable.trigger
    return trigger unless toggleAttr
    evtPath = e.eventPath()
    index = evtPath.indexOf(@root.els[0]) + 1
    evtPath.slice(0, index).some (el) ->
      ins = luda el
      return unless ins.hasData toggleAttr
      trigger = ins.data(toggleAttr) isnt false
      true
    trigger

  toggleableActivate: ->
    return if @toggleableActive()
    evt = @toggleableTarget.trigger(@evt.toggleable.activate, null, true)[0]
    return if evt.isDefaultPrevented()
    clearTimeout @toggleableDeactivating
    delete @toggleableDeactivating
    @root.addClass @cls.toggleable.active
    @toggleableActivating = setTimeout =>
      delete @toggleableActivating
      @toggleableTarget.trigger @evt.toggleable.activated
    , @toggleableTarget.transitionDuration()
    true

  toggleableDeactivate: ->
    return unless @toggleableActive()
    evt = @toggleableTarget.trigger(@evt.toggleable.deactivate, null, true)[0]
    return if evt.isDefaultPrevented()
    clearTimeout @toggleableActivating
    delete @toggleableActivating
    @root.removeClass @cls.toggleable.active
    @toggleableDeactivating = setTimeout =>
      delete @toggleableDeactivating
      @toggleableTarget.trigger @evt.toggleable.deactivated
    , @toggleableTarget.transitionDuration()
    true

  toggleableToggle: (force) ->
    return @toggleableActivate() if force is true
    return @toggleableDeactivate() if force is false
    if @toggleableActive()
      @toggleableDeactivate()
    else
      @toggleableActivate()

  toggleableTransitioning: ->
    'toggleableActivating' of this or 'toggleableDeactivating' of this
  
  toggleableFocusOpener: (e) ->
    if @toggleableActive()
      return @toggleableFocused = document.activeElement
    return unless @toggleableFocused
    if 'focus' of ins = luda @toggleableFocused
      ins.focus not e.detail, e.detail
    else
      @toggleableFocused.focus {preventScroll: e.detail}

  toggleableActivateOnEvent: (e) ->
    return unless @toggleableTriggerable(e) and @toggleableActivate()
    @toggleableFocusOpener(e)
    true

  toggleableDeactivateOnEvent: (e) ->
    return unless @toggleableTriggerable(e) and @toggleableDeactivate()
    @toggleableFocusOpener(e)
    true

  toggleableToggleOnEvent: (e) ->
    return unless @toggleableTriggerable(e) and @toggleableToggle()
    @toggleableFocusOpener(e)
    true

  toggleableCreate: ->
    dataAttr = @data.toggleable.interruption
    return unless interruption = @root.data dataAttr
    evt = @evt.toggleable[interruption]
    @root.removeData dataAttr
    @toggleableTarget.trigger evt

  toggleableDestroy: ->
    if 'toggleableActivating' of this
      interruption = 'activated'
      clearTimeout @toggleableActivating
    else if 'toggleableDeactivating' of this
      interruption = 'deactivated'
      clearTimeout @toggleableDeactivating
    interruption and @root.data @data.toggleable.interruption, interruption

  toggleableFind: ->
    target = @selector?.toggleable?.target
    toggleableTarget: target or -> @root