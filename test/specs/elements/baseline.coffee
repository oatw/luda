import element from '../../page-objects/element.coffee'



suite 'baseline', ->

  test 'style', ->
    await element.open '/baseline'
    await element.checkElement()