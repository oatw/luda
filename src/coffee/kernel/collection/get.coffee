import luda from '../base/luda.coffee'



luda.include
  
  get: (index) ->
    return @els if index is undefined
    @els[if index < 0 then index + @els.length else index]