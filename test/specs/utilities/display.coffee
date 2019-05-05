import utility from '../../page-objects/utility.coffee'



suite 'display', ->

  test 'style', ->
    await utility.open '/display'
    await utility.checkElement()