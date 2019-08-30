import luda from '../base/luda.coffee'
import '../traversal/children.coffee'
import '../traversal/parent.coffee'
import './replace-with.coffee'



luda.include

  unwrap: ->
    @parent().els.forEach (el) ->
      collection = luda(el)
      collection.replaceWith collection.children()
    this