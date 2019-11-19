import luda from '../base/luda.coffee'
import '../traversal/contents.coffee'
import './append.coffee'
import './wrap-all.coffee'



luda.include

  wrapInner: (selector) ->
    @els.forEach (el) ->
      target = luda el
      contents = target.contents()
      if contents.els.length
        contents.wrapAll selector
      else
        target.append selector
    this