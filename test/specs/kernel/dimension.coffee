import kernel from '../../page-objects/kernel.coffee'



describe 'dimension', ->

  beforeEach -> await kernel.open '/dimension'

  describe 'height', ->

    it 'gets the height of a DOM element', ->
      kernel.expect 50, ->
        luda('.rectangle').height()

    it 'gets the height of the window', ->
      kernel.expect true, ->
        luda(window).height() is window.outerHeight

    it 'sets the height of a DOM element', ->
      kernel.expect true, ->
        el = luda('.rectangle')
        responseValue = el.height('200px')
        responseValue is el \
        and Math.round(el.height()) is 200

    it 'supports unitless numbers', ->
      kernel.expect true, ->
        el = luda('.rectangle')
        responseValue = el.height(200)
        responseValue is el \
        and Math.round(el.height()) is 200
    
  describe 'innerHeight', ->

    it 'gets the inner height of a DOM element', ->
      kernel.expect 60, ->
        luda('.rectangle').innerHeight()

    it 'gets the inner height of the window', ->
      kernel.expect true, ->
        luda(window).innerHeight() is window.innerHeight

  describe 'outerHeight', ->

    it 'gets the outer height of a DOM element', ->
      kernel.expect 62, ->
        luda('.rectangle').outerHeight()
    
    it 'gets the outer height of the window', ->
      kernel.expect true, ->
        luda(window).outerHeight() is window.outerHeight

    it 'can include margins', ->
      kernel.expect 82, ->
        luda('.rectangle').outerHeight(true)

  describe 'width', ->

    it 'gets the width of a DOM element', ->
      kernel.expect 100, ->
        luda('.rectangle').width()

    it 'gets the width of the window', ->
      kernel.expect true, ->
        luda(window).width() is window.outerWidth

    it 'sets the width of a DOM element', ->
      kernel.expect true, ->
        el = luda('.rectangle')
        returnValue = el.width('200px')
        returnValue is el \
        and Math.round(el.width()) is 200

    it 'supports unitless numbers', ->
      kernel.expect true, ->
        el = luda('.rectangle')
        returnValue = el.width(200)
        returnValue is el \
        and Math.round(el.width()) is 200

  describe 'innerWidth', ->

    it 'gets the inner width of a DOM element', ->
      kernel.expect 110, ->
        luda('.rectangle').innerWidth()

    it 'gets the inner width of the window', ->
      kernel.expect true, ->
        luda(window).innerWidth() is window.innerWidth

  describe 'outerWidth', ->

    it 'gets the outer width of a DOM element', ->
      kernel.expect 112, ->
        luda('.rectangle').outerWidth()

    it 'gets the outer width of the window', ->
      kernel.expect true, ->
        luda(window).outerWidth() is window.outerWidth

    it 'can include margins', ->
      kernel.expect 132, ->
        luda('.rectangle').outerWidth(true)