import {clean} from '../../base/access.coffee'
import findAll from '../../base/find-all.coffee'
import removeEvent from '../../event/helpers/remove-event.coffee'



export default (ctx) ->
  findAll('*', ctx).forEach (el) ->
    removeEvent el
    clean el