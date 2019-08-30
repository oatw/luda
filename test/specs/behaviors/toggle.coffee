import behavior from '../../page-objects/behavior.coffee'



describe 'toggle', ->

  it 'style', ->
    await behavior.open '/toggle'
    await behavior.checkElement()