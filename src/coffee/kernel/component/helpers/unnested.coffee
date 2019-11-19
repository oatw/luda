import luda from '../../base/luda.coffee'
import matches from '../../base/matches.coffee'
import '../../traversal/parents.coffee'



export default (instance, els) ->
  rootEl = instance.root.els[0]
  rootSelector = instance.constructor.root
  els.filter (el) ->
    return true if el is rootEl
    return false if matches el, rootSelector
    rootParent = luda(el).parent(rootSelector).els[0]
    if document.contains el then rootParent is rootEl else not rootParent