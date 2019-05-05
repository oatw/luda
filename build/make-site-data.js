var fs = require('fs')
var path = require('path')
var yaml = require('yamljs')

var data = require('../package.json').config
var siteData = {luda: data}
var yamlStr = yaml.stringify(siteData, 2)

fs.writeFileSync(path.resolve(__dirname, './.site.data.yml'), yamlStr)