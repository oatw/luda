export default (style, propertyLength) ->
  durationArray = style.split ','
  while durationArray.length < propertyLength
    durationArray = durationArray.concat durationArray
  if durationArray.length > propertyLength
    durationArray = durationArray.slice 0, propertyLength
  durationArray.map (durationStr) ->
    duration = parseFloat durationStr
    return 0 unless duration
    if durationStr.match 'ms' then duration else duration * 1000