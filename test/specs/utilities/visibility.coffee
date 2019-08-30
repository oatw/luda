import utility from '../../page-objects/utility.coffee'



describe 'visibility', ->

  it 'style', ->
    await utility.open '/visibility'
    await utility.checkElement()