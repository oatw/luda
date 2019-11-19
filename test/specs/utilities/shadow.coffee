import utility from '../../page-objects/utility.coffee'



describe 'shadow', ->

  it 'style', ->
    await utility.open '/shadow'
    await utility.checkElement()