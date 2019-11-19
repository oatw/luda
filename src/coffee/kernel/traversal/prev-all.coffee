import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include

  prevAll: (comparator) ->
    plucked = pluck @els, 'previousElementSibling', true
    luda collect(unique(plucked), comparator)