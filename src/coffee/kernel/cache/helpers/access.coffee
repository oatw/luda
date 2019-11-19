import {cache, _cache} from './cache.coffee'
import expando from '../../base/expando.coffee'
import guid from '../../base/guid.coffee'



accessFactory = (c) ->
  (owner, key, value) ->
    return c() unless arguments.length
    uid = owner[expando] ||= guid()
    c uid, key, value

access = accessFactory cache
_access = accessFactory _cache

clean = (owner) ->
  if owner[expando]
    _access owner, null
    access owner, null



export {access, access as default, _access, clean}