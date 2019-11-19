import '../kernel/index.coffee'
import '../mixins/tabable.coffee'



luda.component 'tab'

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

.include luda.mixin('tabable').alias(
  activate: 'tabableActivate'
)

.protect luda.mixin('tabable').all()

.help

  find: -> @tabableFind()

  create: -> @tabableCreate()

  destroy: -> @tabableDestroy()

  watch: -> @tabableWatch()

  listen: -> @tabableListen()