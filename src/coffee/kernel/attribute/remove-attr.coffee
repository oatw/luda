import luda from '../base/luda.coffee'
import splitValues from '../base/split-values.coffee'



luda.include

  removeAttr: (attr) ->
    attrs = splitValues attr
    return this unless attrs.length
    @els.forEach (el) -> attrs.forEach (att) -> el.removeAttribute att
    this