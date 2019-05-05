import element from '../../page-objects/element.coffee'



suite 'scrollbar', ->

  test 'style', ->
    await element.open '/scrollbar'
    await element.checkElement()