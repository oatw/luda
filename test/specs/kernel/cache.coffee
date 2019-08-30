import kernel from '../../page-objects/kernel.coffee'



describe 'cache', ->

  before -> await kernel.open '/cache'

  describe 'cache', ->

    it 'gets all cache', ->
      kernel.expect true, ->
        cache = luda('#el').cache()
        uid = luda('#el').els[0].__luda_guid
        Object.keys(cache).length is 0 \
        and typeof uid is 'number' \
        and Object.keys(luda.cache()).length is 1 \
        and Object.keys(luda.cache()[uid]).length is 0 \
        and luda.cache(true)[uid] is undefined

    it 'gets cache by key', ->
      kernel.expect true, ->
        value = luda('#el').cache('custom')
        uid = luda('#el').els[0].__luda_guid
        value is undefined \
        and typeof uid is 'number' \
        and Object.keys(luda.cache()).length is 1 \
        and Object.keys(luda.cache()[uid]).length is 0 \
        and luda.cache(true)[uid] is undefined

    it 'sets value', ->
      kernel.expect true, ->
        luda('#el')
        .cache('custom-string', 'custom')
        .cache('custom-string') is 'custom'

    it 'sets undefined value', ->
      kernel.expect true, ->
        luda('#el')
        .cache('custom-undefined', undefined)
        .cache('custom-undefined') is undefined
    
    it 'sets object values', ->
      kernel.expect true, ->
        date = new Date()
        luda('#el')
        .cache('custom-three', {a: 1, b: '2', c: [1, 's', true], d: {e: false}})
        .cache('custom-three').f = date
        cache = luda('#el').cache('custom-three')
        cache.a is 1 \
        and cache.b is '2' \
        and cache.c.join(',') is '1,s,true' \
        and cache.d.e is false \
        and cache.f is date

    it 'sets cache in an object', ->
      kernel.expect true, ->
        cache = luda('#el').cache({a: 1, b: 2, c: [1, 2]}).cache()
        uid = luda('#el').els[0].__luda_guid
        cache.a is 1 \
        and cache.b is 2 \
        and cache.c.join(',') is '1,2' \
        and luda.cache(true)[uid] is undefined

    it 'removes cache when value is null', ->
      kernel.expect true, ->
        luda('#el')
        .cache('custom-string', null)
        .cache('custom-string') is undefined

  describe 'removeCache', ->

    it 'removes cache by key', ->
      kernel.expect true, ->
        luda('#el').removeCache('custom-three a')
        luda('#el').cache('custom-three') is undefined \
        and luda('#el').cache('a') is undefined \
        and Object.keys(luda('#el').cache()).length is 2

    it 'removes all cache', ->
      kernel.expect true, ->
        luda.cache(true).__ = 1
        luda('#el').removeCache()
        Object.keys(luda('#el').cache()).length is 0 \
        and luda.cache(true).__ is 1