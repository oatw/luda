import luda from '../base/luda.coffee'
import find from '../base/find.coffee'
import Type from '../base/type.coffee'
import './filter.coffee'



luda.include

  has: (selector) ->
    if Type.isString selector
      comparator = (el) -> find(selector, el).length > 0
    else
      comparator = (el) -> el.contains selector
    @filter comparator