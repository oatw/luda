import luda from '../base/luda.coffee'
import insertContent from './helpers/insert-content.coffee'



luda.include

  prepend: ->
    els = @els
    handler = (selector) -> insertContent els, luda(selector).els, true
    [].forEach.call arguments, handler
    this