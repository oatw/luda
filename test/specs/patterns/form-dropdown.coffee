import pattern from '../../page-objects/pattern.coffee'



suite 'form dropdown', ->

  test 'style', ->
    await pattern.open '/form-dropdown'
    await pattern.checkElement()