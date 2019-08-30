import Type from '../../base/type.coffee'
import isVariable from './is-variable.coffee'



numericProps = [
  'animationIterationCount'
  'columnCount'
  'flexGrow'
  'flexShrink'
  'fontWeight'
  'lineHeight'
  'opacity'
  'order'
  'orphans'
  'widows'
  'zIndex'
]



export default (prop, value, isVar) ->
  isVar = isVariable prop if isVar is undefined
  return value if isVar or numericProps.includes prop
  if Type.isNumeric value then "#{value}px" else value