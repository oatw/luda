import element from '../../page-objects/element.coffee'



describe 'progress', ->

  it 'style', ->
    await element.open '/progress'
    await element.checkElement()