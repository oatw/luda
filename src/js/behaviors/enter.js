(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('enter', document).protect({
    data: {
      enable: 'enter'
    },
    selectors: ['input[type=checkbox]', 'input[type=radio]', '[tabindex]'],
    trigger: function(e) {
      if (this.html.data(this.data.enable) === false) {
        return;
      }
      if (!luda(e.target).matches(this.selectors.join(','))) {
        return;
      }
      e.preventDefault();
      return setTimeout(function() {
        return e.target.click();
      });
    }
  }).help({
    listen: function() {
      return [['keydown@enter', this.trigger]];
    }
  });

})));
