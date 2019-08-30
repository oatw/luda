import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import unique from '../base/unique.coffee'



luda.include

  children: (comparator) ->
    all = []
    @els.forEach (el) -> [].push.apply(all, el.children)
    luda collect(unique(all), comparator)