import luda from '../../base/luda.coffee'
import Type from '../../base/type.coffee'
import {_access} from '../../cache/helpers/access.coffee'
import '../../collection/add.coffee'
import '../../collection/filter.coffee'
import '../../traversal/find.coffee'
import Variables from './variables.coffee'



CDATARe = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g

geval = eval



export default (node) ->
  collection = luda node
  scripts = collection.filter('script').add(collection.find('script')).els
  scripts.forEach (el) ->
    return unless (not el.src and Type.isScript el)
    return unless el.ownerDocument.documentElement.contains el
    scriptCache = _access el, Variables.scriptExpando
    return if scriptCache and scriptCache.executed
    geval el.textContent.replace(CDATARe, '')
    if scriptCache
      scriptCache.executed = true
    else
      _access el, Variables.scriptExpando, {executed: true}