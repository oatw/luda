import element from '../../page-objects/element.coffee'



suite 'container', ->

  test 'style', ->
    await element.open '/container'
    await element.checkElement()