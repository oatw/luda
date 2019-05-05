var exec = require('child_process').exec

var config = require('../package.json').config
var themes = config.themes || []

var i = 0
var themesCount = themes.length

var buildTheme = function(){
  if(i < themesCount){
    console.log('Building theme ' + themes[i] + '....................')
    exec('npm run luda-css-build --luda:theme=' + themes[i], function(error, stdout, stderr){
      if(error){
        throw error
      }
      console.log('Theme ' + themes[i] + ' has been built successfully.')
      i++
      buildTheme()
    })
  }
}

buildTheme()