import pattern from '../../page-objects/pattern.coffee'



describe 'button group', ->

  it 'style', ->
    await pattern.open '/button-group'
    await pattern.checkDocument()