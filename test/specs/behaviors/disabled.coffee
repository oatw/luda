import behavior from '../../page-objects/behavior.coffee'



suite 'disabled', ->

  test 'style', ->
    await behavior.open '/disabled'
    await behavior.checkElement()