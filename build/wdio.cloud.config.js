var path = require('path')
var commonConfig = require('./wdio.common.config')
var VisualRegressionCompare = require('wdio-visual-regression-service/compare')
var capability = require('./wdio.cloud.capability')

var theme = process.env.npm_package_config_theme
var user = process.env.BROWSERSTACK_USERNAME
var key = process.env.BROWSERSTACK_ACCESS_KEY
var testEnv = process.env.LUDA_TEST_ENV

var referenceDirectory = path.join(process.cwd(), 'test/references/' + theme)
var screenshotDirectory = path.join(process.cwd(), 'test/.screenshots/' + theme)
var diffDirectory = path.join(process.cwd(), 'test/.diffs/' + theme)

var getContextInfo = function(context) {
  var join = function(str){
    return str ? str.replace(/ /g, '-') : ''
  }
  var testCase = join(context.test.fullTitle)
  var browserName = join(context.browser.name)
  var browserVersion = join(String(context.browser.version))
  var browserSize = join(context.desiredCapabilities.resolution)
  var orientation = join(context.desiredCapabilities.deviceOrientation)
  var platform = join(context.desiredCapabilities.os || context.desiredCapabilities.device)
  var platformVersion = join(context.desiredCapabilities.os_version)
  var platformInfo = `${platform}${platformVersion}`
  var sizeInfo = `${browserSize || orientation}`
  return {testCase, platformInfo, browserName, browserVersion, sizeInfo}
}

var getReferenceName = function(basePath) {
  return function(context) {
    var info = getContextInfo(context)
    var name = `${info.testCase}__${info.sizeInfo}__${info.browserName}__${info.platformInfo}.png`
    return path.join(basePath, name)
  }
}

var getScreenshotName = function(basePath) {
  return function(context) {
    var info = getContextInfo(context)
    var name = `${info.testCase}__${info.sizeInfo}__${info.browserName}${info.browserVersion}__${info.platformInfo}.png`
    return path.join(basePath, name)
  }
}

var referenceConfig = new VisualRegressionCompare.SaveScreenshot({
  screenshotName: getReferenceName(referenceDirectory)
})

var diffConfig =  new VisualRegressionCompare.LocalCompare({
  referenceName: getReferenceName(referenceDirectory),
  screenshotName: getScreenshotName(screenshotDirectory),
  diffName: getScreenshotName(diffDirectory),
  misMatchTolerance: 0.01,
})



exports.config = Object.assign(commonConfig, {
  user: user,
  key: key,
  browserstackLocal: true,
  capabilities: testEnv === 'reference' ? capability.references : capability.targets,
  services: [
    'browserstack',
    'visual-regression'
  ],
  visualRegression: {
    compare: testEnv === 'reference' ? referenceConfig : diffConfig,
    viewportChangePause: 300
  }
})
