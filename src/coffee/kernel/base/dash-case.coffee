pattern = /([A-Z])/g

replacer = (match, letter) -> "-#{letter.toLowerCase()}"



export default (str) ->
  "#{str[0].toLowerCase()}#{str.slice(1).replace pattern, replacer}"