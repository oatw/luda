import luda from '../base/luda.coffee'
import '../collection/filter.coffee'
import './parent.coffee'



luda.include

  closest: (comparator) ->
    return luda() if not comparator or not @els.length
    filtered = @filter comparator
    return filtered if filtered.els.length
    @parent().closest comparator