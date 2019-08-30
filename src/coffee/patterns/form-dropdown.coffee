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

  splitor: '   '

.protect

  disableSimulator: ->
    @simulator.data('auto', false).attr('readonly', '')

  updateValue: ->
    values = []
    @options.els.forEach (input, index) =>
      return unless input.checked
      label = luda @labels.els[index]
      value = label.data(@data.label) or label.text()
      values.push value if value and not values.includes value
    @simulator.attr 'value', values.join(@splitor)

  triggerClick: -> @simulator.trigger 'click'

.help

  find: ->
    options: @selector.options
    labels: @selector.labels
    simulator: @selector.simulator

  create: ->
    @disableSimulator()
    @updateValue()

  watch: ->
    dom: [
      [@selector.options, @updateValue]
    ]
    attr: [
      ['checked', @selector.options, @updateValue]
    ]

  listen: ->
    luda.mixin('resetable').get('listen').call this, @updateValue
    [
      ['change', @selector.options, @updateValue]
      ['keydown@enter', @selector.simulator, @triggerClick]
    ]