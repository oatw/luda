import luda from '../base/luda.coffee'
import './insert-after.coffee'



luda.include

  after: ->
    self = this
    argReverse = [].reverse.apply(arguments)
    handler = (selector) ->
      els = luda(selector).els.reverse()
      luda(els).insertAfter self
    [].forEach.call argReverse, handler
    this