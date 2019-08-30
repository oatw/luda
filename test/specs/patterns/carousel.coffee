import pattern from '../../page-objects/pattern.coffee'



describe 'carousel', ->

  it 'style', ->
    await pattern.open '/carousel'
    await browser.pause 2000
    await pattern.checkElement()