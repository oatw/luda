import Type from '../../base/type.coffee'



print = (msg, style) ->
  if Type.isString msg
    return console.log "%c#{msg}", style
  console.log msg



export default print