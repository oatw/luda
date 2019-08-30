import element from '../../page-objects/element.coffee'



describe 'overlay', ->

  it 'style', ->
    await element.open '/overlay'
    await element.checkElement()