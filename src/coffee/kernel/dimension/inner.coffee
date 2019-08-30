import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'



factory = (prop) ->
  ->
    return unless el = @els[0]
    return window["inner#{prop}"] if Type.isWindow el
    el["client#{prop}"]



luda.include

  innerWidth: factory 'Width'

  innerHeight: factory 'Height'