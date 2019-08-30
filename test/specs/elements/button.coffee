import element from '../../page-objects/element.coffee'



describe 'button', ->

  it 'style', ->
    await element.open '/button'
    await element.checkElement()