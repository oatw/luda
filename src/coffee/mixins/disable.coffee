import '../kernel/mixin/mixin.coffee'
import '../kernel/data/data.coffee'
import '../kernel/data/has-data.coffee'



luda.mixin 'disable',

  # attr:
  #   disable: 'readonly | disabled'  # optional

  # data:
  #   disable:
  #     tabIndex: string  # required

  disableCreate: ->
    rootEl = @root.els[0]
    tabIndex = rootEl.tabIndex
    dataAttr = @data.disable.tabIndex
    @root.data dataAttr, tabIndex unless @root.hasData dataAttr
    rootEl.tabIndex = -1
    rootEl[@attr?.disable or 'disabled'] = true

  disableDestroy: ->
    rootEl = @root.els[0]
    rootEl.tabIndex = @root.data @data.disable.tabIndex
    rootEl[@attr?.disable or 'disabled'] = false



export default luda.mixin 'disable'