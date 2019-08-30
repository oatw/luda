(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/disable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/disable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('disabled', '[disabled]').protect({
    data: {
      disable: {
        tabIndex: 'data-disabled_tabindex'
      }
    }
  }).protect(luda.mixin('disable').all()).help({
    create: function() {
      return this.disableCreate();
    },
    destroy: function() {
      return this.disableDestroy();
    }
  });

})));
