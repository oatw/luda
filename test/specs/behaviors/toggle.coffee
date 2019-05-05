import behavior from '../../page-objects/behavior.coffee'



suite 'toggle', ->

  test 'style', ->
    await behavior.open '/toggle'
    await behavior.checkElement()