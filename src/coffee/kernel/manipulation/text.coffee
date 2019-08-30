import luda from '../base/luda.coffee'
import clean from './helpers/clean.coffee'



luda.include

  text: (text) ->
    if text is undefined
      return if @els[0] then @els[0].textContent else ''
    @els.forEach (el) ->
      clean child for child in el.children
      el.textContent = text
    this