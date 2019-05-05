import utility from '../../page-objects/utility.coffee'



suite 'overflow', ->

  test 'style', ->
    await utility.open '/overflow'
    await utility.checkElement()