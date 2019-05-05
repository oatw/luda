var START = 2019
var date = new Date()
var currentYear = date.getFullYear()

module.exports = currentYear > START ? `${START} - ${currentYear}` : `${START}`