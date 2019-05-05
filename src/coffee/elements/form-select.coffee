import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'fmSelect'

  @_SELECTOR: '.fm-select'
  @_SELECT_SELECTOR: 'select'
  @_SINGLE_SELECT_SIMULATOR_SELECTOR: 'input'
  @_PLACEHOLDER_ATTRIBUTE: 'placeholder'
  @_MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS: 'fm-select-multiple-placeholder'
  @_DEFAULT_SELECTED_OPTION_ATTRIBUTE: 'data-fm-select-default-selected'
  @_INITED_ATTRIBUTE: 'data-fm-select-inited'

  @_observerConfig:
    childList: true
    attributes: true
    subtree: true
    attributeFilter: ['selected']

  select: (indexOrIndexArray) ->
    if @_$select.multiple
      if @_$multipleSelectPlaceholder
        selectedIndexes = indexOrIndexArray
      else
        selectedIndexes = indexOrIndexArray.map (index) -> index + 1
      Array.from(@_$select.options).forEach ($option, index) ->
        $option.selected = selectedIndexes.includes index
      @_markSelectedOption()
    else
      @_$select.selectedIndex = indexOrIndexArray
      @_setSingleSelectSimulatorValue()
      @_markSelectedOption()

  _getConfig: ->
    _$select = luda.$child @constructor._SELECT_SELECTOR, @_$component
    _$singleSelectSimulator = luda.$child \
    @constructor._SINGLE_SELECT_SIMULATOR_SELECTOR, @_$component
    _$multipleSelectPlaceholder = luda.$child \
    ".#{@constructor._MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS}", @_$component
    _$defaultSelectedOptions = luda.$children \
    "[#{@constructor._DEFAULT_SELECTED_OPTION_ATTRIBUTE}]", @_$component
    _defaultSelectedOptionMarked = @_$component.hasAttribute \
    @constructor._INITED_ATTRIBUTE
    {
      _$select,
      _$singleSelectSimulator,
      _$multipleSelectPlaceholder,
      _$defaultSelectedOptions,
      _defaultSelectedOptionMarked
    }

  _constructor: ->
    {
      @_$select,
      @_$singleSelectSimulator,
      @_$multipleSelectPlaceholder,
      @_$defaultSelectedOptions,
      @_defaultSelectedOptionMarked
    } = @_getConfig()
    if @_$select
      if @_$select.multiple
        @_initMultipleSelect()
      else
        @_initSingleSelect()
      
  _onMutations: ->
    @_constructor()

  _markSelectedOption: ->
    @_disconnect() if @_observer
    Array.from(@_$select.options).forEach ($option) ->
      if $option.selected
        $option.setAttribute 'selected', 'selected'
      else
        $option.removeAttribute 'selected'
    @_observe() unless @_observer

  _markDefaultSelectedOption: ->
    @_$component.setAttribute @constructor._INITED_ATTRIBUTE, ''
    Array.from(@_$select.options).forEach ($option) =>
      if $option.selected
        $option.setAttribute @constructor._DEFAULT_SELECTED_OPTION_ATTRIBUTE, ''

  _setSingleSelectedDefaultSelectedOption: ->
    hasSelected = Array.from(@_$select.options).some ($option) ->
      $option.getAttribute('selected') is 'selected'
    @_$select.selectedIndex = -1 unless hasSelected

  _insertSingleSelectSimulator: ->
    @_$singleSelectSimulator = document.createElement 'input'
    @_$singleSelectSimulator.tabIndex = -1
    luda.$after @_$singleSelectSimulator, @_$select

  _setSingleSelectPlaceholderValue: ->
    @_$singleSelectSimulator.placeholder = @_$select.getAttribute \
    @constructor._PLACEHOLDER_ATTRIBUTE

  _setSingleSelectSimulatorValue: ->
    if $selectedOption = @_$select.options[@_$select.selectedIndex]
      @_$singleSelectSimulator.value = $selectedOption.innerText
    else
      @_$singleSelectSimulator.value = ''

  _initSingleSelect: ->
    @_insertSingleSelectSimulator() unless @_$singleSelectSimulator
    if @_$select.hasAttribute @constructor._PLACEHOLDER_ATTRIBUTE
      @_setSingleSelectedDefaultSelectedOption()
      @_setSingleSelectPlaceholderValue()
    @_markDefaultSelectedOption() unless @_defaultSelectedOptionMarked
    @_setSingleSelectSimulatorValue()
    @_markSelectedOption()

  _insertMultipleSelectBlankOption: ->
    @_$multipleSelectPlaceholder = document.createElement 'option'
    @_$multipleSelectPlaceholder.className = \
    @constructor._MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS
    @_$multipleSelectPlaceholder.disabled = true
    luda.$prepend @_$multipleSelectPlaceholder, @_$select

  _setMultipleSelectPlaceholderValue: ->
    @_$multipleSelectPlaceholder.innerText = @_$select.getAttribute \
    @constructor._PLACEHOLDER_ATTRIBUTE

  _initMultipleSelect: ->
    unless @_$multipleSelectPlaceholder
      if @_$select.hasAttribute @constructor._PLACEHOLDER_ATTRIBUTE
        @_insertMultipleSelectBlankOption()
        @_setMultipleSelectPlaceholderValue()
    @_markDefaultSelectedOption() unless @_defaultSelectedOptionMarked

  _reset: ->
    if @_$select
      Array.from(@_$select.options).forEach ($option) =>
        $option.selected = @_$defaultSelectedOptions.includes $option
      @_setSingleSelectSimulatorValue() unless @_$select.multiple
      @_markSelectedOption()

  @select: ($select, indexOrIndexArray) ->
    @query($select).select indexOrIndexArray

  @_init: ->
    self = this
    luda.on 'change', "#{@_SELECTOR} #{@_SELECT_SELECTOR}", (e) ->
      instance = self.query(luda.$parent self._SELECTOR, this)
      instance._setSingleSelectSimulatorValue() unless this.multiple
      instance._markSelectedOption()
    luda.on luda._FORM_RESET, @_SELECTOR, (e) ->
      setTimeout => self.query(this)._reset()