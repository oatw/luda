import element from '../../page-objects/element.coffee'



suite 'typography', ->

  test 'style', ->
    await element.open '/typography'
    await element.checkElement()