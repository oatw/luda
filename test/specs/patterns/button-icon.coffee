import pattern from '../../page-objects/pattern.coffee'



suite 'button icon', ->

  test 'style', ->
    await pattern.open '/button-icon'
    await pattern.checkElement()