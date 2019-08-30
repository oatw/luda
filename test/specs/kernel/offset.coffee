import kernel from '../../page-objects/kernel.coffee'



describe 'offset', ->

  before -> await kernel.open '/offset'

  describe 'offsetParent', ->

    it 'gets the offset parent', ->
      kernel.expect true, ->
        relative = luda('.relative')
        absolute = luda('.absolute')
        absolute.offsetParent().els[0] is relative.els[0]
  
  describe 'offset', ->

    it 'gets the offset', ->
      kernel.expect true, ->
        offset = luda('.fixed').offset()
        offset.top is 200 and offset.left is 100

  describe 'position', ->

    it 'gets the position', ->
      kernel.expect true, ->
        position = luda('.absolute').position()
        position.top is 20 and position.left is 10