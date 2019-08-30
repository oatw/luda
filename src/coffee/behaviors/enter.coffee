import '../kernel/index.coffee'



luda.component 'enter', document

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
    return unless luda(e.target).matches @selectors.join(',')
    e.preventDefault()
    setTimeout -> e.target.click()

.help

  listen: -> [['keydown@enter', @trigger]]