import kernel from '../../page-objects/kernel.coffee'



describe 'attribute', ->

  before -> await kernel.open '/attribute'

  describe 'attr', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.attr('chain', 'chain') is el

    it 'gets no arguments', ->
      kernel.expect true, ->
        luda('#el').attr() is undefined

    it 'gets non-existent attribute', ->
      kernel.expect true, ->
        luda('#el').attr('non-existent') is undefined

    it 'gets string attribute', ->
      kernel.expect 'string', ->
        luda('#el').attr('string')

    it 'gets false attribute', ->
      kernel.expect false, ->
        luda('#el').attr('false')

    it 'gets true attribute', ->
      kernel.expect true, ->
        luda('#el').attr('true')

    it 'gets integer attribute', ->
      kernel.expect 1, ->
        luda('#el').attr('integer')

    it 'gets float attribute', ->
      kernel.expect 0.3, ->
        luda('#el').attr('float')

    it 'gets numberic string attribute', ->
      kernel.expect '0013', ->
        luda('#el').attr('numberic-string')

    it 'gets undefined attribute', ->
      kernel.expect true, ->
        luda('#el').attr('undefined') is undefined

    it 'gets null attribute', ->
      kernel.expect true, ->
        luda('#el').attr('null') is undefined

    it 'gets array attribute', ->
      kernel.expect true, ->
        luda('#el').attr('array').join(',') is '1,2,3'

    it 'gets object attribute', ->
      kernel.expect true, ->
        obj = luda('#el').attr('object')
        Object.keys(obj).join(',') is 'a,b' \
        and Object.values(obj).join(',') is '1,2'

    it 'sets string attribute', ->
      kernel.expect 'settedString', ->
        luda('#el')
        .attr('setted-string', 'settedString')
        .attr('setted-string')

    it 'sets false attribute', ->
      kernel.expect false, ->
        luda('#el')
        .attr('setted-false', false)
        .attr('setted-false')

    it 'sets true attribute', ->
      kernel.expect true, ->
        luda('#el')
        .attr('setted-true', true)
        .attr('setted-true')

    it 'sets integer attribute', ->
      kernel.expect 1, ->
        luda('#el')
        .attr('setted-integer', 1)
        .attr('setted-integer')

    it 'sets float attribute', ->
      kernel.expect 0.3, ->
        luda('#el')
        .attr('setted-float', 0.3)
        .attr('setted-float')

    it 'sets numberic string attribute', ->
      kernel.expect '0013', ->
        luda('#el')
        .attr('setted-numberic-string', '0013')
        .attr('setted-numberic-string')

    it 'sets undefined attribute', ->
      kernel.expect true, ->
        el = luda('#el')
        el.attr('setted-undefined', undefined) is el \
        and el.attr('setted-undefined') is undefined

    it 'sets null attribute', ->
      kernel.expect true, ->
        luda('#el')
        .attr('setted-null', null)
        .attr('setted-null') is undefined

    it 'sets array attribute', ->
      kernel.expect true, ->
        luda('#el')
        .attr('setted-array', [1, 2, 3])
        .attr('setted-array').join(',') is '1,2,3'

    it 'sets object attribute', ->
      kernel.expect true, ->
        obj = luda('#el')
        .attr('setted-object', {a: 1, b: 2})
        .attr('setted-object')
        Object.keys(obj).join(',') is 'a,b' \
        and Object.values(obj).join(',') is '1,2'

    it 'sets attribute in an object', ->
      kernel.expect true, ->
        attributes =
          'o-one': 'one'
          'o-two': 2
          'o-three': [1, 2, 3]
        el = luda('#el')
        el.attr(attributes) is el \
        and el.attr('o-one') is 'one' \
        and el.attr('o-two') is 2 \
        and el.attr('o-three').join(',') is '1,2,3'

  describe 'removeAttr', ->

    it 'removes attributes', ->
      kernel.expect true, ->
        luda('#el').removeAttr('o-one o-two o-three')
        luda('#el').attr('o-one') is undefined \
        and luda('#el').attr('o-two') is undefined \
        and luda('#el').attr('o-three') is undefined