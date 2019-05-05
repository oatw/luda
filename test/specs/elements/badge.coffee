import element from '../../page-objects/element.coffee'



suite 'badge', ->

  test 'style', ->
    await element.open '/badge'
    await element.checkElement()