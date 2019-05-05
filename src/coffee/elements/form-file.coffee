import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'



luda class extends luda.Factory

  @_SCOPE: 'fmFile'

  @_VALUE_SPLITOR: '   '
  @_SELECTOR: '.fm-file'
  @_FILE_SELECTOR: 'input[type=file]'
  @_SIMULATOR_SELECTOR: 'input:not([type=file])'
  @_PLACEHOLDER_ATTRIBUTE: 'placeholder'
  @_VALUE_ATTRIBUTE: 'value'

  @_observerConfig:
    childList: true
    subtree: true

  reset: ->
    @_$file.value = ''
    @_setSimulatorInitialValue()

  _getConfig: ->
    _$file = luda.$child @constructor._FILE_SELECTOR, @_$component
    _$simulator = luda.$child \
    @constructor._SIMULATOR_SELECTOR, @_$component
    {_$file, _$simulator}

  _constructor: ->
    {
      @_$file,
      @_$simulator
    } = @_getConfig()
    @_init()

  _onMutations: ->
    @_constructor()

  _insertSimulator: ->
    @_$simulator = document.createElement 'input'
    @_$simulator.tabIndex = -1
    luda.$after @_$simulator, @_$file

  _setPlaceholderValue: ->
    if @_$file.hasAttribute @constructor._PLACEHOLDER_ATTRIBUTE
      @_$simulator.placeholder = \
      @_$file.getAttribute @constructor._PLACEHOLDER_ATTRIBUTE

  _setSimulatorValue: ->
    values = []
    Array.from(@_$file.files).map (file) -> values.push file.name
    if values.length
      return @_$simulator.value = values.join @constructor._VALUE_SPLITOR
    @_setSimulatorInitialValue()
      
  _setSimulatorInitialValue: ->
    if @_$file.hasAttribute(@constructor._VALUE_ATTRIBUTE)
      @_$simulator.value = @_$file.getAttribute @constructor._VALUE_ATTRIBUTE

  _init: ->
    if @_$file
      @_insertSimulator() unless @_$simulator
      @_setPlaceholderValue()
      @_setSimulatorValue()

  @reset: ($file) -> @query($file).reset()

  @_init: ->
    self = this
    luda.on 'change', "#{@_SELECTOR} #{@_FILE_SELECTOR}", (e) ->
      self.query(luda.$parent self._SELECTOR, this)._setSimulatorValue()
    luda.on luda._FORM_RESET, @_SELECTOR, (e) ->
      setTimeout => self.query(this)._setSimulatorValue()