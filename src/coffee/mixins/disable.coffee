import '../kernel/index.coffee'



luda.mixin 'disable',

  # attr:
  #   disable: 'readonly | disabled'  # optional

  # data:
  #   disable:
  #     tabIndex: string  # required

  disableTargetProp: -> @attr?.disable or 'disabled'

  disableCreate: ->
    tabIndex = @root.prop 'tabIndex'
    dataAttr = @data.disable.tabIndex
    @root.data dataAttr, tabIndex unless @root.hasData dataAttr
    @root.prop('tabIndex', -1).prop @disableTargetProp(), true

  disableDestroy: ->
    tabIndex = @root.data @data.disable.tabIndex
    @root.prop('tabIndex', tabIndex).prop @disableTargetProp(), false