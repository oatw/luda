import utility from '../../page-objects/utility.coffee'



suite 'float', ->

  test 'style', ->
    await utility.open '/float'
    await utility.checkElement()