import utility from '../../page-objects/utility.coffee'



suite 'flex', ->

  test 'style', ->
    await utility.open '/flex'
    await utility.checkElement()