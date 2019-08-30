import camelCase from '../../base/camel-case.coffee'



pattern = /^data-/i

parse = (name) -> camelCase name.replace(pattern, '')



export default parse