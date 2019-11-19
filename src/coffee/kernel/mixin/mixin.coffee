import luda from '../base/luda.coffee'
import Type from '../base/type.coffee'
import Mixin from './helpers/base.coffee'
import {mount, unmount, get, named} from './helpers/named.coffee'



luda.extend

  mixin: (name, conf) ->
    if arguments.length is 1
      if Type.isString name
        get name
      else
        new Mixin conf
    else
      if conf is null
        unmount name
        this
      else
        mixin = new Mixin conf
        mount name, mixin
        this

luda.mixin.named = named