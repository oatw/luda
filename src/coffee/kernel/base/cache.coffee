import Type from './type.coffee'



publicCache = {}
privateCache = {}

cacheFactory = (cache) ->
  (guid, key, value) ->
    return cache unless guid
    if key is null
      delete cache[guid]
    else if value is null
      return unless guid of cache
      delete cache[guid][key]
      delete cache[guid] unless Object.keys(cache[guid]).length
    else if value is undefined
      return cache[guid] if key is undefined
      return cache[guid] = key if Type.isObject key
      return unless guid of cache
      cache[guid][key]
    else
      return if key is undefined
      cache[guid] ||= {}
      cache[guid][key] = value

cache = cacheFactory publicCache
_cache = cacheFactory privateCache



export {cache, cache as default, _cache}