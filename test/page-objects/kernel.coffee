import Page from './page.coffee'



class Kernel extends Page
  @_PATH_PREFIX: '/kernel'

  expect: (value, fn) ->
    result = await browser.execute fn
    expect(result.value).to.equal(value)



export default new Kernel()