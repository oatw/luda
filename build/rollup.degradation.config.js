var coffee = require('rollup-plugin-coffee-script')
var info = require('../package.json')
var bannerDate = require('./banner-date')

var banner = `/*! 
 * Luda degradation script ${info.version} | ${info.homepage}
 * Copyright ${bannerDate} ${info.author.name} | ${info.author.blog}
 * MIT license | http://opensource.org/licenses/MIT
 */`

module.exports = [{
  context: 'this',
  plugins: [ coffee() ],
  output: {
    format: 'umd',
    banner: banner
  }
}]