import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../static.coffee'



luda class extends luda.Static

  @_SCOPE: 'toggle'
  @_TOGGLE_TARGET_ATTRIBUTE: 'data-toggle-target'
  @_TOGGLE_ATTRIBUTE: 'data-toggle'
  @_TOGGLE_FOR_ATTRIBUTE: 'data-toggle-for'
  @_TOGGLE_DISABLED_ATTRIBUTE: 'data-toggle-disabled'
  @_AUTO_DEACTIVATE_ATTRIBUTE: 'data-toggle-auto-deactivate'
  @_AUTO_DEACTIVATE_DURATION: 3000
  @_ACTIVE_CSS_CLASS: 'toggle-active'
  @_SELECTORS: [
    "[#{@_TOGGLE_TARGET_ATTRIBUTE}]"
  ]

  @activate: (name$target) ->
    @_query$targets(name$target).forEach ($target) =>
      return if $target.classList.contains @_ACTIVE_CSS_CLASS
      return if @_isTransitioning $target
      return if @_activatePrevented $target
      $target.classList.add @_ACTIVE_CSS_CLASS
      @_handleActivateEnd $target
      @_delayDeactivate $target if @_shouldAutoDeactivate $target

  @deactivate: (name$target) ->
    @_query$targets(name$target).forEach ($target) =>
      return unless $target.classList.contains @_ACTIVE_CSS_CLASS
      return if @_isTransitioning $target
      return if @_deactivatePrevented $target
      $target.classList.remove @_ACTIVE_CSS_CLASS
      @_handleDeactivateEnd $target

  @toggle: (name$target) ->
    @_query$targets(name$target).forEach ($target) =>
      if $target.classList.contains @_ACTIVE_CSS_CLASS
        @deactivate($target)
      else
        @activate($target)

  @_onElementAdded: ($ele) ->
    @_handleActivateCancel $ele
    @_handleDeactivateCancel $ele
    @_delayDeactivate $ele if @_shouldAutoDeactivate $ele

  @_shouldAutoDeactivate: ($target) ->
    $target.hasAttribute @_AUTO_DEACTIVATE_ATTRIBUTE

  @_delayDeactivate: ($target) ->
    delay = parseInt $target.getAttribute(@_AUTO_DEACTIVATE_ATTRIBUTE), 10
    delay = @_AUTO_DEACTIVATE_DURATION if not delay
    setTimeout =>
      @deactivate $target if $target
    , delay

  @_query$targets: (name$target) ->
    if name$target instanceof Element
      [name$target]
    else
      luda.$children "[#{@_TOGGLE_TARGET_ATTRIBUTE}=#{name$target}]"

  @_init: ->
    self = this
    clickEventSelector = "[#{@_TOGGLE_FOR_ATTRIBUTE}],[#{@_TOGGLE_ATTRIBUTE}]"
    luda.on luda._DOC_READY, ->
      luda.$children(self._selector).forEach ($target) ->
        self._delayDeactivate $target if self._shouldAutoDeactivate $target
    luda.on 'click', clickEventSelector, (e) ->
      toggleChecked = false
      luda.eventPath(e).some ($path) ->
        if $path instanceof Element
          if $path.hasAttribute(self._TOGGLE_ATTRIBUTE) \
          or $path.hasAttribute(self._TOGGLE_FOR_ATTRIBUTE)
            if toggleName = $path.getAttribute self._TOGGLE_FOR_ATTRIBUTE
              self.toggle toggleName
              toggleChecked = true
            if $path.hasAttribute self._TOGGLE_ATTRIBUTE
              if $path.hasAttribute self._TOGGLE_TARGET_ATTRIBUTE
                $toggle = $path
              else
                $toggle = luda.$parent \
                "[#{self._TOGGLE_TARGET_ATTRIBUTE}]", $path
              if $toggle
                self.toggle $toggle
                toggleChecked = true
          else if $path.hasAttribute self._TOGGLE_DISABLED_ATTRIBUTE
            toggleChecked = true