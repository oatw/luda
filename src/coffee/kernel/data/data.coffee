import luda from '../base/luda.coffee'
import readValue from '../base/read-value.coffee'
import parseValue from '../base/parse-value.coffee'
import Type from '../base/type.coffee'
import './remove-data.coffee'
import parseName from './helpers/parse-name.coffee'



luda.include

  data: (name, value) ->
    unless name
      return unless @els[0]
      datas = {}
      datas[key] = readValue val for key, val of @els[0].dataset
      return datas
    if Type.isString name
      name = parseName name
      if arguments.length >= 2
        return this if value is undefined
        return @removeData name if value is null
        val = parseValue value
        @els.forEach (el) -> el.dataset[name] = val
        return this
      return unless @els[0]
      return readValue @els[0].dataset[name]
    @data key, val for key, val of name
    this