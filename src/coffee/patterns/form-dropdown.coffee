import '../kernel/index.coffee'
import '../mixins/resetable.coffee'
import './dropdown.coffee'



luda.component 'fmDropdown'

.protect

  selector:
    options: '.dropdown-items .btn-radio input,
              .dropdown-items .btn-check input'
    labels: '.dropdown-items .btn-radio label,
             .dropdown-items .btn-check label'
    simulator: '.fm input'

  data:
    label: 'fm-dropdown-label'

  evt:
    changed: 'luda:fmDropdown:changed'

  splitor: '   '

.protect

  initSimulator: ->
    @simulator.data('auto', false).attr('readonly', '')

  updateSimulatorValue: ->
    values = []
    @options.els.forEach (input, index) =>
      return unless input.checked
      label = @labels.eq index
      value = label.data(@data.label) or label.text()
      values.push value if value and not values.includes value
    @simulator.val values.join(@splitor)

  updateValue: ->
    @updateSimulatorValue()
    oldVal = @selectedVal
    checked = @options.els.filter (input) -> input.checked
    @selectedVal = checked.map (input) -> luda(input).val()
    return if not oldVal or luda.arrayEqual(@selectedVal, oldVal)
    @root.trigger @evt.changed, {value: @selectedVal, selected: checked}

  triggerClick: -> @simulator.trigger 'click'

.help

  find: ->
    options: @selector.options
    labels: @selector.labels
    simulator: @selector.simulator

  create: ->
    @initSimulator()
    @updateValue()

  watch: ->
    node: [
      [@selector.options, @updateValue]
    ]
    attr: [
      ['checked', @selector.options, @updateValue]
      ['type', @selector.options, @updateValue]
    ]

  listen: ->
    luda.mixin('resetable').get('listen').call this, @updateValue
    [
      ['change', @selector.options, @updateValue]
      ['keydown@enter', @selector.simulator, @triggerClick]
    ]