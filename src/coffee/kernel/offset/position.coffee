import luda from '../base/luda.coffee'



luda.include

  position: ->
    el = @els[0]
    return unless el
    left: el.offsetLeft
    top: el.offsetTop