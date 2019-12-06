import Type from './type.coffee'



export default (arr, prop, deep, filter) ->
  plucked = []
  arr = [arr] unless Type.isArray arr
  arr.forEach (item) ->
    val = item[prop]
    while val?
      if filter
        if filter val
          plucked.push val
          break unless deep
      else
        plucked.push val
        break unless deep
      val = val[prop]
  plucked