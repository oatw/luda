import readValue from '../../base/read-value.coffee'



export default (el) ->
  if el.multiple and el.options
    val = []
    [].forEach.call el.options, (option) ->
      if option.selected and \
      not option.disabled and \
      not option.parentNode.disabled
        optionValue = readValue option.value
        optionValue = '' if optionValue is undefined or optionValue is null
        val.push optionValue
    return val
  val = readValue el.value
  if val is undefined or val is null then '' else val