import pattern from '../../page-objects/pattern.coffee'



suite 'form icon', ->

  test 'style', ->
    await pattern.open '/form-icon'
    await pattern.checkElement()