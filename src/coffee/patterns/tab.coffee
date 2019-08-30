import Component from '../kernel/component/component.coffee'
import Tabable from '../mixins/tabable.coffee'



Component 'tab'

.protect

  cls:
    tabable:
      active: 'tab-pane-active'
      indicatorActive: 'btn-active'

  data:
    tabable:
      interruption: 'data-tab_interruption'

  evt:
    tabable:
      activate: 'luda:tab:activate'
      activated: 'luda:tab:activated'
      deactivate: 'luda:tab:deactivate'
      deactivated: 'luda:tab:deactivated'

  selector:
    tabable:
      targets: '.tab-pane'
      indicators: '.tab-indicators .btn'

.include Tabable.alias(
  activate: 'tabableActivate'
)

.protect Tabable.all()

.help

  find: -> @tabableFind()

  create: -> @tabableCreate()

  destroy: -> @tabableDestroy()

  watch: -> @tabableWatch()

  listen: -> @tabableListen()