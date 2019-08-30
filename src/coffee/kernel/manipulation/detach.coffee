import luda from '../base/luda.coffee'



luda.include

  detach: ->
    @els.forEach (el) -> parent.removeChild el if parent = el.parentNode
    this