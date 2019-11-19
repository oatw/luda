import luda from '../../base/luda.coffee'
import Variables from './variables.coffee'
import '../trigger.coffee'



startX = startY = NaN
triggered = false

touchStartHandler = (e) ->
  return if e.defaultPrevented
  return unless e.touches.length is 1
  startX = e.touches[0].screenX
  startY = e.touches[0].screenY
  triggered = false

touchMoveHandler = (e) ->
  return if e.defaultPrevented
  return unless e.touches.length is 1
  return if triggered
  endX = e.touches[0].screenX
  xMoved = endX - startX
  if Math.abs(xMoved) >= Variables.swipeDistance
    triggered = true
    direction = if xMoved > 0 then 'right' else 'left'
    return luda(e.target).trigger(createEvent direction, startX, endX, xMoved)
  endY = e.touches[0].screenY
  yMoved = endY - startY
  if Math.abs(yMoved) >= Variables.swipeDistance
    triggered = true
    direction = if yMoved > 0 then 'down' else 'up'
    luda(e.target).trigger(createEvent direction, startY, endY, yMoved)

createEvent = (direction, start, end, moved) ->
  event = new CustomEvent Variables.swipeEvents[direction],
    bubbles: true
    cancelable: true
    composed: true
  event.start = start
  event.end = end
  event.distance = Math.abs moved
  event



export default
  add: (el) ->
    el.addEventListener 'touchstart', touchStartHandler
    el.addEventListener 'touchmove', touchMoveHandler

  remove: (el) ->
    el.removeEventListener 'touchstart', touchStartHandler
    el.removeEventListener 'touchmove', touchMoveHandler