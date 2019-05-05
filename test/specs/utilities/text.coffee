import utility from '../../page-objects/utility.coffee'



suite 'text', ->

  test 'style', ->
    await utility.open '/text'
    await utility.checkElement()