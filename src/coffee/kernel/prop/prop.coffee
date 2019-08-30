import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'



luda.include

  prop: (prop, value) ->
    return unless prop
    if Type.isString prop
      return @els[0] and @els[0][prop] if arguments.length < 2
      @els.forEach (el) -> el[prop] = value
      return this
    @prop key, val for key, val of prop
    this