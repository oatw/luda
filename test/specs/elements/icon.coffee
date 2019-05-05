import element from '../../page-objects/element.coffee'



suite 'icon', ->

  test 'style', ->
    await element.open '/icon'
    await element.checkElement()