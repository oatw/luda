pattern = /-([a-z])/g

replacer = (match, letter) -> letter.toUpperCase()



export default (str) -> str.replace pattern, replacer