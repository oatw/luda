import luda from '../base/luda.coffee'
import find from '../base/find.coffee'
import unique from '../base/unique.coffee'



luda.include

  find: (selector) ->
    all = []
    @els.forEach (el) ->
      found = find selector, el
      [].push.apply(all, found) if found.length
    luda unique(all)