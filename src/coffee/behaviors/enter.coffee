import '../kernel/index.coffee'



luda.component 'enter', document

.protect

  selectors: [
    'input[type=checkbox]'
    'input[type=radio]'
    '[tabindex]'
  ]

.protect

  disabled: -> @html.data('enter') is false

.protect

  trigger: (e) ->
    return if @disabled()
    return unless luda(e.target).is @selectors.join(',')
    e.preventDefault()
    setTimeout -> e.target.click()

.help

  listen: -> [['keydown@enter', @trigger]]