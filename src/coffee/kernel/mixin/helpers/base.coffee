import Type from '../../base/type.coffee'



export default class Mixin

  constructor: (conf) -> @conf = conf

  get: (key) -> @conf[key]

  all: -> Object.assign {}, @conf

  only: (keys) ->
    picked = {}
    unless arguments.length is 1 and Type.isArray keys
      keys = Array.from arguments
    keys.forEach (k) => picked[k] = @conf[k] if k of @conf
    picked

  except: (keys) ->
    picked = {}
    unless arguments.length is 1 and Type.isArray keys
      keys = Array.from arguments
    for k, v of @conf
      picked[k] = v unless keys.includes k
    picked

  alias: (newName, name) ->
    picked = {}
    if arguments.length is 1 and Type.isObject newName
      for k, v of newName
        picked[k] = @conf[v] if v of @conf
    else
      picked[newName] = @conf[name] if name of @conf
    picked