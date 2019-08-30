class Page

  @_PATH_PREFIX: ''
  @_VISIBLE_SELECTOR: '#visible-detector'
  @_WAIT_TIME_AFTER_URL_OPEN: 99999
  @_PAUSE_TIME_AFTER_VIEWPORT_CHANGE: 500
  @isLocal: process.env.NODE_ENV is 'local'

  checkDocument: ->
    return true if @constructor.isLocal is true
    reports = await browser.checkDocument()
    @_assertDiff reports

  checkViewport: ->
    return true if @constructor.isLocal is true
    reports = await browser.checkViewport()
    @_assertDiff reports

  checkElement: (selector = '#container') ->
    return true if @constructor.isLocal is true
    reports = await browser.checkElement selector
    @_assertDiff reports

  open: (path = '') ->
    await browser.url "#{@constructor._PATH_PREFIX}#{path}"
    await browser.waitForVisible \
    @constructor._VISIBLE_SELECTOR, @constructor._WAIT_TIME_AFTER_URL_OPEN
    windowHandle = browser.windowHandle()
    browser.windowHandleMaximize "{#{windowHandle.value}}"
    await browser.pause @constructor._PAUSE_TIME_AFTER_VIEWPORT_CHANGE

  _assertDiff: (results) ->
    results.forEach (result) -> expect(result.isExactSameImage).to.be.true



export default Page