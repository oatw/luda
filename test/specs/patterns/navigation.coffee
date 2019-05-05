import pattern from '../../page-objects/pattern.coffee'



suite 'navigation', ->

  test 'style', ->
    await pattern.open '/navigation'
    await pattern.checkElement()