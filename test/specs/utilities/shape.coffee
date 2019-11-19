import utility from '../../page-objects/utility.coffee'



describe 'shape', ->

  it 'style', ->
    await utility.open '/shape'
    await utility.checkElement()