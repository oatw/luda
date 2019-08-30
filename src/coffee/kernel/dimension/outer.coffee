import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import computeStyleInt from '../css/helpers/compute-style-int.coffee'



factory = (prop) ->
  (includeMargins) ->
    return unless el = @els[0]
    return window["outer#{prop}"] if Type.isWindow el
    offsetSize = el["offset#{prop}"]
    return offsetSize unless includeMargins
    marginOne = computeStyleInt el, \
    "margin#{if prop is 'Width' then 'Left' else 'Top'}"
    marginTwo = computeStyleInt el, \
    "margin#{if prop is 'Width' then 'Right' else 'Bottom'}"
    offsetSize + marginOne + marginTwo



luda.include

  outerWidth: factory 'Width'

  outerHeight: factory 'Height'