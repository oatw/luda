import luda from '../base/luda.coffee'



luda.include

  map: (callback) ->
    collection = @els.map (el, index) -> callback.call(el, el, index)
    luda collection