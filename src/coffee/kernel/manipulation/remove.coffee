import luda from '../base/luda.coffee'
import clean from './helpers/clean.coffee'



luda.include

  remove: ->
    @els.forEach (el) ->
      clean el
      parent.removeChild el if parent = el.parentNode
    this