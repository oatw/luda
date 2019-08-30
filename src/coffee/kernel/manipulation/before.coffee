import luda from '../base/luda.coffee'
import './insert-before.coffee'



luda.include

  before: ->
    self = this
    handler = (selector) -> luda(selector).insertBefore self
    [].forEach.call arguments, handler
    this