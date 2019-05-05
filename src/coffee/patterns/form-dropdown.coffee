import '../install.coffee'
import '../dom.coffee'
import '../event.coffee'
import '../factory.coffee'
import '../behaviors/focus.coffee'
import '../behaviors/enter.coffee'



luda class extends luda.Factory

  @_SCOPE: 'fmDropdown'

  @_SELECTOR: '.fm-dropdown'
  @_VALUE_SPLITOR: '   '
  @_LABEL_ATTRIBUTE: 'data-fm-dropdown-label'
  @_VALUE_SELECTOR: '.dropdown-items .btn-radio input,
                     .dropdown-items .btn-check input'
  @_DEFAULT_VALUE_SELECTOR: '.dropdown-items .btn-radio label,
                             .dropdown-items .btn-check label'
  @_VALUE_HOLDER_SELECTOR: '.fm input'
  @_ENTER_BEHAVIOR_SELECTOR: '.fm-dropdown .fm input'

  @_observerConfig:
    childList: true
    attributes: true
    subtree: true
    attributeFilter: [
      'checked'
      @_LABEL_ATTRIBUTE
    ]

  _getConfig: ->
    _$values = luda.$children @constructor._VALUE_SELECTOR, @_$component
    _$defaultValues = luda.$children \
    @constructor._DEFAULT_VALUE_SELECTOR, @_$component
    _$valueHolder = luda.$child \
    @constructor._VALUE_HOLDER_SELECTOR, @_$component
    {_$values, _$valueHolder, _$defaultValues}

  _constructor: ->
    {
      @_$values,
      @_$valueHolder,
      @_$defaultValues
    } = @_getConfig()
    @_setValueHolderAttribute()
    @_setValueHolderValue()

  _onMutations: ->
    @_constructor()

  _setValueHolderValue: ->
    values = []
    @_$values.forEach ($value, index) =>
      if $value.checked
        if $value.hasAttribute @constructor._LABEL_ATTRIBUTE
          value = $value.getAttribute @constructor._LABEL_ATTRIBUTE
        else
          value = @_$defaultValues[index].innerText
      values.push value if value and not values.includes value
    if @_$valueHolder
      @_$valueHolder.value = values.join @constructor._VALUE_SPLITOR

  _setValueHolderAttribute: ->
    @_$valueHolder.setAttribute('readonly', '') if @_$valueHolder

  @_init: ->
    self = this
    luda.enter._add @_ENTER_BEHAVIOR_SELECTOR
    luda.on 'change', "#{@_SELECTOR} #{@_VALUE_SELECTOR}", (e) ->
      self.query(luda.$parent self._SELECTOR, this)._setValueHolderValue()
    luda.on luda._FORM_RESET, @_SELECTOR, (e) ->
      setTimeout => self.query(this)._setValueHolderValue()
    # prevent ios device pop out wired navigation pannel
    if /iphone/i.test(navigator.userAgent) or /ipad/i.test(navigator.userAgent)
      luda.on 'focusin', @_ENTER_BEHAVIOR_SELECTOR, (e) ->
        this.blur()
        this.classList.add luda.focus._CSS_CLASS