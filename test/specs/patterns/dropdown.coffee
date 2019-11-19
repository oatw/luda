import pattern from '../../page-objects/pattern.coffee'



describe 'dropdown', ->

  it 'style', ->
    await pattern.open '/dropdown'
    await pattern.checkElement()