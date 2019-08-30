import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import readValue from '../base/read-value.coffee'
import parseValue from '../base/parse-value.coffee'
import splitValues from '../base/split-values.coffee'
import '../collection/each.coffee'
import './remove-attr.coffee'



luda.include

  attr: (attr, value) ->
    return unless attr
    if Type.isString attr
      if arguments.length >= 2
        return this if value is undefined
        return @removeAttr attr if value is null
        @els.forEach (el) -> el.setAttribute attr, parseValue(value)
        return this
      return unless @els[0]
      return readValue(@els[0].getAttribute attr)
    @attr key, val for key, val of attr
    this