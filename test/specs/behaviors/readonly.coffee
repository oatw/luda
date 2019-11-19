import behavior from '../../page-objects/behavior.coffee'



describe 'readonly', ->

  it 'style', ->
    await behavior.open '/readonly'
    await behavior.checkElement()