import luda from '../base/luda.coffee'
import guid from '../base/guid.coffee'
import Type from '../base/type.coffee'
import print from './helpers/print.coffee'



active = false

pubLabelStyle = 'color:#0085ff;font-weight:bold'
prvLabelStyle = 'color:#f8427f;font-weight:bold'
infoStyle = 'color:#383838;font-weight:bold'

factory = (style, label) ->
  log = ->
    return active unless arguments.length
    if arguments.length is 1 and Type.isBool arguments[0]
      active = arguments[0]
      msg = "Luda log #{if active then 'opened' else 'closed'}."
      return log msg
    return unless active
    time = Date.now()
    print "\n\n\n#{label}LOG #{guid()} #{time}", style.label
    Array.from(arguments).forEach (arg) -> print arg, style.info

luda.extend 'log', factory({info: infoStyle, label: pubLabelStyle}, '')



export default factory({info: infoStyle, label: prvLabelStyle}, 'LUDA ')