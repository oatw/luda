getEnv = ->
  if typeof document isnt 'undefined'
    return window if typeof window isnt 'undefined'
    return global if typeof global isnt 'undefined'
  throw new Error 'Unsupported environment!'



export default getEnv()