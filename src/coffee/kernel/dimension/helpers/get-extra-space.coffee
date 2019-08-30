import computeStyleInt from '../../css/helpers/compute-style-int.coffee'



export default (el, xAxis) ->
  computeStyleInt(el, "border#{if xAxis then 'Left' else 'Top'}Width") \
  + computeStyleInt(el, "padding#{if xAxis then 'Left' else 'Top'}") \
  + computeStyleInt(el, "padding#{if xAxis then 'Right' else 'Bottom'}") \
  + computeStyleInt(el, "border#{if xAxis then 'Right' else 'Bottom'}Width")