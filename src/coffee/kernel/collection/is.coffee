import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'



luda.include

  is: (comparator) ->
    return false if not comparator or not @els.length
    collect(@els, comparator).length > 0