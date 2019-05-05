import element from '../../page-objects/element.coffee'



suite 'trubolinks progress bar', ->

  test 'style', ->
    await element.open '/trubolinks-progress-bar'
    await element.checkElement()