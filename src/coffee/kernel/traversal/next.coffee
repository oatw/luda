import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include

  next: (comparator, _all) ->
    luda collect(unique(pluck(@els, 'nextElementSibling', _all)), comparator)