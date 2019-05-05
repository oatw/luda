var path = require('path')
var fs = require('fs')
var info = require('../package.json')

var versionContent = `module Luda
  VERSION = '${info.version}'
end`

var configContent = `module Luda
  SASS_PRECISION = ${info.config.sassPrecision}
end`

console.log('Adding config info...')
fs.writeFileSync(path.resolve(__dirname, '../gem/lib/luda/config.rb'), configContent)
console.log('Config info successfully added.')

console.log('Adding version info...')
fs.writeFileSync(path.resolve(__dirname, '../gem/lib/luda/version.rb'), versionContent)
console.log('Version info successfully added. ('+ info.version +')')