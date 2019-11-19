import luda from '../base/luda.coffee'



luda.include

  offsetParent: -> luda(@els[0] and @els[0].offsetParent)