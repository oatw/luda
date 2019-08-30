import element from '../../page-objects/element.coffee'



describe 'typography', ->

  it 'style', ->
    await element.open '/typography'
    await element.checkElement()