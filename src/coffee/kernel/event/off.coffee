import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import parseEventName from './helpers/parse-event-name.coffee'
import removeEvent from './helpers/remove-event.coffee'



luda.include

  off: (name, selector, callback) ->
    self = this
    if name is undefined
      @els.forEach (el) -> removeEvent el
      return this
    if Type.isFunction selector
      callback = selector
      selector = ''
    parseEventName(name).forEach (option) ->
      self.els.forEach (el) ->
        removeEvent el, option.type, selector, callback, option.namespace
    this