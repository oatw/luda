import pattern from '../../page-objects/pattern.coffee'



describe 'avatar', ->

  it 'style', ->
    await pattern.open '/avatar'
    await pattern.checkElement()