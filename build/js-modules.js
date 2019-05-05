var path = require('path')
var fs = require('fs')

var rollup = require('rollup')
var coffee = require('rollup-plugin-coffee-script')
var recursive = require('recursive-readdir')

var banner = require('./banner')
var util = require('./util')


var getEntries = function(){
  return recursive(path.resolve(__dirname, '../src/coffee'))
  .then(function(files){
    var enteries = []
    files.forEach(function(file){
      if(file.match(/\.coffee$/)){
        enteries.push(file)
      }
    })
    return enteries
  },function(error){
    console.error('Read directory error:')
    throw error
  })  
}



var getExternal = function(entry, entries){
  var external = []
  entries.forEach(function(e){
    if(entry != e){
      external.push(e)
    }
  })
  return external
}

var build = function(entries){
  var startTime = Date.now()
  entries.forEach(function(entry, entryIndex){

    rollup.rollup({
      context: 'this',
      input: entry,
      external: getExternal(entry, entries),
      plugins: [coffee()]
    })
    .then(function(bundle){
      bundle.generate({
        format: 'umd',
        banner: entry.match(/install\.coffee$/) ? banner() : null
      })
      .then(function(output){
        var filePath = entry.replace(/coffee/g, 'js')
        var fileContent = output.code.replace(/\.coffee/g, '.js')
        util.mkdir(filePath)
        fs.writeFileSync(filePath, fileContent)
        console.log('Package saved to: ' + filePath)
        if(entryIndex == entries.length - 1){
          console.log('Entries are successfully builded. ('+ (Date.now() - startTime) +' ms)')
        }
      })
    })

  })
} 


getEntries().then(build)