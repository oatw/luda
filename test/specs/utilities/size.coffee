import utility from '../../page-objects/utility.coffee'



suite 'size', ->

  test 'style', ->
    await utility.open '/size'
    await utility.checkElement()