import element from '../../page-objects/element.coffee'



describe 'scrollbar', ->

  it 'style', ->
    await element.open '/scrollbar'
    await element.checkElement()