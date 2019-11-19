import Type from './type.coffee'
import createMounter from './create-mounter.coffee'
import environment from './environment.coffee'
import find from './find.coffee'
import parseHTML from './parse-html.coffee'



class Luda

  constructor: (selector, ctx = document) ->
    @els = []
    @length = 0
    return unless selector
    return selector if selector instanceof Luda
    @els = switch
      when Type.isString selector
        if Type.isHtml selector
          parseHTML selector
        else
          ctx = ctx.els[0] if ctx instanceof Luda
          find selector, ctx
      when selector.nodeType or Type.isWindow selector then [selector]
      when Type.isArray selector then selector
      else Array.from selector
    @length = @els.length



unless luda = environment.luda
  environment.luda = luda = (selector, ctx) -> new Luda selector, ctx
  luda.include = createMounter Luda.prototype, 'including'
  luda.extend = createMounter luda, 'extending'



export {luda, luda as default, Luda}