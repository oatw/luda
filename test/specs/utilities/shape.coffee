import utility from '../../page-objects/utility.coffee'



suite 'shape', ->

  test 'style', ->
    await utility.open '/shape'
    await utility.checkElement()