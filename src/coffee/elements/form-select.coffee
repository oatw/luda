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

  evt:
    changed: 'luda:fmSelect:changed'

.protect

  placeholder: -> @select.attr 'placeholder'

  multiple: -> @select.prop 'multiple'

  options: -> Array.from @select.prop('options')

.protect

  tryEmpty: ->
    selected = @options().some (o) -> luda(o).hasAttr 'selected'
    not selected and @select.prop('selectedIndex', -1)

  markSelected: (markDefault) ->
    markDefault = markDefault is true
    return if markDefault and @root.hasData @data.defaultMarked
    @root.data @data.defaultMarked, '' if markDefault
    @options().forEach (o) =>
      option = luda o
      if markDefault
        val = if option.hasAttr 'selected' then '' else null
        option.data @data.default, val
      else
        val = if o.selected then '' else null
        option.attr 'selected', val

  toggleSimulator: ->
    return @simulator.remove() if @multiple()
    return if @simulator.length
    luda('<input>').prop('tabIndex', -1)
    .attr('placeholder', @placeholder())
    .insertAfter(@select)

  updateSimulatorValue: ->
    return if @multiple()
    selected = @options()[@select.prop('selectedIndex')]
    val = if selected then luda(selected).text() else ''
    @simulator.val val

  updateValue: ->
    @updateSimulatorValue()
    oldVal = @selectedVal
    val = @select.val()
    @selectedVal = if luda.isArray(val) then val else [val]
    return if not oldVal or luda.arrayEqual(@selectedVal, oldVal)
    if @multiple()
      selected = @options().filter (o) -> o.selected
    else
      selected = @options()[@select.prop('selectedIndex')]
    @select.trigger @evt.changed, {value: val, selected: selected}

  reset: ->
    @select.prop 'selectedIndex', -1
    @options().forEach (o) =>
      o.selected = luda(o).hasData @data.default
    @markSelected()

.help

  find: ->
    select: @selector.select
    simulator: @selector.simulator

  create: ->
    @tryEmpty()
    @markSelected true
    @toggleSimulator()
    @updateValue()

  watch: ->
    node: [
      [@selector.options, @tryEmpty, @updateValue]
    ]
    attr: [
      ['selected', @selector.options, @tryEmpty, @updateValue]
      ['multiple', @selector.select, @toggleSimulator, @updateValue]
    ]

  listen: ->
    luda.mixin('resetable').get('listen').call this, @reset
    [['change', @selector.select, @markSelected]]