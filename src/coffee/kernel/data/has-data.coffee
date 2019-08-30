import luda from '../base/luda.coffee'
import parseName from './helpers/parse-name.coffee'



luda.include

  hasData: (key) ->
    return false unless key
    key = parseName key
    @els.some (el) -> el.dataset and key of el.dataset