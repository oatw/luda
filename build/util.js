var path = require('path')
var fs = require('fs')

module.exports = {

  mkdir: function (filePath) {
    var dirname = path.dirname(filePath)
    if (fs.existsSync(dirname)) {
      return true
    }
    this.mkdir(dirname)
    fs.mkdirSync(dirname)
  }

}