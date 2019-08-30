(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/disable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/disable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('readonly', '[readonly]').protect({
    attr: {
      disable: 'readonly'
    },
    data: {
      disable: {
        tabIndex: 'data-readonly_tabindex'
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
