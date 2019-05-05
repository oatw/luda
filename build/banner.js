var info = require('../package.json')
var bannerDate = require('./banner-date')

var createThemeStr = function(type){
  if(type == 'css'){
    return `Theme ${process.env.npm_package_config_theme} | `
  }
  return ''
}

var createPackageStr = function(packageName){
  if(packageName){
    return `Module ${packageName} | `
  }
  return ''
}

var createBanner = function(type, packageName){
  var banner = `/*! 
   * Luda ${info.version} | ${createThemeStr(type)}${createPackageStr(packageName)}${info.homepage}
   * Copyright ${bannerDate} ${info.author.name} | ${info.author.blog}
   * MIT license | http://opensource.org/licenses/MIT
   */`
  return banner  
}

module.exports = createBanner