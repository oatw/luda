import pluck from '../../base/pluck.coffee'



export default (event) ->
  if event.composedPath
    event.composedPath()
  else if event.path
    event.path
  else
    path = [event.target]
    path = path.concat(pluck path, 'parentNode', true)
    path.push window if document.contains event.target
    path