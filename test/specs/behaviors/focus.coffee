import behavior from '../../page-objects/behavior.coffee'



describe 'focus', ->

  it 'style', ->
    await behavior.open '/focus'
    await behavior.checkElement()