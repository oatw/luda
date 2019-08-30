import Component from '../kernel/component/component.coffee'
import Resetable from '../mixins/resetable.coffee'
import '../kernel/attribute/attr.coffee'
import '../kernel/data/data.coffee'
import '../kernel/event/trigger.coffee'
import '../kernel/manipulation/text.coffee'



Component 'fmDropdown'

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
    Resetable.get('listen').call this, @updateValue
    [
      ['change', @selector.options, @updateValue]
      ['keydown@enter', @selector.simulator, @triggerClick]
    ]