import '../kernel/index.coffee'
import '../mixins/disable.coffee'



luda.component 'readonly', '[readonly]'

.protect

  attr:
    disable: 'readonly'

  data:
    disable:
      tabIndex: 'data-readonly_tabindex'

.protect luda.mixin('disable').all()

.help

  create: -> @disableCreate()

  destroy: -> @disableDestroy()