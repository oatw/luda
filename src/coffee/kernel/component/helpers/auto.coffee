import expando from '../../base/expando.coffee'
import findAll from '../../base/find-all.coffee'
import matches from '../../base/matches.coffee'
import Type from '../../base/type.coffee'
import unique from '../../base/unique.coffee'
import {_access} from '../../cache/helpers/access.coffee'



disAutoSelector = '[data-auto=false]'

Components = []

observer = null

config =
  childList: true
  subtree: true
  attributes: true
 
autoCreateAndDestroy = (Component) ->
  return if Components.includes Component
  Components.push Component
  return if observer
  observer = new MutationObserver (mus) ->
    nodes = []
    attrNodes = []
    mus.forEach (mu) ->
      nodes = nodes
      .concat(Array.from mu.addedNodes)
      .concat(Array.from mu.removedNodes)
      attrNodes.push mu.target if mu.type is 'attributes'
    nodes = unique nodes
    attrNodes = unique attrNodes
    Components.forEach (C) ->
      els = []
      nodes.forEach (node) -> els = els.concat(findAll C.root, node)
      unique(els).forEach (el) ->
        return if matches el, disAutoSelector
        if document.contains el then C.create el else C.destroy el
      attrNodes.forEach (el) ->
        return unless Type.isElement el
        return if matches el, disAutoSelector
        if matches el, C.root
          C.create el
        else if C.instances[el[expando]]
          C.destroy el

  observer.observe document, config
  _access document, 'ComponentsAutomation',
    Components: Components
    watcher: observer

autoable = (selector) -> "#{selector}:not(#{disAutoSelector})"



export {autoCreateAndDestroy, autoable}