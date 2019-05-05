import element from '../../page-objects/element.coffee'



suite 'overlay', ->

  test 'style', ->
    await element.open '/overlay'
    await element.checkElement()