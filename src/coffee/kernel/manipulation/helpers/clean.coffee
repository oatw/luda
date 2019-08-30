import findAll from '../../base/find-all.coffee'
import {clean} from '../../cache/helpers/access.coffee'
import removeEvent from '../../event/helpers/remove-event.coffee'



export default (ctx) ->
  findAll('*', ctx).forEach (el) ->
    removeEvent el
    clean el