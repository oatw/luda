import luda from '../base/luda.coffee'
import matches from './helpers/matches.coffee'



luda.include

  matches: (selector) ->
    return false unless @els.length
    return false unless selector
    @els.some (el) -> matches el, selector