import luda from '../kernel/base/luda.coffee'
import {_access} from '../kernel/base/access.coffee'
import '../kernel/event/on.coffee'
import '../kernel/mixin/mixin.coffee'



listened = false
quene = []

luda.mixin 'resetable',

  listen: (fn) ->
    pushed = quene.some (it) => it.Component is @con
    quene.push {Component: @con, reset: fn} unless pushed
    return if listened
    listened = true
    _access document, 'MixinResetable', quene
    luda(document).on 'reset.MixinResetable', (e) ->
      return if e.isDefaultPrevented()
      setTimeout ->
        quene.forEach (it) ->
          reset = it.reset
          inses = Object.values it.Component.instances
          inses.forEach (cache) ->
            ins = cache.instance
            rootEl = ins.root.els[0]
            e.target.contains(rootEl) and reset.call(ins)



export default luda.mixin 'resetable'