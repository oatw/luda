var path = require('path')
var fs = require('fs')
var recursive = require('recursive-readdir')

var util = require('./util')



var createSassIndexes = function(){
  var targetDir = path.resolve(__dirname, '../gem/assets/stylesheets/luda')
  var themes = fs.readdirSync(targetDir)
  .filter(function(dir){
    return fs.statSync(path.join(targetDir, dir)).isDirectory() && !dir.match(/kernel/)
  })

  console.log('Creating sass indexes...')
  themes.forEach(function(themeDir, index){
    // console.log('Creating theme index for: ' + themeDir)
    var themeIndexStr = fs.readFileSync(path.resolve(targetDir, themeDir + '/index.sass'), 'utf-8')

    var indexImports = themeIndexStr.match(/@import[\s\t]+(\S+)/g)
    var indexStr = indexImports.map(function(i){
      var rootPath = path.resolve(__dirname, '../gem/assets/stylesheets')
      var indexPath = path.resolve(__dirname, '../gem/assets/stylesheets/luda/' + themeDir, i.match(/@import[\s\t]+(\S+)/)[1].replace(/['"]/g, ''))
      return '@import ' + path.relative(rootPath, indexPath).replace(/\\/g, '/')
    }).join('\n')

    // var indexStr = themeIndexStr.replace(/@import +(\.\/)?/g, '@import luda/')
    var outputPath = path.resolve(targetDir, '_' + themeDir + '.sass')
    util.mkdir(outputPath)
    fs.writeFileSync(outputPath, indexStr)
    // console.log('Index added to: ' + outputPath)
    if(index == themes.length - 1){
      console.log('Sass indexes successfully created.')
    }
  })
}



createSassIndexes()