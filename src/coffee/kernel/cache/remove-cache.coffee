import luda from '../base/luda.coffee'
import camelCase from '../base/camel-case.coffee'
import splitValues from '../base/split-values.coffee'
import access from './helpers/access.coffee'



luda.include

  removeCache: (key) ->
    if arguments.length
      keys = splitValues(key).map (k) -> camelCase k
      return this unless keys.length
      @els.forEach (el) -> keys.forEach (k) -> access el, k, null
    else
      @els.forEach (el) -> access el, null
    this