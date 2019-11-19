import element from '../../page-objects/element.coffee'



describe 'form', ->

  it 'style', ->
    await element.open '/form'
    await element.checkElement()