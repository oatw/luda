export default (arr) ->
  return arr unless arr.length > 1
  arr.filter (item, index) -> arr.indexOf(item) is index