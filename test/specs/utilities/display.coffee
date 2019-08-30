import utility from '../../page-objects/utility.coffee'



describe 'display', ->

  it 'style', ->
    await utility.open '/display'
    await utility.checkElement()