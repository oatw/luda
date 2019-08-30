import element from '../../page-objects/element.coffee'



describe 'icon', ->

  it 'style', ->
    await element.open '/icon'
    await element.checkElement()