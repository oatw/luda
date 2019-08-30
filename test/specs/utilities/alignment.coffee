import utility from '../../page-objects/utility.coffee'



describe 'alignment', ->

  it 'style', ->
    await utility.open '/alignment'
    await utility.checkElement()