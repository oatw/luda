import luda from '../base/luda.coffee'
import unique from '../base/unique.coffee'



luda.include

  contents: ->
    all = []
    @els.forEach (el) ->
      if el.tagName is 'IFRAME'
        content = [el.contentDocument]
      else
        content = el.childNodes
      [].push.apply all, content
    luda unique(all)