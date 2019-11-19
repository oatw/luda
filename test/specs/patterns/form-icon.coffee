import pattern from '../../page-objects/pattern.coffee'



describe 'form icon', ->

  it 'style', ->
    await pattern.open '/form-icon'
    await pattern.checkElement()