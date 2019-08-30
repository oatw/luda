import luda from '../base/luda.coffee'
import insertContent from './helpers/insert-content.coffee'



luda.include

  prependTo: (selector) ->
    insertContent luda(selector).els, @els.reverse(), true
    this