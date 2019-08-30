import luda from '../base/luda.coffee'
import camelCase from '../base/camel-case.coffee'
import dashCase from '../base/dash-case.coffee'
import guid from '../base/guid.coffee'
import Type from '../base/type.coffee'
import '../event/ready.coffee'
import {autoCreateAndDestroy, autoable} from './helpers/auto.coffee'
import Base from './helpers/base.coffee'
import createProxy from './helpers/proxy.coffee'



luda.extend 'component', factory = (name, root) ->
   
  class Component extends Base

    @id: camelCase "Component#{if name then '-' + name else '_' + guid()}"
    @root: if root then root else if name then ".#{dashCase name}" else document
    @instances: {}
    @helpers: {}
    @included: ['toString']
    @extended: ['toString']
    @eventsBinded: false
    @autoEnabled: false
    @traversalAdded: false
    @watches: null



  luda.extend name, createProxy Component if name
  luda.ready ->
    Component.create Component.root if Type.isDocument Component.root
    return unless Type.isString Component.root
    Component.create autoable(Component.root)
    autoCreateAndDestroy Component
    Component.autoEnabled = true
  Component



export default factory