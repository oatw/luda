import Component from '../kernel/component/component.coffee'
import '../kernel/data/data.coffee'



Component 'enter', document

.protect

  data:
    enable: 'enter'

  selectors: [
    'input[type=checkbox]'
    'input[type=radio]'
    '[tabindex]'
  ]

  trigger: (e) ->
    return if @html.data(@data.enable) is false
    return unless e.target.matches @selectors.join(',')
    e.preventDefault()
    setTimeout -> e.target.click()

.help

  listen: -> [['keydown@enter', @trigger]]