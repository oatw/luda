import pattern from '../../page-objects/pattern.coffee'



suite 'form button', ->

  test 'style', ->
    await pattern.open '/search-bar'
    await pattern.checkElement()