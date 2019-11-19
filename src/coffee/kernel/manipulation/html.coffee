import luda from '../base/luda.coffee'
import clean from './helpers/clean.coffee'



luda.include

  html: (html) ->
    return @els[0].innerHTML if html is undefined and @els.length
    @els.forEach (el) ->
      clean child for child in el.children
      el.innerHTML = html
    this