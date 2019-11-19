import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import ludaEvent from './helpers/luda-event.coffee'
import parseEventName from './helpers/parse-event-name.coffee'
import Variables from './helpers/variables.coffee'



luda.include

  trigger: (name, detail, afterTrigger) ->
    handledEvts = [] if afterTrigger and not Type.isFunction afterTrigger
    @els.forEach (el) ->
      if Type.isString name
        events = parseEventName(name).map (evt) ->
          event = new CustomEvent evt.type,
            bubbles: true
            cancelable: true
            composed: true
            detail: detail
          event.namespace = evt.namespace
          event
      else
        events = if Type.isArray name then name else [name]
      events.forEach (e) ->
        e.ludaEvent = ludaEvent e
        isFocusEvent = Object.values(Variables.focusEvents).includes e.type
        if isFocusEvent and Type.isFunction(el[e.type])
          el[e.type]()
        else
          el.dispatchEvent e
        if Type.isFunction afterTrigger
          afterTrigger e.ludaEvent, e.ludaEvent.detail, el
        else if afterTrigger
          handledEvts.push e.ludaEvent
    handledEvts or this