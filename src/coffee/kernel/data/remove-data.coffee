import luda from '../base/luda.coffee'
import splitValues from '../base/split-values.coffee'
import parseName from './helpers/parse-name.coffee'



luda.include

  removeData: (name) ->
    if arguments.length
      names = splitValues name
      return this unless names.length
      names = names.map (n) -> parseName n
      @els.forEach (el) -> names.forEach (n) ->
        n of el.dataset and delete el.dataset[n]
    else
      @els.forEach (el) ->
        for n, val of el.dataset
          n of el.dataset and delete el.dataset[n]
    this