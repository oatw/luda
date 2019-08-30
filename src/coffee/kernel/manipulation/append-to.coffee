import luda from '../base/luda.coffee'
import insertContent from './helpers/insert-content.coffee'



luda.include

  appendTo: (selector) ->
    insertContent luda(selector).els, @els
    this