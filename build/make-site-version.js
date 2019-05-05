var fs = require('fs')
var path = require('path')
var info = require('../package.json')

var version = `window.site = window.site || {}
window.site.latestVersion = "${info.config.siteVersion}"`

fs.writeFileSync(path.resolve(__dirname,'../site/.jekyll' + process.env.npm_package_config_siteBaseUrl + '/version.js'), version)