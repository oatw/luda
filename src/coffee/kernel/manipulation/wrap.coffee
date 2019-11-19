import luda from '../base/luda.coffee'
import './wrap-all.coffee'
import clone from './helpers/clone.coffee'



luda.include

  wrap: (selector) ->
    @els.forEach (el, index) ->
      wrapper = luda(selector).els[0]
      luda(el).wrapAll(if index then clone(wrapper, true, true) else wrapper)
    this