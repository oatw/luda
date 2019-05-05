import './install.coffee'
import './utilities.coffee'
import './dom.coffee'
import './event.coffee'




luda class Factory

  @_SCOPE: 'Factory'
  
  @_COMPONENT_NO_SELECTOR_ERROR: 'Extended component must has a css selector'
  @_$COMPONENT_INVALID_ERROR: '@param $component must be an instance of Element'
  @_SELECTOR: ''

  @_ACTIVATE_EVENT_TYPE: -> "#{@_SCOPE}:activate"
  @_ACTIVATED_EVENT_TYPE: -> "#{@_SCOPE}:activated"
  @_DEACTIVATE_EVENT_TYPE: -> "#{@_SCOPE}:deactivate"
  @_DEACTIVATED_EVENT_TYPE: -> "#{@_SCOPE}:deactivated"
  @_ACTIVATING_MARK_ATTRIBUTE: -> "data-#{@_SCOPE}-activating"
  @_DEACTIVATING_MARK_ATTRIBUTE: -> "data-#{@_SCOPE}-deactivating"

  @_instances: []

  @_Observed: []
  @_observer: null
  @_observerConfig:
    childList: true
    subtree: true

  _hasDescendant: (descendant) ->
    if @_children.length and descendant
      return true if @_children.includes descendant
      return @_children.some (child) -> child._hasDescendant descendant
    else
      return false

  _observe: ->
    @_observer = new MutationObserver @_onMutations.bind this
    @_observer.observe @_$component, @constructor._observerConfig

  _disconnect: ->
    @_observer.disconnect()
    @_observer = null

  _activatePrevented: ($ele, detail) ->
    activateEvent = luda.dispatch($ele, \
    @constructor._ACTIVATE_EVENT_TYPE(), detail)
    activateEvent.defaultPrevented

  _deactivatePrevented: ($ele, detail) ->
    deactivateEvent = luda.dispatch($ele, \
    @constructor._DEACTIVATE_EVENT_TYPE(), detail)
    deactivateEvent.defaultPrevented

  _handleActivateEnd: ($ele, detail) ->
    @_setActivatingMark detail
    activateDuration = luda.getTransitionDuration $ele
    luda.dispatch($ele, \
    @constructor._ACTIVATED_EVENT_TYPE(), detail, \
    activateDuration)
    setTimeout =>
      @_removeActivatingMark() if @_$component
    , activateDuration
    activateDuration

  _handleDeactivateEnd: ($ele, detail) ->
    @_setDeactivatingMark detail
    deactivateDuration = luda.getTransitionDuration $ele
    luda.dispatch($ele, \
    @constructor._DEACTIVATED_EVENT_TYPE(), detail, \
    deactivateDuration)
    setTimeout =>
      @_removeDeactivatingMark() if @_$component
    , deactivateDuration
    deactivateDuration

  _handleActivateCancel: ($ele, detail) ->
    if @_isActivating()
      luda.dispatch($ele, \
      @constructor._ACTIVATED_EVENT_TYPE(), detail)
      @_removeActivatingMark()

  _handleDeactivateCancel: ($ele, detail) ->
    if @_isDeactivating()
      luda.dispatch($ele, \
      @constructor._DEACTIVATED_EVENT_TYPE(), detail)
      @_removeDeactivatingMark()

  _isActivating: ->
    @_$component.hasAttribute @constructor._ACTIVATING_MARK_ATTRIBUTE()

  _isDeactivating: ->
    @_$component.hasAttribute @constructor._DEACTIVATING_MARK_ATTRIBUTE()

  _isTransitioning: ->
    @_isActivating() or @_isDeactivating()

  _getActivatingMark: ->
    @_$component.getAttribute @constructor._ACTIVATING_MARK_ATTRIBUTE()

  _getDeactivatingMark: ->
    @_$component.getAttribute @constructor._DEACTIVATING_MARK_ATTRIBUTE()

  _removeActivatingMark: ->
    @_$component.removeAttribute @constructor._ACTIVATING_MARK_ATTRIBUTE()

  _removeDeactivatingMark: ->
    @_$component.removeAttribute @constructor._DEACTIVATING_MARK_ATTRIBUTE()

  _setActivatingMark: (value) ->
    @_$component.setAttribute @constructor._ACTIVATING_MARK_ATTRIBUTE(), value

  _setDeactivatingMark: (value) ->
    @_$component.setAttribute @constructor._DEACTIVATING_MARK_ATTRIBUTE(), value

  @create: ($component) ->
    componentIsElementInstance = $component instanceof Element
    throw new Error @_$COMPONENT_INVALID_ERROR unless componentIsElementInstance
    $family = @_query$family $component
    instance = @query $component
    if $family._$parent
      if parent = @query $family._$parent
        @_instances.push instance = @_createInstance $component unless instance
        if instance._parent isnt parent
          parent._children.push(instance) and (instance._parent = parent)
        $family._$children.forEach ($child) => @create $child
        return instance
      else
        @create $family._$parent
        return @query $component
    else
      @_instances.push instance = @_createInstance $component unless instance
      $family._$children.forEach ($child) => @create $child
      return instance

  @destroy: (instance$component) ->
    instance = @query instance$component
    if instance
      instance._disconnect() if instance._observer
      instance._destroy() if instance._destroy
      @destroy instance._children[0] while instance._children.length
      if instance._parent
        luda.except instance, instance._parent._children
      luda.except instance, @_instances
      for attribute, value of instance
        instance[attribute] = null
        
  @query: (instance$component) ->
    instance = null
    if instance$component instanceof this \
    and @_instances.includes instance$component
      instance = instance$component
    else if instance$component instanceof Element
      @_instances.some (inited) ->
        if inited._$component is instance$component
          instance = inited
          return true
    return instance

  @_query$family: ($component) ->
    _$parent = null
    _$children = []
    if @_SELECTOR
      _$parent = luda.$parent @_SELECTOR, $component
      _$children = luda.$unnested @_SELECTOR, $component, @_SELECTOR
    {_$parent, _$children}

  @_createInstance: ($component) ->
    instance = new this()
    instance._$component = $component
    instance._parent = null
    instance._children = []
    instance._observer = null
    instance._constructor() if instance._constructor
    unless instance._observer and instance._onMutations and @_observerConfig
      instance._observe()
    instance

  @_onEleAdded: ($ele) ->
    Factory._onEleAddedOrRemoved($ele, 'create')

  @_onEleRemoved: ($ele) ->
    Factory._onEleAddedOrRemoved($ele, 'destroy')

  @_onEleAddedOrRemoved: ($ele, action) ->
    Factory._Observed.forEach (Observed) ->
      return Observed[action] $ele if $ele.matches Observed._SELECTOR
      luda.$children(Observed._SELECTOR, $ele).forEach ($child) ->
        Observed[action] $child

  @_observe: (classObj) ->
    unless Factory._observer
      Factory._observer = \
      luda._observeDom Factory._onEleAdded, Factory._onEleRemoved
    unless Factory._Observed.includes classObj
      Factory._Observed.push classObj

  @_install: ->
    self = this
    return this if this is Factory
    unless @_SELECTOR or typeof @_SELECTOR isnt 'string'
      throw new Error @_COMPONENT_NO_SELECTOR_ERROR
    @_instances = [] unless @hasOwnProperty '_instances'
    exposed = @_init() if typeof @_init is 'function'
    luda.on luda._DOC_READY, ->
      luda.$children(self._SELECTOR).forEach ($component) ->
        self.create $component
      Factory._observe(self)
    if exposed then exposed else this