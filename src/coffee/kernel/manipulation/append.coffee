import luda from '../base/luda.coffee'
import insertContent from './helpers/insert-content.coffee'



luda.include

  append: ->
    els = @els
    handler = (selector) -> insertContent els, luda(selector).els
    [].forEach.call arguments, handler
    this