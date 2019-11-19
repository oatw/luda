import pattern from '../../page-objects/pattern.coffee'



describe 'alert', ->

  it 'style', ->
    await pattern.open '/alert'
    await pattern.checkElement()