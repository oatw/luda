import utility from '../../page-objects/utility.coffee'



suite 'position', ->

  test 'style', ->
    await utility.open '/position'
    await utility.checkElement()