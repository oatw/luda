import utility from '../../page-objects/utility.coffee'



describe 'size', ->

  it 'style', ->
    await utility.open '/size'
    await utility.checkElement()