import utility from '../../page-objects/utility.coffee'



suite 'visibility', ->

  test 'style', ->
    await utility.open '/visibility'
    await utility.checkElement()