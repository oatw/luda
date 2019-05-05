import utility from '../../page-objects/utility.coffee'



suite 'space', ->

  test 'style', ->
    await utility.open '/space'
    await utility.checkElement()