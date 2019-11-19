import pattern from '../../page-objects/pattern.coffee'



describe 'tab', ->

  it 'style', ->
    await pattern.open '/tab'
    await pattern.checkElement()