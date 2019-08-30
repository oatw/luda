import Component from '../kernel/component/component.coffee'
import Disable from '../mixins/disable.coffee'



Component 'disabled', '[disabled]'

.protect

  data:
    disable:
      tabIndex: 'data-disabled_tabindex'

.protect Disable.all()

.help

  create: -> @disableCreate()

  destroy: -> @disableDestroy()