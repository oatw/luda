import utility from '../../page-objects/utility.coffee'



describe 'background', ->

  it 'style', ->
    await utility.open '/background'
    await utility.checkElement()