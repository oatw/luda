import utility from '../../page-objects/utility.coffee'



suite 'border', ->

  test 'style', ->
    await utility.open '/border'
    await utility.checkElement()