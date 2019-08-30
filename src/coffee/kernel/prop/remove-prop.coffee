import luda from '../base/luda.coffee'
import splitValues from '../base/split-values.coffee'



luda.include

  removeProp: (prop) ->
    props = splitValues(prop)
    return this unless props.length
    @els.forEach (el) -> props.forEach (p) -> delete el[p]
    this