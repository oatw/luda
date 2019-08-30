import luda from '../base/luda.coffee'
import clone from './helpers/clone.coffee'
import insertElement from './helpers/insert-element.coffee'



luda.include

  insertAfter: (selector) ->
    els = @els
    luda(selector).els.forEach (target, index) ->
      parent = target.parentNode
      parent and els.forEach (child) ->
        childToBeInserted = if index then clone(child, true, true) else child
        insertElement parent, childToBeInserted, true, target.nextSibling
    this