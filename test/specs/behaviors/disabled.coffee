import behavior from '../../page-objects/behavior.coffee'



describe 'disabled', ->

  it 'style', ->
    await behavior.open '/disabled'
    await behavior.checkElement()