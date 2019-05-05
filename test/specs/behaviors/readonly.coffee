import behavior from '../../page-objects/behavior.coffee'



suite 'readonly', ->

  test 'style', ->
    await behavior.open '/readonly'
    await behavior.checkElement()