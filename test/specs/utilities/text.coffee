import utility from '../../page-objects/utility.coffee'



describe 'text', ->

  it 'style', ->
    await utility.open '/text'
    await utility.checkElement()