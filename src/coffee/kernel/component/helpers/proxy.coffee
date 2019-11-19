import Type from '../../base/type.coffee'



constructorAccessWarn = (action, C, key) ->
  return unless key of C and not C.extended.includes key
  msg = "#{action} private property '#{key}' of #{C.id}"
  console.warn msg

createComponentProxy = (C) ->
  proxy = new Proxy C,
    get: (target, key) ->
      constructorAccessWarn 'Getting', C, key
      C[key]
    set: (target, key, val) ->
      constructorAccessWarn 'Setting', C, key
      C[key] = val
    apply: (target, ctx, args) ->
      inses = C.create.apply C, args
      createInstancesProxy inses

instanceAccessWarn = (action, ins, key) ->
  return unless key of ins and not ins.con.included.includes key
  msg = "#{action} private property '#{key}' of #{ins.con.id} #{ins.id}"
  console.warn msg

createInstancesProxy = (inses) ->
  proxy = new Proxy inses,
    set: (target, key, val) ->
      inses.map (ins) ->
        instanceAccessWarn 'Setting', ins, key
        ins[key] = val
    get: (target, key) ->
      vals = inses.map (ins) ->
        instanceAccessWarn 'Getting', ins, key
        ins[key]
      createInstancesCallProxy inses, vals, key, proxy

createInstancesCallProxy = (inses, vals, key, instancesProxy) ->
  proxy = new Proxy new Function(),
    get: (target, k) ->
      return vals[k] unless Type.isFunction vals[k]
      vals[k].bind vals
    apply: (target, ctx, args) ->
      returns = inses.map (ins) -> ins[key].apply ins, args
      option = args[args.length - 1]
      if Type.isObject(option) and option.chain is false
        returns
      else
        instancesProxy



export default (Component) -> createComponentProxy Component