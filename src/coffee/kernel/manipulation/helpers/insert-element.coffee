import evalScripts from './eval-scripts.coffee'



export default (anchor, child, prepend, prependTarget) ->
  if prepend
    anchor.insertBefore child, prependTarget
  else
    anchor.appendChild child
  evalScripts child