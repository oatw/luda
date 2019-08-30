import Component from '../kernel/component/component.coffee'
import Disable from '../mixins/disable.coffee'



Component 'readonly', '[readonly]'

.protect

  attr:
    disable: 'readonly'

  data:
    disable:
      tabIndex: 'data-readonly_tabindex'

.protect Disable.all()

.help

  create: -> @disableCreate()

  destroy: -> @disableDestroy()