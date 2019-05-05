import pattern from '../../page-objects/pattern.coffee'



suite 'alert', ->

  test 'style', ->
    await pattern.open '/alert'
    await pattern.checkElement()