import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include
  
  parent: (comparator) ->
    if comparator
      plucked = pluck @els, 'parentElement', false, (p) ->
        collect([p], comparator).length
    else
      plucked = pluck @els, 'parentNode'
    luda unique(plucked)