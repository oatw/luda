import luda from '../base/luda.coffee'
import clone from './helpers/clone.coffee'



luda.include

  clone: (cacheAndEvents, deep) ->
    deep = cacheAndEvents if deep is undefined
    collection = @els.map (el) -> clone el, cacheAndEvents, deep
    luda collection