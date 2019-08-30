import utility from '../../page-objects/utility.coffee'



describe 'z-index', ->

  it 'style', ->
    await utility.open '/z-index'
    await utility.checkElement()