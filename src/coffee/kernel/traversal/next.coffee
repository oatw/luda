import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include

  next: (comparator) ->
    if comparator
      filter = (n) -> collect([n], comparator).length
    luda unique(pluck @els, 'nextElementSibling', false, filter)