import luda from '../base/luda.coffee'
import parseClass from './helpers/parse-class.coffee'



luda.include

  hasClass: (cls) ->
    return false unless cls
    cls = parseClass cls
    @els.some (el) -> el.classList.contains cls