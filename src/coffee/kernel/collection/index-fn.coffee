import luda from '../base/luda.coffee'
import '../traversal/children.coffee'
import '../traversal/parent.coffee'



luda.include

  index: (selector) ->
    child = if selector then luda(selector).els[0] else @els[0]
    collection = if selector then @els else luda(child).parent().children().els
    collection.indexOf child