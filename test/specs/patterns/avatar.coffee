import pattern from '../../page-objects/pattern.coffee'



suite 'avatar', ->

  test 'style', ->
    await pattern.open '/avatar'
    await pattern.checkElement()