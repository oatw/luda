import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'


luda.include
  
  filter: (comparator) ->
    return luda() unless comparator
    luda collect(@els, comparator)