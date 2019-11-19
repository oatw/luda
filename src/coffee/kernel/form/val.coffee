import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import parseValue from '../base/parse-value.coffee'
import readValue from '../base/read-value.coffee'
import '../attribute/attr.coffee'
import getValue from './helpers/get-value.coffee'



luda.include

  val: (value) ->
    return @els[0] and getValue(@els[0]) if value is undefined
    @els.forEach (el) ->
      if el.tagName is 'SELECT'
        if Type.isArray value
          val = value
        else if value is null
          val = []
        else
          val = [value]
        hasSelected = false
        options = Array.from el.options
        options.forEach (o) ->
          selected = val.includes readValue(o.value)
          o.selected = selected
          hasSelected ||= selected
        el.selectedIndex = -1 unless hasSelected
        options.forEach (o) ->
          luda(o).attr 'selected', if o.selected then '' else null
      else
        val = if value is null then '' else parseValue value
        el.value = val
        luda(el).attr 'value', val
    this