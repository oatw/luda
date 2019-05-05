import utility from '../../page-objects/utility.coffee'



suite 'align', ->

  test 'style', ->
    await utility.open '/align'
    await utility.checkElement()