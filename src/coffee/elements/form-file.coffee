import luda from '../kernel/base/luda.coffee'
import Component from '../kernel/component/component.coffee'
import Resetable from '../mixins/resetable.coffee'
import '../kernel/attribute/attr.coffee'
import '../kernel/data/data.coffee'
import '../kernel/data/has-data.coffee'
import '../kernel/manipulation/insert-after.coffee'



Component 'fmFile'

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
    Resetable.get('listen').call this, @updateValue
    [['change', @selector.file, @updateValue]]