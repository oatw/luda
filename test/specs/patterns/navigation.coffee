import pattern from '../../page-objects/pattern.coffee'



describe 'navigation', ->

  it 'style', ->
    await pattern.open '/navigation'
    await pattern.checkElement()