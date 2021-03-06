import matches from '../../base/matches.coffee'



export default (selector, node) ->
  return node if matches node, selector
  target = node.parentNode
  until matches target, selector
    target = target.parentNode
  target