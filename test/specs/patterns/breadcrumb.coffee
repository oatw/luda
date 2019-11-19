import pattern from '../../page-objects/pattern.coffee'



describe 'breadcrumb', ->

  it 'style', ->
    await pattern.open '/breadcrumb'
    await pattern.checkElement()