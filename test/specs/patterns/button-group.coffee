import pattern from '../../page-objects/pattern.coffee'



suite 'button group', ->

  test 'style', ->
    await pattern.open '/button-group'
    await pattern.checkDocument()