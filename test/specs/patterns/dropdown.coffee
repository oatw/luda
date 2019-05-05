import pattern from '../../page-objects/pattern.coffee'



suite 'dropdown', ->

  test 'style', ->
    await pattern.open '/dropdown'
    await pattern.checkElement()