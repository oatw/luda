export default (a, b, compareOrder) ->
  return false unless a and b
  return true if a is b
  return false unless a.length is b.length
  return true if a.length is 0
  if compareOrder
    a.every (it, index) -> it is b[index]
  else
    not a.some (it) -> not b.includes(it)