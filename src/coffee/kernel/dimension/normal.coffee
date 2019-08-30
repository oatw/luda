import luda from '../base/luda.coffee'
import camelCase from '../base/camel-case.coffee'
import Type from '../base/type.coffee'
import computeStyle from '../css/helpers/compute-style.coffee'
import parseValue from '../css/helpers/parse-value.coffee'
import getExtraSpace from './helpers/get-extra-space.coffee'



factory = (prop) ->
  (value) ->
    unless e = @els[0]
      return if value is undefined then undefined else this
    unless arguments.length
      return e[camelCase "outer-#{prop}"] if Type.isWindow e
      return e.getBoundingClientRect()[prop] - getExtraSpace(e, prop is 'width')
    valNumber = parseInt value, 10
    @els.forEach (el) ->
      return unless Type.isElement el
      boxSizing = computeStyle el, 'boxSizing'
      extra = 0
      extra = getExtraSpace(el, prop is 'width') if boxSizing is 'border-box'
      el.style[prop] = parseValue(prop, valNumber + extra)
    this



luda.include

  width: factory 'width'

  height: factory 'height'