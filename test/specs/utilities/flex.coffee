import utility from '../../page-objects/utility.coffee'



describe 'flex', ->

  it 'style', ->
    await utility.open '/flex'
    await utility.checkElement()