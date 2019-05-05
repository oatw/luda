import '../install.coffee'
import '../constants.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'dropdown'
  @_SELECTOR: '.dropdown-fixed,.dropdown-absolute,
               .dropdown-static,.dropdown-absolute-m'
  @_MENU_SELECTOR: '.dropdown-menu'
  @_ITEMS_SELECTOR: 'a[href]:not([disabled]),button:not([disabled]),
                     input:not([disabled]),[tabindex]:not([disabled])'
  @_TOGGLE_ATTRIBUTE: 'data-dropdown-toggle'
  @_TOGGLE_DISABLED_ATTRIBUTE: 'data-dropdown-toggle-disabled'
  @_STANDALONE_ATTRIBUTE: 'data-dropdown-standalone'
  @_SWITCHES_SELECTOR: "[#{@_TOGGLE_ATTRIBUTE}]"
  @_NONE_SWITCHES_SELECTOR: "[#{@_TOGGLE_DISABLED_ATTRIBUTE}]"
  @_ACTIVE_CSS_CLASS: 'dropdown-active'

  @_observerConfig:
    childList: true
    attributes: true
    subtree: true
    attributeFilter: [
      @_TOGGLE_ATTRIBUTE
      @_TOGGLE_DISABLED_ATTRIBUTE
      @_STANDALONE_ATTRIBUTE
    ]

  @_$focused: []

  activate: ->
    return if @_isActive() or @_isTransitioning()
    return if @_activatePrevented @_$menu
    @_$component.classList.add @constructor._ACTIVE_CSS_CLASS
    @constructor._$focused.push document.activeElement
    @_parent?.activate()
    @_handleActivateEnd @_$menu

  deactivate: (focus) ->
    return unless @_isActive() and not @_isTransitioning()
    return if @_deactivatePrevented @_$menu
    @_$component.classList.remove @constructor._ACTIVE_CSS_CLASS
    @_children.forEach (child) -> child.deactivate()
    if focus
      @constructor._$focused[@constructor._$focused.length - 1]?.focus()
    @constructor._$focused.splice @constructor._$focused.length - 1, 1
    @_handleDeactivateEnd @_$menu

  toggle: (focus) ->
    if @_isActive() then @deactivate(focus) else @activate()

  _prev: ->
    if @_$items.length and @_isActive()
      focusIndex = @_$items.indexOf(document.activeElement) - 1
      focusIndex = 0 if focusIndex < 0
      @_$items[focusIndex].focus()

  _next: ->
    if @_$items.length and @_isActive()
      focusIndex = @_$items.indexOf(document.activeElement) + 1
      focusIndex = @_$items.length - 1 if focusIndex > @_$items.length - 1
      @_$items[focusIndex].focus()

  _getConfig: ->
    _$menu = luda.$child @constructor._MENU_SELECTOR, @_$component
    _$switches = luda.$unnested( \
    @constructor._SWITCHES_SELECTOR, @_$component, @constructor._SELECTOR)
    .concat(luda.$unnested \
    @constructor._SWITCHES_SELECTOR, _$menu, @constructor._MENU_SELECTOR)
    _$noneSwitches = luda.$unnested( \
    @constructor._NONE_SWITCHES_SELECTOR, \
    @_$component, @constructor._SELECTOR) \
    .concat(luda.$unnested \
    @constructor._NONE_SWITCHES_SELECTOR, _$menu, @constructor._MENU_SELECTOR)
    _$items = luda.$unnested \
    @constructor._ITEMS_SELECTOR, _$menu, @constructor._MENU_SELECTOR
    _isStandalone = @_$component.hasAttribute @constructor._STANDALONE_ATTRIBUTE
    {_$menu, _$items, _$switches, _$noneSwitches, _isStandalone}

  _constructor: ->
    @_onMutations()
    @_handleActivateCancel @_$menu
    @_handleDeactivateCancel @_$menu

  _onMutations: (mutations) ->
    {
      @_$menu,
      @_$items,
      @_$switches,
      @_$noneSwitches,
      @_isStandalone
    } = @_getConfig()

  _isActive: ->
    @_$component.classList.contains @constructor._ACTIVE_CSS_CLASS

  _deactivateChildrenExcept: (exceptions) ->
    if exceptions and not (exceptions instanceof Array)
      exceptions = [exceptions]
    if exceptions
      @_children.forEach (child) ->
        if child._isActive() and not exceptions.includes child
          child.deactivate()
    else
      @_children.forEach (child) ->
        child.deactivate() if child._isActive()

  @activate: ($dropdown) -> @query($dropdown).activate()

  @deactivate: ($dropdown, focus) -> @query($dropdown).deactivate(focus)

  @toggle: ($dropdown, focus) -> @query($dropdown).toggle focus

  @deactivateExcept: (instances$dropdowns) ->
    exceptions = []
    if instances$dropdowns and not (instances$dropdowns instanceof Array)
      instances$dropdowns = [instances$dropdowns]
    if instances$dropdowns
      instances$dropdowns.forEach (instance$dropdown) =>
        exceptions.push exception if exception = @query instance$dropdown
    if exceptions.length
      @_instances.forEach (instance) ->
        instanceIsntInExceptions = not exceptions.includes instance
        instanceHasntExceptionChild = exceptions.every (exception) ->
          not instance._hasDescendant exception
        if instance._isActive() \
        and instanceIsntInExceptions \
        and instanceHasntExceptionChild
          instance.deactivate()
    else
      @_instances.forEach (instance) ->
        instance.deactivate() if instance._isActive()

  @_standaloneInstances: ->
    @_instances.filter (instance) -> instance if instance._isStandalone

  @_init: ->
    self = this
    luda.onOpposite 'click', @_SELECTOR, (e) ->
      self.deactivateExcept self._standaloneInstances()
    luda.on 'click', @_SELECTOR, (e) ->
      if instance = self.query this
        toggleChecked = false
        focus = not e.detail
        self.deactivateExcept(self._standaloneInstances().concat instance)
        instance._deactivateChildrenExcept()
        instance._parent._deactivateChildrenExcept(instance) if instance._parent
        if instance._$switches.length or instance._$noneSwitches.length
          luda.eventPath(e).some ($path) ->
            if instance._$switches.includes $path
              instance.toggle focus
              toggleChecked = true
            else if instance._$noneSwitches.includes $path
              toggleChecked = true
        instance.toggle focus unless toggleChecked

    luda.onOpposite 'keyup', @_SELECTOR, (e) -> self.deactivateExcept()
    luda.on 'keyup', @_SELECTOR, (e) ->
      if e.keyCode is luda.KEY_TAB and instance = self.query this
        self.deactivateExcept(instance)
        instance.activate()
    luda.on 'keydown', @_SELECTOR, (e) ->
      if e.keyCode is luda.KEY_ESC and instance = self.query this
        e.preventDefault()
        if instance._isActive()
          instance.deactivate true
        else
          instance._parent?.deactivate true
    luda.on 'keydown', @_SELECTOR, (e) ->
      if [luda.KEY_LEFT, luda.KEY_UP].includes(e.keyCode) \
      and instance = self.query this
        e.preventDefault()
        if instance._isActive()
          instance._prev()
        else
          instance._parent?._prev()
      else if [luda.KEY_RIGHT, luda.KEY_DOWN].includes(e.keyCode) \
      and instance = self.query this
        e.preventDefault()
        if instance._isActive()
          instance._next()
        else
          instance._parent?._next()