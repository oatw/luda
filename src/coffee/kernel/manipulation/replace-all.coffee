import luda from '../base/luda.coffee'
import './replace-with.coffee'



luda.include

  replaceAll: (selector) ->
    luda(selector).replaceWith this
    this