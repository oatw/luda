import element from '../../page-objects/element.coffee'



describe 'trubolinks progress bar', ->

  it 'style', ->
    await element.open '/trubolinks-progress-bar'
    await element.checkElement()