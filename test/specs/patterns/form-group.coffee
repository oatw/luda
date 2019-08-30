import pattern from '../../page-objects/pattern.coffee'



describe 'form group', ->

  it 'style', ->
    await pattern.open '/form-group'
    await pattern.checkElement()