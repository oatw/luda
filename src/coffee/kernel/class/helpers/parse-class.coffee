import Type from '../../base/type.coffee'



pattern = /^\./

parse = (cls) ->
  if Type.isString cls then cls.replace pattern, '' else cls



export default parse