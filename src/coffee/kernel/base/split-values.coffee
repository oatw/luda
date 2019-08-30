import type from './type.coffee'



export default (str) ->
  if type.isString str then str.match(/\S+/g) or [] else []