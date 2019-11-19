import Type from './type.coffee'



export default (value) ->
  return value unless Type.isObject value
  try
    JSON.stringify value
  catch err
    value