import element from '../../page-objects/element.coffee'



suite 'media', ->

  test 'style', ->
    await element.open '/media'
    await element.checkElement()