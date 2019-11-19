import luda from '../base/luda.coffee'



luda.include

  hasAttr: (attr) ->
    return false unless attr
    @els.some (el) -> el.hasAttribute attr