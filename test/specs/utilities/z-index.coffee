import utility from '../../page-objects/utility.coffee'



suite 'z-index', ->

  test 'style', ->
    await utility.open '/z-index'
    await utility.checkElement()