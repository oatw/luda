import Type from './type.coffee'



export default (selector, ctx = document) ->
  return [] unless Type.isDocument(ctx) or Type.isElement(ctx)
  Array.from switch
    when Type.isClass selector
      ctx.getElementsByClassName selector.slice(1)
    when Type.isTag selector
      ctx.getElementsByTagName selector
    # when Type.isId selector
    #  if el = ctx.getElementById selector.slice(1) then [el] else []
    else
      ctx.querySelectorAll selector