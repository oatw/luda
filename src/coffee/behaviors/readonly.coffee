import '../install.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'readonly'
  @_READONLY_ATTRIBUTE: 'data-readonly'
  @_ORIGINAL_TABINDEX_ATTRIBUTE: 'data-readonly-tabindex'
  @_READONLY_FALSE_VALUE: 'false'
  @_SELECTOR: "[#{@_READONLY_ATTRIBUTE}]"

  @_observerConfig:
    attributes: true
    attributeFilter: [@_READONLY_ATTRIBUTE]

  _getConfig: ->
    readonly = @_$component.getAttribute @constructor._READONLY_ATTRIBUTE
    _isReadonly = readonly isnt @constructor._READONLY_FALSE_VALUE
    {_isReadonly}
    
  _constructor: ->
    {
      @_isReadonly
    } = @_getConfig()
    @_setOriginalTabIndex()
    @_setTabIndex()

  _onMutations: ->
    @_constructor()

  _setOriginalTabIndex: ->
    unless @_$component.hasAttribute \
    @constructor._ORIGINAL_TABINDEX_ATTRIBUTE
      @_$component.setAttribute \
      @constructor._ORIGINAL_TABINDEX_ATTRIBUTE, @_$component.tabIndex

  _setTabIndex: ->
    if @_isReadonly
      @_$component.tabIndex = -1
    else
      @_$component.tabIndex = \
      @_$component.getAttribute @constructor._ORIGINAL_TABINDEX_ATTRIBUTE