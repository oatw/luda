import kernel from '../../page-objects/kernel.coffee'



describe 'data', ->

  before -> await kernel.open '/data'

  describe 'data', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.data('chain', 'chain') is el

    it 'gets string data', ->
      kernel.expect 'string', ->
        luda('#el').data('string')

    it 'gets false data', ->
      kernel.expect false, ->
        luda('#el').data('false')

    it 'gets true data', ->
      kernel.expect true, ->
        luda('#el').data('true')

    it 'gets integer data', ->
      kernel.expect 1, ->
        luda('#el').data('integer')

    it 'gets float data', ->
      kernel.expect 0.3, ->
        luda('#el').data('float')

    it 'gets numberic string data', ->
      kernel.expect '0013', ->
        luda('#el').data('numberic-string')

    it 'gets undefined data', ->
      kernel.expect true, ->
        luda('#el').data('undefined') is undefined

    it 'gets null data', ->
      kernel.expect true, ->
        luda('#el').data('null') is undefined

    it 'gets array data', ->
      kernel.expect true, ->
        luda('#el').data('array').join(',') is '1,2,3'

    it 'gets object data', ->
      kernel.expect true, ->
        obj = luda('#el').data('object')
        Object.keys(obj).join(',') is 'a,b' \
        and Object.values(obj).join(',') is '1,2'

    it 'gets all data', ->
      kernel.expect true, ->
        datas = luda('#el').data()
        datas.integer is 1 \
        and datas.float is 0.3 \
        and datas.numbericString is '0013' \
        and datas.array.join(',') is '1,2,3' \
        and Object.keys(datas.object).join(',') is 'a,b' \
        and Object.values(datas.object).join(',') is '1,2' \
        and datas.string is 'string' \
        and datas.false is false \
        and datas.true is true \
        and datas.undefined is undefined \
        and datas.null is undefined

    it 'sets string data', ->
      kernel.expect 'settedString', ->
        luda('#el')
        .data('setted-string', 'settedString')
        .data('setted-string')

    it 'sets false data', ->
      kernel.expect false, ->
        luda('#el')
        .data('setted-false', false)
        .data('setted-false')

    it 'sets true data', ->
      kernel.expect true, ->
        luda('#el')
        .data('setted-true', true)
        .data('setted-true')

    it 'sets integer data', ->
      kernel.expect 1, ->
        luda('#el')
        .data('setted-integer', 1)
        .data('setted-integer')

    it 'sets float data', ->
      kernel.expect 0.3, ->
        luda('#el')
        .data('setted-float', 0.3)
        .data('setted-float')

    it 'sets numberic string data', ->
      kernel.expect '0013', ->
        luda('#el')
        .data('setted-numberic-string', '0013')
        .data('setted-numberic-string')

    it 'sets undefined data', ->
      kernel.expect true, ->
        el = luda('#el')
        el.data('setted-undefined', undefined) is el \
        and el.data('setted-undefined') is undefined

    it 'sets null data', ->
      kernel.expect true, ->
        luda('#el')
        .data('setted-null', null)
        .data('setted-null') is undefined

    it 'sets array data', ->
      kernel.expect true, ->
        luda('#el')
        .data('setted-array', [1, 2, 3])
        .data('setted-array').join(',') is '1,2,3'

    it 'sets object data', ->
      kernel.expect true, ->
        obj = luda('#el')
        .data('setted-object', {a: 1, b: 2})
        .data('setted-object')
        Object.keys(obj).join(',') is 'a,b' \
        and Object.values(obj).join(',') is '1,2'

    it 'sets data in an object', ->
      kernel.expect true, ->
        datas =
          'o-one': 'one'
          'o-two': 2
          'o-three': [1, 2, 3]
        el = luda('#el')
        el.data(datas) is el \
        and el.data('o-one') is 'one' \
        and el.data('o-two') is 2 \
        and el.data('o-three').join(',') is '1,2,3'

    it "doesn't cache the values", ->
      kernel.expect 'modified', ->
        luda('#el').data('o-four', 4.4)
        luda('#el').els[0].setAttribute('data-o-four', 'modified')
        luda('#el').data('o-four')

  describe 'removeData', ->

    it 'removes data', ->
      kernel.expect true, ->
        luda('#el').removeData('o-one o-two o-three')
        luda('#el').data('o-one') is undefined \
        and luda('#el').data('o-two') is undefined \
        and luda('#el').data('o-three') is undefined

    it 'removes all data', ->
      kernel.expect true, ->
        obj = luda('#el')
        .removeData()
        .data()
        Object.keys(obj).length is 0