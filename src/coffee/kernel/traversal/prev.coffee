import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include

  prev: (comparator) ->
    if comparator
      filter = (p) -> collect([p], comparator).length
    luda unique(pluck @els, 'previousElementSibling', false, filter)