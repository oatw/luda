import element from '../../page-objects/element.coffee'



suite 'table', ->

  test 'style', ->
    await element.open '/table'
    await element.checkElement()