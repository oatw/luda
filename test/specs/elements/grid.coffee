import element from '../../page-objects/element.coffee'



describe 'grid', ->

  it 'style', ->
    await element.open '/grid'
    await element.checkElement()