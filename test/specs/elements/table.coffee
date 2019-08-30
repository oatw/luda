import element from '../../page-objects/element.coffee'



describe 'table', ->

  it 'style', ->
    await element.open '/table'
    await element.checkElement()