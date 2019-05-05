ENV = (->
  if typeof document isnt 'undefined'
    return window if typeof window isnt 'undefined'
    return global if typeof global isnt 'undefined'
  throw new Error 'Unsupported runtime environment.'
)()



unless typeof ENV.luda is 'function'
  ENV.luda = (installer) ->
    throw new Error 'Installer cannot be detected.' unless installer
    unless ['object', 'function'].includes typeof installer
      throw new Error 'Installer must be object, array or function.'
    if installer.hasOwnProperty '_SCOPE'
      unless typeof installer._SCOPE is 'string'
        throw new Error '_SCOPE must be string'
      return ENV.luda._install installer._SCOPE, installer
    if installer instanceof Array or typeof installer is 'function'
      throw new Error 'Unscoped installer must be object.'
    installed = {}
    for name, property of installer
      installed[name] = ENV.luda._install name, property
    installed

  ENV.luda._install = (namespace, installer) ->
    if ENV.luda[namespace]
      console.warn "Namespace #{namespace} is ocupied, sikp installation."
      return ENV.luda[namespace]
    for installedName, installedInstaller of ENV.luda
      if installer is installedInstaller
        console.warn "Installer is installed with name #{installedName},
                      skip installation."
        return ENV.luda[installedName]
    if installer._install
      if typeof installer._install is 'function'
        return ENV.luda[namespace] = installer._install()
      return ENV.luda[namespace] = installer._install
    ENV.luda[namespace] = installer