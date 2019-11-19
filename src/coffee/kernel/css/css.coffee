import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import computeStyle from './helpers/compute-style.coffee'
import isVariable from './helpers/is-variable.coffee'
import readProp from './helpers/read-prop.coffee'
import parseValue from './helpers/parse-value.coffee'



luda.include

  css: (prop, value) ->
    if Type.isString prop
      isVar = isVariable prop
      prop = readProp prop, isVar
      if arguments.length < 2
        return @els[0] and computeStyle @els[0], prop, isVar
      return this unless prop
      value = parseValue prop, value, isVar
      @els.forEach (el) ->
        return unless Type.isElement el
        if isVar
          el.style.setProperty prop, value
        else
          el.style[prop] = value
      return this
    @css key, val for key, val of prop
    this