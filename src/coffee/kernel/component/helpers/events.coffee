import luda from '../../base/luda.coffee'
import Type from '../../base/type.coffee'
import matches from '../../matches/helpers/matches.coffee'
import '../../event/on.coffee'
import '../../event/off.coffee'
import '../../traversal/parent.coffee'



namespace = (C) -> ".#{C.id}"

findRoot = (C, event) ->
  return C.root if Type.isDocument C.root
  rootEl = null
  event.eventPath().some (el) ->
    return unless matches el, C.root
    rootEl = el
  rootEl

isntPropagation = (C, event, rootEl) ->
  return true if Type.isDocument C.root
  return true if event.currentTarget is rootEl
  luda(event.currentTarget).parent(C.root).els[0] is rootEl

addEvents = (C) ->
  events = C.helpers.listen.call C.prototype
  events.forEach (evt) ->
    return unless evt[0]
    name = "#{evt[0]}#{namespace C}"
    selector = if Type.isFunction evt[1] then '' else evt[1]
    callbacks = if Type.isFunction evt[1] then evt.slice 1 else evt.slice 2
    evtSelector = selector
    callbacks.forEach (callback) ->
      return unless Type.isFunction callback
      if Object.values(C.prototype).includes callback
        if Type.isString(C.root) and selector.replace(C.root, '') is selector
          evtSelector = if selector then "#{C.root} #{selector}" else C.root
        handler = (event, data) ->
          return unless rootEl = findRoot C, event
          return unless isntPropagation C, event, rootEl
          callback.call C.create(rootEl)[0], event, data
      else
        handler = (event, data) -> callback.call this, event, data
      luda(document).on name, evtSelector, handler

removeEvents = (C) -> luda(document).off namespace(C)



export {addEvents, removeEvents}