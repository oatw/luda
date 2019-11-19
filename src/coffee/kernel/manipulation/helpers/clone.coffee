import findAll from '../../base/find-all.coffee'
import expando from '../../base/expando.coffee'
import Type from '../../base/type.coffee'
import {access, _access} from '../../cache/helpers/access.coffee'
import addEvent from '../../event/helpers/add-event.coffee'
import EV from '../../event/helpers/variables.coffee'
import V from './variables.coffee'



export default (el, cacheAndEvts, deep) ->
  cloned = el.cloneNode true
  # track script execute status,
  # no matter the cloned or the original script executed,
  # the other should not be executed again.
  scripts = findAll('script', el)
  clonedScripts = findAll('script', cloned)
  scripts.forEach (script, i) ->
    return unless Type.isScript script
    return if script.src
    cache = _access script, V.scriptExpando
    cache ||= {executed: false}
    _access script, V.scriptExpando, cache
    _access clonedScripts[i], V.scriptExpando, cache
  return cloned unless cacheAndEvts
  if deep
    nodes = findAll('*', el)
    clones = findAll('*', cloned)
  else
    nodes = [el]
    clones = [cloned]
  nodes.forEach (node, i) ->
    # copy events for the cloned node
    # if the original node has events
    if _evt = _access node, EV.expando
      for type, config of _evt
        config.quene and config.quene.forEach (it) ->
          addEvent clones[i], type, it.selector, it.callback, \
          it.namespace, it.key, it.stop, it.prevent, it._one
    # copy pub cache if the original node has pub cache
    access clones[i], Object.assign({}, cache) if cache = access node
  cloned