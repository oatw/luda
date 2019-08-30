import luda from '../base/luda.coffee'
import collect from '../base/collect.coffee'
import unique from '../base/unique.coffee'
import './children.coffee'
import './parent.coffee'



luda.include

  siblings: (comparator) ->
    all = []
    @els.forEach (el) ->
      sibs = luda(el).parent().children((child) -> child isnt el).els
      [].push.apply all, sibs
    luda collect(unique(all), comparator)