import element from '../../page-objects/element.coffee'



describe 'media', ->

  it 'style', ->
    await element.open '/media'
    await element.checkElement()