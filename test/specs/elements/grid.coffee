import element from '../../page-objects/element.coffee'



suite 'grid', ->

  test 'style', ->
    await element.open '/grid'
    await element.checkElement()