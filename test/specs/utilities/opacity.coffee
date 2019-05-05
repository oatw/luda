import utility from '../../page-objects/utility.coffee'



suite 'opacity', ->

  test 'style', ->
    await utility.open '/opacity'
    await utility.checkElement()