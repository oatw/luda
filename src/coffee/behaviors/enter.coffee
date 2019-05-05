import '../install.coffee'
import '../constants.coffee'
import '../event.coffee'
import '../static.coffee'


luda class extends luda.Static

  @_SCOPE: 'enter'

  @_SELECTORS: [
    'input[type=checkbox]'
    'input[type=radio]'
    '[tabindex]'
  ]

  @_DISABLED_ATTRIBUTE: 'data-enter-disabled'

  @_init: ->
    self = this
    luda.on 'keydown', (e) ->
      if not document.documentElement.hasAttribute(self._DISABLED_ATTRIBUTE) \
      and e.keyCode is luda.KEY_ENTER \
      and e.target.matches(self._selector)
        e.preventDefault()
        setTimeout(-> e.target.click())