import behavior from '../../page-objects/behavior.coffee'



describe 'enter', ->

  it 'style', ->
    await behavior.open '/enter'
    await behavior.checkElement()