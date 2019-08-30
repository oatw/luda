import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'



luda.include

  not: (comparator) ->
    return this if not comparator or not @els.length
    luda collect(@els, comparator, true)