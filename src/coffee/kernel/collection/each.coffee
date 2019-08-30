import luda from '../base/luda.coffee'



luda.include

  each: (callback) ->
    @els.some (el, index) -> callback.call(el, el, index) is false
    this