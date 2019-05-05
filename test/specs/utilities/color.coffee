import utility from '../../page-objects/utility.coffee'



suite 'color', ->

  test 'style', ->
    await utility.open '/color'
    await utility.checkElement()