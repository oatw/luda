export default (arr, prop, deep) ->
  plucked = []
  arr.forEach (item) ->
    val = item[prop]
    until val is null
      plucked.push val
      break unless deep
      val = val[prop]
  plucked