import pattern from '../../page-objects/pattern.coffee'



suite 'form group', ->

  test 'style', ->
    await pattern.open '/form-group'
    await pattern.checkElement()