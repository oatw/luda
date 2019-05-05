import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../static.coffee'



luda class extends luda.Static

  @_SCOPE: 'focus'

  @_CSS_CLASS: 'focus'
  # mouse focusable selectors
  @_SELECTORS: ['select'
                'textarea'
                ':not(.btn-check):not(.btn-radio):not(.btn-file) >
                 input:not([type=button]):not([type=submit]):not([type=reset])'
              ]
  @_TOUCHSTART_FOCUS_SELECTOR: 'input[type=range]'
  @_PARENT_FOCUS_SELECTOR: 'select[multiple]'
  @_PARENT_FOCUS_CHILDREN_SELECTOR: "#{@_PARENT_FOCUS_SELECTOR} *"

  @_DISABLED_ATTRIBUTE: 'data-focus-disabled'

  @_$focus: document.getElementsByClassName(@_CSS_CLASS)

  @_isActive: ->
    not document.documentElement.hasAttribute(@_DISABLED_ATTRIBUTE)

  @_removeFocusClassExcept: ($exception) ->
    Array.from(@_$focus).forEach ($focus) =>
      $focus.classList.remove @_CSS_CLASS if $focus isnt $exception

  @_addFocusClassExceptHtmlAndBody: ($target) ->
    if $target isnt document.body and $target isnt document.documentElement
      $target.classList.add @_CSS_CLASS

  @_changeFocusStateOnKeyEvent: (e) ->
    if @_isActive()
      @_removeFocusClassExcept e.target
      @_addFocusClassExceptHtmlAndBody e.target

  @_changeFocusStateOnMouseDownEvent: (e) ->
    if @_isActive()
      if e.target.matches @_PARENT_FOCUS_CHILDREN_SELECTOR
        target = luda.$parent @_PARENT_FOCUS_SELECTOR, e.target
      else
        target = e.target
      if target.matches @_selector
        @_removeFocusClassExcept target
        @_addFocusClassExceptHtmlAndBody target
      else
        @_removeFocusClassExcept()

  @_setElementPrototype: ->
    focus = HTMLElement.prototype.focus
    blur = HTMLElement.prototype.blur
    self = this
    HTMLElement.prototype.focus = ->
      focus.apply this, arguments
      if self._isActive() and document.activeElement is this
        self._removeFocusClassExcept this
        self._addFocusClassExceptHtmlAndBody this
    HTMLElement.prototype.blur = ->
      blur.apply this, arguments
      this.classList.remove self._CSS_CLASS if self._isActive()

  @_init: ->
    self = this
    @_setElementPrototype()
    luda.on 'keydown', @_changeFocusStateOnKeyEvent.bind this
    luda.on 'keyup', @_changeFocusStateOnKeyEvent.bind this
    luda.on 'mousedown', @_changeFocusStateOnMouseDownEvent.bind this
    luda.on 'touchstart', @_TOUCHSTART_FOCUS_SELECTOR, \
    @_changeFocusStateOnMouseDownEvent.bind this
    luda.on 'focusin', @_changeFocusStateOnMouseDownEvent.bind this