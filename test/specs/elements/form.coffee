import element from '../../page-objects/element.coffee'



suite 'form', ->

  test 'style', ->
    await element.open '/form'
    await element.checkElement()