import pattern from '../../page-objects/pattern.coffee'



suite 'carousel', ->

  test 'style', ->
    await pattern.open '/carousel'
    await browser.pause 2000
    await pattern.checkElement()