import element from '../../page-objects/element.coffee'



suite 'button', ->

  test 'style', ->
    await element.open '/button'
    await element.checkElement()