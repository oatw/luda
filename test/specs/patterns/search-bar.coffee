import pattern from '../../page-objects/pattern.coffee'



describe 'form button', ->

  it 'style', ->
    await pattern.open '/search-bar'
    await pattern.checkElement()