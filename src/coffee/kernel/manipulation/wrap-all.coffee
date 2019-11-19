import luda from '../base/luda.coffee'
import '../collection/first.coffee'
import './append-to.coffee'
import './before.coffee'



luda.include

  wrapAll: (selector) ->
    return this unless @els.length
    structure = luda selector
    @first().before structure
    wrapper = structure.els[0]
    wrapper = wrapper.firstElementChild while wrapper.children.length
    @appendTo wrapper