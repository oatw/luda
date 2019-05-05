import utility from '../../page-objects/utility.coffee'



suite 'shadow', ->

  test 'style', ->
    await utility.open '/shadow'
    await utility.checkElement()