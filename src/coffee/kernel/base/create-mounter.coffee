import Type from './type.coffee'



export default (target, messagePrefix, handler) ->
  mount = (name, val) ->
    if Type.isString name
      if name of target
        msg = "Namespace '#{name}' is occupied, "
        msg += "skip #{messagePrefix or 'mounting'}."
        console.warn msg
      else
        target[name] = if handler then handler name, val else val
    else
      mount n, v for n, v of name
    this