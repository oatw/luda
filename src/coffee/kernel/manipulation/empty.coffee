import luda from '../base/luda.coffee'
import clean from './helpers/clean.coffee'



luda.include

  empty: ->
    @els.forEach (el) ->
      clean child for child in el.children
      el.textContent = ''
    this