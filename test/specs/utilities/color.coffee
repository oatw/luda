import utility from '../../page-objects/utility.coffee'



describe 'color', ->

  it 'style', ->
    await utility.open '/color'
    await utility.checkElement()