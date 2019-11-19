import '../kernel/index.coffee'
import '../mixins/disable.coffee'



luda.component 'disabled', '[disabled]'

.protect

  data:
    disable:
      tabIndex: 'data-disabled_tabindex'

.protect luda.mixin('disable').all()

.help

  create: -> @disableCreate()

  destroy: -> @disableDestroy()