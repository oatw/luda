import '../kernel/index.coffee'
import '../mixins/resetable.coffee'



luda.component 'fmFile'

.protect

  selector:
    root: '.fm-file'
    file: 'input[type=file]'
    simulator: 'input:not([type=file])'

  data:
    initValue: 'data-fm-file_value'

  splitor: '  '

.protect

  insertSimulator: ->
    return if @simulator.length
    simulator = luda '<input>'
    simulator.els[0].tabIndex = -1
    simulator.insertAfter @file

  updatePlaceholder: ->
    return unless placeholder = @file.attr 'placeholder'
    @simulator.attr 'placeholder', placeholder

  updateValue: ->
    values = Array.from(@file.els[0].files).map (f) -> f.name
    value = values.join(@splitor) or @file.attr('value') or ''
    @simulator.attr 'value', value

  tryReset: (target, oldVal) ->
    return unless @file.attr('value') is ''
    @file.els[0].value = ''
    @file.attr 'value', oldVal

.help

  find: ->
    file: @selector.file
    simulator: @selector.simulator

  watch: ->
    attr: [['value', @selector.file, @tryReset, @updateValue]]

  create: ->
    @insertSimulator()
    @updatePlaceholder()
    @updateValue()

  listen: ->
    luda.mixin('resetable').get('listen').call this, @updateValue
    [['change', @selector.file, @updateValue]]