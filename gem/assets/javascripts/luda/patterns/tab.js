//= require ../kernel/index
//= require ../mixins/tabable
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/tabable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/tabable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('tab').protect({
    cls: {
      tabable: {
        active: 'tab-pane-active',
        indicatorActive: 'btn-active'
      }
    },
    data: {
      tabable: {
        interruption: 'data-tab_interruption'
      }
    },
    evt: {
      tabable: {
        activate: 'luda:tab:activate',
        activated: 'luda:tab:activated',
        deactivate: 'luda:tab:deactivate',
        deactivated: 'luda:tab:deactivated'
      }
    },
    selector: {
      tabable: {
        targets: '.tab-pane',
        indicators: '.tab-indicators .btn'
      }
    }
  }).include(luda.mixin('tabable').alias({
    activate: 'tabableActivate'
  })).protect(luda.mixin('tabable').all()).help({
    find: function() {
      return this.tabableFind();
    },
    create: function() {
      return this.tabableCreate();
    },
    destroy: function() {
      return this.tabableDestroy();
    },
    watch: function() {
      return this.tabableWatch();
    },
    listen: function() {
      return this.tabableListen();
    }
  });

})));
