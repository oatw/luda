import luda from '../kernel/base/luda.coffee'
import Type from '../kernel/base/type.coffee'
import Component from '../kernel/component/component.coffee'
import matches from '../kernel/matches/helpers/matches.coffee'
import '../kernel/class/toggle-class.coffee'
import '../kernel/data/data.coffee'



Focus = Component 'focus', document

.protect

  cls:
    focus: 'focus'

  data:
    enable: 'focus'

  selector:
    focused: '.focus'
    always: [
      'select'
      'textarea'
      ':not(.btn-check):not(.btn-radio):not(.btn-file) >
      input:not([type=button]):not([type=submit]):not([type=reset])'
      '[contenteditable]'
      '[contenteditable=true]'
    ]
    nested: [
      'select'
      '[contenteditable]'
      '[contenteditable=true]'
    ]
    touch: 'input[type=range]'

  disabled: -> @html.data(@data.enable) is false

  addClass: (node) ->
    return if @disabled()
    @focused.els.concat(node).forEach (el) =>
      addable = el is node \
      and el isnt @html.els[0] \
      and el isnt @body.els[0]
      luda(el).toggleClass @cls.focus, addable

  cacheEvt: (e) ->
    return if @disabled() or e.target.disabled
    @evtTriggeredFocus = e.type

  focus: (e) ->
    return if @disabled() or (node = e.target).disabled
    (evt = @evtTriggeredFocus) and delete @evtTriggeredFocus
    if evt and /key/.test evt
      target = node
    else if matches node, @selector.always.join(',')
      target = node
    else if matches node, @selector.nested.join(' *,')
      parent = @selector.nested.join(',')
      e.eventPath().some (el) -> matches(el, parent) and target = el
    @addClass target

  blur: (e) ->
    return if @disabled()
    luda(e.target).toggleClass @cls.focus, false
      
.help

  find: -> focused: @selector.focused

  listen: ->
    [
      ['keydown keyup touchstart mousedown', @cacheEvt]
      ['mousedown focusin', @focus]
      ['touchstart', @selector.touch, @focus]
      ['focusout', @blur]
    ]



luda.include

  focus: (addClass, preventScroll) ->
    return unless el = @els[0]
    ins = Object.values(Focus.instances)[0].instance
    return this if ins.disabled()
    addClass = true unless Type.isBool addClass
    preventScroll = false unless Type.isBool preventScroll
    addClass and ins.addClass el
    el.focus {preventScroll: preventScroll}
    this

  blur: ->
    ins = Object.values(Focus.instances)[0].instance
    return this if ins.disabled()
    @els.forEach (el) -> el.blur()
    this



export default Focus