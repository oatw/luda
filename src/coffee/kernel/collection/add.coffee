import luda from '../base/luda.coffee'
import unique from '../base/unique.coffee'



luda.include

  add: (selector, context) ->
    luda unique(@els.concat luda(selector, context).els)