(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('enter', document).protect({
    selectors: ['input[type=checkbox]', 'input[type=radio]', '[tabindex]']
  }).protect({
    disabled: function() {
      return this.html.data('enter') === false;
    }
  }).protect({
    trigger: function(e) {
      if (this.disabled()) {
        return;
      }
      if (!luda(e.target).is(this.selectors.join(','))) {
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
