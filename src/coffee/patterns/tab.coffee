import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'tab'

  @_SELECTOR: '.tab'
  @_PANE_SELECTOR: '.tab-pane'
  @_INDICATOR_SELECTOR: '.tab-indicators .btn-radio input[type=radio]'
  @_PANE_ACTIVE_CSS_CLASS: 'tab-pane-active'
  @_ACTIVE_INDEX: 0

  @_observerConfig:
    childList: true
    subtree: true
 
  # public
  activate: (index) ->
    if @_$panes.length and not @_isTransitioning()
      activatedIndex = @_activeIndex
      if index? \
      and index isnt @_activeIndex \
      and 0 <= index <= @_$panes.length - 1
        return unless @_canTransition index, activatedIndex
        @_activeIndex = index
        @_activate activatedIndex


  # private
  _getConfig: ->
    _$panes = luda.$unnested \
    @constructor._PANE_SELECTOR, @_$component, @constructor._SELECTOR
    _$indicators = luda.$unnested \
    @constructor._INDICATOR_SELECTOR, @_$component, @constructor._SELECTOR
    _activeIndex = @constructor._ACTIVE_INDEX
    _$indicators.some ($indicator, index) ->
      if $indicator.checked
        _activeIndex = index
        true
    {_$panes, _$indicators, _activeIndex}

  _constructor: ->
    {
      @_$panes,
      @_$indicators,
      @_activeIndex
    } = @_getConfig()
    @_layout()
    @_handleTransitionCancel()

  _onMutations: (mutations) ->
    {
      @_$panes,
      @_$indicators,
      @_activeIndex
    } = @_getConfig()
    @_setIndicatorsState()

  _layout: ->
    @_$panes.forEach ($pane, index) =>
      $pane.style.transition = 'none'
      if index is @_activeIndex
        $pane.classList.add @constructor._PANE_ACTIVE_CSS_CLASS
      else
        $pane.classList.remove @constructor._PANE_ACTIVE_CSS_CLASS
      luda.reflow $pane
      $pane.style.transition = ''
    @_setIndicatorsState()

  _activate: (activatedIndex) ->
    $pane = @_$panes[@_activeIndex]
    $activatedPane = @_$panes[activatedIndex]
    $pane.classList.add @constructor._PANE_ACTIVE_CSS_CLASS
    $activatedPane.classList.remove @constructor._PANE_ACTIVE_CSS_CLASS
    @_handleTransitionEnd @_activeIndex, activatedIndex
    @_setIndicatorsState()

  _canTransition: (activeIndex, activatedIndex) ->
    not @_activatePrevented(@_$panes[activeIndex], activeIndex) \
    and not @_deactivatePrevented(@_$panes[activatedIndex], activatedIndex)

  _handleTransitionEnd: (activeIndex, activatedIndex) ->
    activateDuration = \
    @_handleActivateEnd @_$panes[activeIndex], activeIndex
    deactivateDuration = \
    @_handleDeactivateEnd @_$panes[activatedIndex], activatedIndex

  _handleTransitionCancel: ->
    if @_isActivating()
      index = parseInt @_getActivatingMark(), 10
      @_handleActivateCancel @_$panes[index], index
    if @_isDeactivating()
      activatedIndex = parseInt @_getDeactivatingMark(), 10
      @_handleDeactivateCancel @_$panes[activatedIndex], activatedIndex

  _setIndicatorsState: ->
    @_$indicators.forEach ($indicator, index) =>
      if index is @_activeIndex
        $indicator.setAttribute 'checked', ''
        $indicator.checked = true
      else
        $indicator.removeAttribute 'checked'
        $indicator.checked = false

  @activate: ($tab, index) -> @query($tab).activate index

  # static private
  @_init: ->
    self = this
    luda.on 'change', @_INDICATOR_SELECTOR, (e) ->
      if this.checked
        instance = self.query luda.$parent self._SELECTOR, this
        instance._setIndicatorsState()
        instance.activate instance._$indicators.indexOf this