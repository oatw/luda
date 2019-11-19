import luda from '../base/luda.coffee'
import './toggle-class.coffee'



luda.include

  addClass: (cls) -> @toggleClass cls, true