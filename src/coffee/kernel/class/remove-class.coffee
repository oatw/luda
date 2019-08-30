import luda from '../base/luda.coffee'
import '../attribute/attr.coffee'
import './toggle-class.coffee'



luda.include

  removeClass: (cls) ->
    if arguments.length then @toggleClass cls, false else @attr 'class', ''