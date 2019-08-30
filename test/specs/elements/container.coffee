import element from '../../page-objects/element.coffee'



describe 'container', ->

  it 'style', ->
    await element.open '/container'
    await element.checkElement()