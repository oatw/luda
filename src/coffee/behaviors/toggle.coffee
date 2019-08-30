import '../kernel/index.coffee'
import '../mixins/toggleable.coffee'



luda.component 'toggle', '[data-toggle-target]'

.protect

  cls:
    toggleable:
      active: 'toggle-active'

  data:
    target: 'data-toggle-target'
    for: 'data-toggle-for'
    auto: 'data-toggle-auto-deactivate'
    toggleable:
      interruption: 'data-toggle_interruption'
      trigger: 'data-toggleable'

  default:
    autoDuration: 3000

  evt:
    toggleable:
      activate: 'luda:toggle:activate'
      activated: 'luda:toggle:activated'
      deactivate: 'luda:toggle:deactivate'
      deactivated: 'luda:toggle:deactivated'

.include

  activate: ->
    return unless @toggleableActivate()
    @toggleAutoState()
  
  deactivate: ->
    return unless @toggleableDeactivate()
    @toggleAutoState()

  toggle: (force) ->
    return unless @toggleableToggle force
    @toggleAutoState()

.protect luda.mixin('toggleable').all()

.protect

  toggleAutoState: ->
    return unless @root.hasData @data.auto
    if @toggleableActive()
      @auto = setTimeout =>
        delete @auto
        @deactivate()
      , @root.data(@data.auto) or @default.autoDuration
    else
      clearTimeout @auto
      delete @auto

  toggleOnEvent: (e) ->
    return unless @toggleableToggleOnEvent(e)
    @toggleAutoState()

.help

  find: -> @toggleableFind()

  create: ->
    @toggleableCreate()
    @toggleAutoState()

  destroy: ->
    @toggleableDestroy()
    'auto' of this and clearTimeout @auto
  
  listen: ->
    self = this
    [
      ['click', @toggleOnEvent]
      ['click', "[#{@data.for}]", (e) ->
        name = luda(this).data self.data.for
        self.con.each (ins) ->
          return unless ins.root.data(self.data.target) is name
          ins.toggleOnEvent(e)
          true
      ]
    ]