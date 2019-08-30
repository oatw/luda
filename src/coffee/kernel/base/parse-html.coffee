import Type from './type.coffee'



containersMap = null

containers = (type) ->
  return containersMap[type] or containersMap['*'] if containersMap
  div = document.createElement 'div'
  table = document.createElement 'table'
  tr = document.createElement 'tr'
  containersMap =
    '*': div
    thead: table
    tbody: table
    tfoot: table
    tr: document.createElement 'tbody'
    th: tr
    td: tr
  containers type



export default (html) ->
  return [] unless Type.isString html
  return [document.createElement RegExp.$1] if Type.isSingleTag html
  container = containers(Type.isFragment html and RegExp.$1)
  container.innerHTML = html
  Array.from(container.childNodes).map (node) ->
    node.parentNode.removeChild node if node.parentNode