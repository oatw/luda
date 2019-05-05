var path = require('path')
var fs = require('fs')
var recursive = require('recursive-readdir')

var util = require('./util')


var createJsIndex = function(){
  var indexCoffee = fs.readFileSync(path.resolve(__dirname, '../src/coffee/index.coffee'), 'utf-8')
  var directives = indexCoffee.match(/['"].*\.coffee['"]/g).map(function(index){
    var rootPath = path.resolve(__dirname, '../gem/assets/javascripts')
    var indexPath = path.resolve(__dirname, '../gem/assets/javascripts/luda', index.replace(/['"]/g, ''))
    var directivePath = path.relative(rootPath, indexPath).replace(/\.coffee/g, '').replace(/\\/g, '/')
    return '//= require ' + directivePath
    // return index.replace(/['"]/g, '').replace(/\.coffee/g, '').replace(/\.\//, '//= require luda/')
  })
  var outputPath = path.resolve(__dirname, '../gem/assets/javascripts/luda-sprockets.js')
  console.log('Creating javascript index...')
  util.mkdir(outputPath)
  fs.writeFileSync(outputPath, directives.join('\n'))
  console.log('Javascript index successfully created.')
}



var addJsDependencies = function(){
  recursive(path.resolve(__dirname, '../gem/assets/javascripts/luda'))
  .then(function(files){
    console.log('Adding javascripts directives...')
    files.forEach(function(file, index){
      if(file.match(/\.js$/)){
        var filePath = path.resolve(__dirname, file)
        var content = fs.readFileSync(filePath, 'utf-8')
        var matched = content.match(/define\( *(\[.*\])/)
        if(matched){
          // console.log('Adding directives to: ' + filePath)
          var dependencies = JSON.parse(matched[1].replace(/'/g, '"'))
          if(dependencies.length){
            var directives = dependencies.map(function(dependency){
              return '//= require ' + dependency.replace(/\.js/, '')
            })
            util.mkdir(filePath)
            fs.writeFileSync(filePath, directives.join('\n') + '\n' + content)
            // console.log('Directives added to: ' + filePath)
          }
        }
      }
      if(index == files.length - 1){
        console.log('Javascripts directives successfully added.')
      }
    })
  },function(error){
    console.error('Read js directory error:')
    throw error
  })  
}



var createSassIndexes = function(){
  var targetDir = path.resolve(__dirname, '../gem/assets/stylesheets/luda')
  var themes = fs.readdirSync(targetDir)
  .filter(function(dir){
    return fs.statSync(path.join(targetDir, dir)).isDirectory() && !dir.match(/core/)
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


createJsIndex()
addJsDependencies()
createSassIndexes()