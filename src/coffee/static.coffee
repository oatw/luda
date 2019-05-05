import './install.coffee'
import './utilities.coffee'
import './dom.coffee'
import './event.coffee'


  
luda class Static

  @_SCOPE: 'Static'
  
  @_SELECTOR_INVALID_ERROR: '@param selector must be a css selector string'
  @_SELECTORS: []

  @_ACTIVATE_EVENT_TYPE: -> "#{@_SCOPE}:activate"
  @_ACTIVATED_EVENT_TYPE: -> "#{@_SCOPE}:activated"
  @_DEACTIVATE_EVENT_TYPE: -> "#{@_SCOPE}:deactivate"
  @_DEACTIVATED_EVENT_TYPE: -> "#{@_SCOPE}:deactivated"
  @_ACTIVATING_MARK_ATTRIBUTE: -> "data-#{@_SCOPE}-activating"
  @_DEACTIVATING_MARK_ATTRIBUTE: -> "data-#{@_SCOPE}-deactivating"

  @_Observed: []
  @_observer: null

  @_selector: ''

  @_add: (selector) ->
    throw new Error @_SELECTOR_INVALID_ERROR if typeof selector isnt 'string'
    @_SELECTORS.push selector unless @_SELECTORS.includes selector
    @_mergeSelectors()

  @_remove: (selector) ->
    throw new Error @_SELECTOR_INVALID_ERROR if typeof selector isnt 'string'
    luda.except selector, @_SELECTORS
    @_mergeSelectors()

  @_mergeSelectors: ->
    @_selector = @_SELECTORS.join ','

  @_activatePrevented: ($ele, detail) ->
    activateEvent = luda.dispatch $ele, @_ACTIVATE_EVENT_TYPE(), detail
    activateEvent.defaultPrevented

  @_deactivatePrevented: ($ele, detail) ->
    deactivateEvent = luda.dispatch $ele, @_DEACTIVATE_EVENT_TYPE(), detail
    deactivateEvent.defaultPrevented

  @_handleActivateEnd: ($ele, detail) ->
    @_setActivatingMark $ele, detail
    activateDuration = luda.getTransitionDuration $ele
    luda.dispatch $ele, @_ACTIVATED_EVENT_TYPE(), detail, activateDuration
    setTimeout =>
      @_removeActivatingMark $ele if $ele
    , activateDuration
    activateDuration

  @_handleDeactivateEnd: ($ele, detail) ->
    @_setDeactivatingMark $ele, detail
    deactivateDuration = luda.getTransitionDuration $ele
    luda.dispatch $ele, @_DEACTIVATED_EVENT_TYPE(), detail, deactivateDuration
    setTimeout =>
      @_removeDeactivatingMark $ele if $ele
    , deactivateDuration
    deactivateDuration

  @_handleActivateCancel: ($ele, detail) ->
    if @_isActivating $ele
      luda.dispatch $ele, @_ACTIVATED_EVENT_TYPE(), detail
      @_removeActivatingMark $ele

  @_handleDeactivateCancel: ($ele, detail) ->
    if @_isDeactivating $ele
      luda.dispatch $ele, @_DEACTIVATED_EVENT_TYPE(), detail
      @_removeDeactivatingMark $ele

  @_isActivating: ($ele) ->
    $ele.hasAttribute @_ACTIVATING_MARK_ATTRIBUTE()

  @_isDeactivating: ($ele) ->
    $ele.hasAttribute @_DEACTIVATING_MARK_ATTRIBUTE()

  @_isTransitioning: ($ele) ->
    @_isActivating($ele) or @_isDeactivating($ele)

  @_getActivatingMark: ($ele) ->
    $ele.getAttribute @_ACTIVATING_MARK_ATTRIBUTE()

  @_getDeactivatingMark: ($ele) ->
    $ele.getAttribute @_DEACTIVATING_MARK_ATTRIBUTE()

  @_removeActivatingMark: ($ele) ->
    $ele.removeAttribute @_ACTIVATING_MARK_ATTRIBUTE()

  @_removeDeactivatingMark: ($ele) ->
    $ele.removeAttribute @_DEACTIVATING_MARK_ATTRIBUTE()

  @_setActivatingMark: ($ele, value) ->
    $ele.setAttribute @_ACTIVATING_MARK_ATTRIBUTE(), value

  @_setDeactivatingMark: ($ele, value) ->
    $ele.setAttribute @_DEACTIVATING_MARK_ATTRIBUTE(), value

  @_onEleAdded: ($ele) ->
    Static._onEleAddedOrRemoved $ele, '_onElementAdded'

  @_onEleRemoved: ($ele) ->
    Static._onEleAddedOrRemoved $ele, '_onElementRemoved'

  @_onEleAddedOrRemoved: ($ele, action) ->
    Static._Observed.forEach (Observed) ->
      return unless Observed[action]
      $matched = luda.$children Observed._selector, $ele
      $matched.unshift $ele if $ele.matches Observed._selector
      $matched.forEach ($target) -> Observed[action] $target

  @_observe: (classObj) ->
    unless Static._observer
      Static._observer = \
      luda._observeDom Static._onEleAdded, Static._onEleRemoved
    if classObj._onElementAdded or classObj._onElementRemoved \
    and classObj._selector
      unless Static._Observed.includes classObj
        Static._Observed.push classObj

  @_install: ->
    self = this
    return this if this is Static
    @_SELECTORS = [] unless @hasOwnProperty '_SELECTORS'
    @_mergeSelectors()
    exposed = @_init() if typeof @_init is 'function'
    luda.on luda._DOC_READY, -> Static._observe(self)
    if exposed then exposed else this