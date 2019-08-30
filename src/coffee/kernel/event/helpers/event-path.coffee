import pluck from '../../base/pluck.coffee'



export default (event) ->
  if event.composedPath
    event.composedPath()
  else if event.path
    event.path
  else
    [event.target].concat(pluck [event.target], 'parentNode', true)