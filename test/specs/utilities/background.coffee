import utility from '../../page-objects/utility.coffee'



suite 'background', ->

  test 'style', ->
    await utility.open '/background'
    await utility.checkElement()