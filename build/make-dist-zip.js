var fs = require('fs')
var path = require('path')
var archiver = require('archiver')

var info = require('../package.json')
var util = require('./util')

var zipFileName = `luda-${info.version}`
var outputPath = path.resolve(__dirname, `../release/dist/${zipFileName}.zip`)

util.mkdir(outputPath)

var output = fs.createWriteStream(outputPath)
var archive = archiver('zip', {
  zlib: { level: 9 }
})
 
output.on('close', function() {
  console.log(`Dist files has been packed successfully. The size of the output zip file is ${archive.pointer()/1024} KB`)
})
 
archive.on('warning', function(err) {
  throw err
})
 
archive.on('error', function(err) {
  throw err
})
 
archive.pipe(output)
archive.directory(path.resolve(__dirname, '../dist/'), zipFileName);
archive.finalize()