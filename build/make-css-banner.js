var fs = require('fs')
var path= require('path')
var banner = require('./banner.js')

var bannerStr = `// sass-lint:disable no-empty-rulesets
+install(banner)
  ${banner('css')}`

fs.writeFileSync(path.resolve(__dirname,'../src/sass/' + process.env.npm_package_config_theme + '/_banner.sass'), bannerStr)