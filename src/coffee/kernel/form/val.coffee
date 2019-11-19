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
        [].forEach.call el.options, (option) ->
          selected = val.includes readValue(option.value)
          luda(option).attr 'selected', if selected then '' else null
          option.selected = selected
      else
        val = if value is null then '' else parseValue value
        luda(el).attr 'value', val
        el.value = val
    this