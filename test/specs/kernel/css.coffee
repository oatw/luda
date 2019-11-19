import kernel from '../../page-objects/kernel.coffee'



describe 'css', ->

  before -> await kernel.open '/css'

  describe 'css', ->

    it 'gets the value of a property', ->
      kernel.expect true, ->
        luda('.css').css('height') is '50px' \
        and luda('.css').css('position') is 'static'

    it 'sets the value of a property', ->
      kernel.expect true, ->
        el = luda('.css')
        returnValue = el.css('height', '100px')
        returnValue is el \
        and el.css('height') is '100px'

    it 'supports setting an object of properties', ->
      kernel.expect true, ->
        el = luda('.css')
        props =
          height: '100px'
          width: '100px'
        returnValue = el.css(props)
        returnValue is el \
        and el.css('width') is '100px' \
        and el.css('height') is '100px'

    it 'supports custom variables', ->
      kernel.expect true, ->
        foo = luda('.css').css('--foo')
        bar = luda('.css').css('--bar')
        luda('.css').css('--foo', 0).css('--bar', 'content')
        foo is undefined \
        and bar is undefined \
        and luda('.css').css('--foo') is '0' \
        and luda('.css').css('--bar') is 'content'
    
    it 'supports invalid properties', ->
      kernel.expect true, ->
        foo = luda('.css').css('foo')
        luda('.css').css('foo', 123)
        foo is undefined \
        and luda('.css').css('foo') is undefined