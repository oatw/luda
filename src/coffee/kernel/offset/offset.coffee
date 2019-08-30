import luda from '../base/luda.coffee'



luda.include

  offset: ->
    el = @els[0]
    return unless el
    docEl = document.documentElement
    rect = el.getBoundingClientRect()
    top: rect.top + window.pageYOffset - docEl.clientTop
    left: rect.left + window.pageXOffset - docEl.clientLeft