import element from '../../page-objects/element.coffee'



suite 'progress', ->

  test 'style', ->
    await element.open '/progress'
    await element.checkElement()