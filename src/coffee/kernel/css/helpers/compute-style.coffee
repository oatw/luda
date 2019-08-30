import Type from '../../base/type.coffee'



export default (el, prop, isVar) ->
  return if not Type.isElement(el) or not prop
  style = window.getComputedStyle el, null
  if prop
    if isVar
      style.getPropertyValue(prop) or undefined
    else
      style[prop]
  else
    style