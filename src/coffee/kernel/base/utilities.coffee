import luda from './luda.coffee'
import camelCase from './camel-case.coffee'
import dashCase from './dash-case.coffee'
import Type from './type.coffee'
import guid from './guid.coffee'
import pluck from './pluck.coffee'
import unique from './unique.coffee'



[
  'isString'
  'isFunction'
  'isArray'
  'isObject'
  'isBool'
  'isNumeric'
  'isDecimalism'
  'isElement'
].forEach (key) -> luda.extend key, Type[key]

luda.extend

  camelCase: camelCase
  dashCase: dashCase
  guid: guid
  pluck: pluck
  unique: unique