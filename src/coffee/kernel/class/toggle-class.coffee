import luda from '../base/luda.coffee'
import splitValues from '../base/split-values.coffee'
import parseClass from './helpers/parse-class.coffee'



luda.include

  toggleClass: (cls, force) ->
    classes = splitValues cls
    isForce = force isnt undefined
    return this unless classes.length
    classes = classes.map (c) -> parseClass c
    @els.forEach (el) -> classes.forEach (c) ->
      if isForce
        if force then el.classList.add c else el.classList.remove c
      else
        el.classList.toggle c
    this