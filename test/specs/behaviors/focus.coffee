import behavior from '../../page-objects/behavior.coffee'



suite 'focus', ->

  test 'style', ->
    await behavior.open '/focus'
    await behavior.checkElement()