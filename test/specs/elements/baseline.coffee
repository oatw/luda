import element from '../../page-objects/element.coffee'



describe 'baseline', ->

  it 'style', ->
    await element.open '/baseline'
    await element.checkElement()