import expando from '../kernel/base/expando.coffee'
import Component from '../kernel/component/component.coffee'
import Toggleable from '../mixins/toggleable.coffee'
import '../kernel/collection/filter.coffee'
import '../kernel/data/data.coffee'
import '../kernel/traversal/parent.coffee'



Component 'dropdown', '.dropdown-absolute,
                       .dropdown-static,
                       .dropdown-fixed,
                       .dropdown-static-m'

.protect

  cls:
    toggleable:
      active: 'dropdown-active'

  data:
    standalone: 'data-dropdown-standalone'
    toggleable:
      interruption: 'data-dropdown_interruption'
      trigger: 'data-dropdownable'

  default:
    toggleable:
      trigger: true

  evt:
    toggleable:
      activate: 'luda:dropdown:activate'
      activated: 'luda:dropdown:activated'
      deactivate: 'luda:dropdown:deactivate'
      deactivated: 'luda:dropdown:deactivated'

  selector:
    items: 'a[href]:not([disabled]),button:not([disabled]),
            input:not([disabled]),[tabindex]:not([disabled]),
            area[href]:not([disabled]),iframe:not([disabled])'
    toggleable:
      target: '.dropdown-menu'

.include Toggleable.alias(
  activate: 'toggleableActivate'
  deactivate: 'toggleableDeactivate'
  toggle: 'toggleableToggle'
)

.protect Toggleable.all()

.protect

  parent: ->
    rootEl = @parentRoot.els[0]
    if rootEl then @con.create(rootEl)[0] else null

  escDeactivate: (e) ->
    if @toggleableActive()
      @toggleableDeactivateOnEvent e
    else if parent = @parent()
      parent.escDeactivate e

  prevItem: (e) ->
    if @toggleableActive()
      return unless (items = @items.els).length
      index = items.indexOf(document.activeElement) - 1
      index = 0 if index < 0
      items[index].focus()
    else if parent = @parent()
      parent.prevItem e

  nextItem: (e) ->
    if @toggleableActive()
      return unless (items = @items.els).length
      index = items.indexOf(document.activeElement) + 1
      index = items.length - 1 if index >= items.length
      items[index].focus()
    else if parent = @parent()
      parent.nextItem e

.help

  find: ->
    Object.assign @toggleableFind(),
      parentRoot: -> @root.parent @con.root
      items: ->
        self = this
        menu = @toggleableTarget
        menu.find(@selector.items).filter((el) ->
          parentMenu = luda(el).parent(self.selector.toggleable.target)
          parentMenu.els[0] is menu.els[0]
        )

  listen: ->
    self = this
    [
      ['click', @toggleableToggleOnEvent]
      ['keyup@tab', @toggleableActivateOnEvent]
      ['keydown@esc&prevent', @escDeactivate]
      ['keydown@left@up&prevent', @prevItem]
      ['keydown@right@down&prevent', @nextItem]
      ['click keyup@tab', (e) ->
        exceptions = []
        e.eventPath().forEach (el) ->
          cache = self.con.instances[el[expando]]
          exceptions.push cache if cache
        Object.values(self.con.instances).forEach (cache) ->
          ins = cache.instance
          isExcepted = exceptions.includes cache
          isStandalone = ins.root.hasData self.data.standalone
          not isExcepted and not isStandalone and ins.deactivate()
      ]
    ]