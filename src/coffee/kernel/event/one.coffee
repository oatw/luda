import luda from '../base/luda.coffee'
import './on.coffee'



luda.include

  one: (name, selector, callback) -> @on name, selector, callback, true