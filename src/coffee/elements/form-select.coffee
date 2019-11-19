import '../kernel/index.coffee'
import '../mixins/resetable.coffee'



luda.component 'fmSelect'

.protect

  selector:
    select: 'select'
    options: 'option'
    simulator: 'input'

  data:
    default: 'data-fm-select_default-selected'
    defaultMarked: 'data-fm-select_default-marked'

.protect

  tryEmpty: ->
    select = @select.els[0]
    selected = Array.from(select.options).some (o) ->
      luda(o).hasAttr 'selected'
    not selected and select.selectedIndex = -1

  markSelected: (markDefault) ->
    markDefault = markDefault is true
    return if markDefault and @root.hasData @data.defaultMarked
    @root.data @data.defaultMarked, '' if markDefault
    Array.from(@select.els[0].options).forEach (o) =>
      option = luda o
      if markDefault
        val = if option.hasAttr 'selected' then '' else null
        option.data @data.default, val
      else
        val = if o.selected then '' else null
        option.attr 'selected', val

  initSimulator: ->
    return @simulator.remove() if @select.els[0].multiple
    return if @simulator.length
    simulator = luda '<input>'
    simulator.els[0].tabIndex = -1
    simulator.insertAfter @select
    @updatePlaceholder()
    @updateValue()

  updatePlaceholder: ->
    return if @select.els[0].multiple
    @simulator.attr 'placeholder', @select.attr('placeholder')

  updateValue: ->
    select = @select.els[0]
    return if select.multiple
    selected = select.options[select.selectedIndex]
    val = if selected then luda(selected).text() else ''
    @simulator.attr 'value', val

  reset: ->
    @select.els[0].selectedIndex = -1
    Array.from(@select.els[0].options).forEach (o) =>
      o.selected = luda(o).hasData @data.default
    @markSelected()

.help

  find: ->
    select: @selector.select
    simulator: @selector.simulator

  create: ->
    @tryEmpty()
    @markSelected true
    @initSimulator()

  watch: ->
    dom: [
      [@selector.options, @tryEmpty, @updateValue]
    ]
    attr: [
      ['selected', @selector.options, @updateValue]
      ['multiple', @selector.select, @initSimulator]
    ]

  listen: ->
    luda.mixin('resetable').get('listen').call this, @reset
    [['change', @selector.select, @markSelected]]