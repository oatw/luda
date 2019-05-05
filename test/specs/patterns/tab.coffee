import pattern from '../../page-objects/pattern.coffee'



suite 'tab', ->

  test 'style', ->
    await pattern.open '/tab'
    await pattern.checkElement()