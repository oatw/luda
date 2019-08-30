import luda from '../base/luda.coffee'
import {access, _access} from '../base/access.coffee'
import camelCase from '../base/camel-case.coffee'
import Type from '../base/type.coffee'
import './remove-cache.coffee'



luda.extend
  
  cache: (isPrivate) -> if isPrivate then _access() else access()

luda.include

  cache: (key, value) ->
    unless key
      return unless @els[0]
      return access(@els[0]) or access(@els[0], {})
    if Type.isString key
      key = camelCase key
      if arguments.length < 2
        return unless @els[0]
        access(@els[0], {}) unless access(@els[0])
        return access @els[0], key
      return this if value is undefined
      return @removeCache key if value is null
      @els.forEach (el) ->
        access(el, {}) unless access(el)
        access el, key, value
      return this
    @cache k, v for k, v of key
    this