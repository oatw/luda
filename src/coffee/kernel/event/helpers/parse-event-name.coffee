import splitValues from '../../base/split-values.coffee'
import Variables from './variables.coffee'



export default (name) ->
  stopRe = /(&stop)+/ig
  preventRe = /(&prevent)+/ig
  keysRe = new RegExp "@(#{Object.keys(Variables.keyCodes).join('|')})", 'g'
  splitValues(name).map (n) ->
    stopPropagation = stopRe.test n
    preventDefault = preventRe.test n
    splited = n.replace(stopRe, '')
    .replace(preventRe, '')
    .replace(keysRe, '').split('.')
    evtName = splited[0]
    type = Variables.focusEvents[evtName] or \
    Variables.hoverEvents[evtName] or evtName
    keyCodes = []
    matchedKeys = n.match(keysRe)
    matchedKeys and matchedKeys.forEach (key) ->
      k = key.replace(/@/g, '')
      keyCodes.push keyCode if keyCode = Variables.keyCodes[k]
    type: type
    stop: stopPropagation
    prevent: preventDefault
    namespace: splited.slice(1)
    key: keyCodes