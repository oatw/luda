import Type from './type.coffee'
import ValuesMap from './values-map.coffee'



export default (value) ->
  return if value is null or value is 'null'
  return value unless Type.isString value
  try
    JSON.parse value
  catch err
    if Type.isDecimalism value
      Number value
    else if value of ValuesMap
      ValuesMap[value]
    else
      value