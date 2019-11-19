import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include

  prev: (comparator, _al) ->
    luda collect(unique(pluck(@els, 'previousElementSibling', _al)), comparator)