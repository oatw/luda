import '../kernel/index.coffee'
import '../mixins/resetable.coffee'



luda.component 'fmFile'

.protect

  selector:
    root: '.fm-file'
    file: 'input[type=file]'
    simulator: 'input:not([type=file])'

  evt:
    changed: 'luda:fmFile:changed'

  splitor: '  '

.protect

  placeholder: -> @file.attr 'placeholder'

  value: -> @file.attr 'value'

  multiple: -> @file.prop 'multiple'

.protect

  files: -> Array.from @file.prop('files')

  insertSimulator: ->
    return if @simulator.length
    luda('<input>').prop('tabIndex', -1)
    .attr('placeholder', @placeholder())
    .insertAfter(@file)

  updateSimulatorValue: ->
    values = @files().map (f) -> f.name
    value = values.join(@splitor) or @value() or ''
    @simulator.val value

  updateValue: ->
    @updateSimulatorValue()
    oldFile = @selectedFile
    @selectedFile = @files()
    return if not oldFile or luda.arrayEqual(@selectedFile, oldFile)
    val = if @multiple() then @selectedFile else @selectedFile[0]
    @file.trigger @evt.changed, val

  tryReset: (target, oldVal) ->
    return unless @value() is ''
    return if oldVal is ''
    @file.prop('value', '').attr('value', oldVal or '')

.help

  find: ->
    file: @selector.file
    simulator: @selector.simulator

  watch: ->
    attr: [['value', @selector.file, @tryReset, @updateValue]]

  create: ->
    @insertSimulator()
    @updateValue()

  listen: ->
    luda.mixin('resetable').get('listen').call this, @updateValue
    [['change', @selector.file, @updateValue]]