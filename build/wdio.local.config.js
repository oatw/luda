var commonConfig = require('./wdio.common.config')



exports.config = Object.assign(commonConfig, {
  services: ['selenium-standalone'],
  seleniumLogs: '../test/.specs/logs',
  seleniumInstallArgs: {
    baseURL: 'https://selenium-release.storage.googleapis.com',
    version: '3.141.59',
    drivers: {
      chrome: {
        version: '2.44',
        arch: process.arch,
        baseURL: 'https://chromedriver.storage.googleapis.com'
      },
      firefox: {
        version: '0.25.0',
        arch: process.arch,
        baseURL: 'https://github.com/mozilla/geckodriver/releases/download'
      }
    }
  },
  seleniumArgs: {
    version: '3.141.59',
    drivers: {
      chrome: {
        version: '2.44'
      },
      firefox: {
        version: '0.25.0'
      }
    }
  },
  capabilities: [
    {
      browserName: 'chrome'
    },
    {
      browserName: 'firefox'
    },
    {
      browserName: 'safari'
    }
  ]
})