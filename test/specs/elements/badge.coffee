import element from '../../page-objects/element.coffee'



describe 'badge', ->

  it 'style', ->
    await element.open '/badge'
    await element.checkElement()