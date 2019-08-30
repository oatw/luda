import utility from '../../page-objects/utility.coffee'



describe 'position', ->

  it 'style', ->
    await utility.open '/position'
    await utility.checkElement()