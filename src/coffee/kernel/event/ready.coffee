import luda from '../base/luda.coffee'



luda.extend

  ready: (callback) ->
    if document.readyState is 'loading'
      handler = ->
        callback luda
        document.removeEventListener 'DOMContentLoaded', handler
      document.addEventListener 'DOMContentLoaded', handler
    else
      handler = -> callback luda
      setTimeout handler
    this