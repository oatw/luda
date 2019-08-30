import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import pluck from '../base/pluck.coffee'
import unique from '../base/unique.coffee'



luda.include
  
  parent: (comparator) ->
    return luda unique(pluck @els, 'parentNode') unless comparator
    parents = []
    @els.forEach (el) ->
      while parent = el.parentNode
        matched = collect([parent], comparator)[0]
        return parents.push matched if matched
        el = parent
    luda unique(parents)