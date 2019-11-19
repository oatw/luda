import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import addEvent from './helpers/add-event.coffee'
import parseEventName from './helpers/parse-event-name.coffee'



luda.include

  on: (name, selector, callback, _one) ->
    self = this
    unless Type.isString name
      @on key, selector, keyCallback for key, keyCallback of name
      return this
    if Type.isFunction selector
      callback = selector
      selector = ''
    parseEventName(name).forEach (option) ->
      self.els.forEach (el) ->
        addEvent el, option.type, selector, callback, option.namespace, \
        option.key, option.stop, option.prevent, _one
    this