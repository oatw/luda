import '../install.coffee'
import '../constants.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../static.coffee'



luda class extends luda.Static

  @_SCOPE: 'tabulate'

  @_SELECTORS: ['input[type=radio]:not([disabled])']

  @_DISABLED_ATTRIBUTE: 'data-tabulate-disabled'

  @_querySameName$radios: ($radio) ->
    if $radio.name
      selector = "#{@_selector}[name=#{$radio.name}]"
    else
      selector = @_selector
    $inputs = luda.$children selector
    $inputs.filter ($input) -> $input.tabIndex >= 0

  @_query$prev$next: ($radio) ->
    $sameNameRadios = @_querySameName$radios $radio
    radioIndex = $sameNameRadios.indexOf $radio
    $prev = $sameNameRadios[radioIndex - 1]
    $next = $sameNameRadios[radioIndex + 1]
    {$prev, $next}

  @_init: ->
    self = this
    luda.on 'keydown', (e) ->
      if not document.documentElement.hasAttribute(self._DISABLED_ATTRIBUTE) \
      and e.keyCode is luda.KEY_TAB \
      and e.target.nodeName.toUpperCase() is 'INPUT' \
      and e.target.type is 'radio'
        if e.shiftKey
          if $prev = self._query$prev$next(e.target).$prev
            e.preventDefault()
            $prev.focus()
        else
          if $next = self._query$prev$next(e.target).$next
            e.preventDefault()
            $next.focus()