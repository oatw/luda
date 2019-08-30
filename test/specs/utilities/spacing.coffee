import utility from '../../page-objects/utility.coffee'



describe 'spacing', ->

  it 'style', ->
    await utility.open '/spacing'
    await utility.checkElement()