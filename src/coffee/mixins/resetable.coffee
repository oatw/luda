import '../kernel/index.coffee'



listened = false
quene = []

luda.mixin 'resetable',

  listen: (fn) ->
    pushed = quene.some (it) => it.Component is @con
    quene.push {Component: @con, reset: fn} unless pushed
    return if listened
    listened = true
    luda(document).on 'reset.MixinResetable', (e) ->
      return if e.isDefaultPrevented()
      setTimeout ->
        quene.forEach (it) ->
          it.Component.each (ins, rootEl) ->
            e.target.contains(rootEl) and it.reset.call(ins)
            true