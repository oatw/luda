import pattern from '../../page-objects/pattern.coffee'



describe 'button icon', ->

  it 'style', ->
    await pattern.open '/button-icon'
    await pattern.checkElement()