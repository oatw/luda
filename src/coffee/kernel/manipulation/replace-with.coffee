import luda from '../base/luda.coffee'
import './before.coffee'
import './remove.coffee'



luda.include

  replaceWith: (selector) -> @before(selector).remove()