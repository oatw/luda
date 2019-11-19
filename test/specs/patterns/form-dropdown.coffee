import pattern from '../../page-objects/pattern.coffee'



describe 'form dropdown', ->

  it 'style', ->
    await pattern.open '/form-dropdown'
    await pattern.checkElement()