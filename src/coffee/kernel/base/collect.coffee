import {Luda} from './luda.coffee'
import matches from './matches.coffee'
import Type from './type.coffee'



export default (els, comparator, oppsite) ->
  return els if not comparator or not els?.length
  els.filter (el, index) ->
    match = switch
      when Type.isString comparator
        matches el, comparator
      when Type.isFunction comparator
        comparator.call el, el, index
      when comparator instanceof Luda
        comparator.els.includes el
      else
        el is comparator
    if oppsite then not match else match