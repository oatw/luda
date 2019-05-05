import pattern from '../../page-objects/pattern.coffee'



suite 'breadcrumb', ->

  test 'style', ->
    await pattern.open '/breadcrumb'
    await pattern.checkElement()