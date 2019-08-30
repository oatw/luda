import clone from './clone.coffee'
import insertElement from './insert-element.coffee'



export default (parent, child, prepend) ->
  parent.forEach (p, parentIndex) ->
    child.forEach (c) ->
      childToBeInserted = if parentIndex then clone(c, true, true) else c
      insertElement p, childToBeInserted, prepend, prepend and p.firstChild