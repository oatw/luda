import camelCase from '../../base/camel-case.coffee'
import isVariable from './is-variable.coffee'



export default (prop, isVar) ->
  isVar = isVariable prop if isVar is undefined
  if isVar then prop else camelCase prop