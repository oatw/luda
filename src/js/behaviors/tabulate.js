(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('tabulate', document).protect({
    selector: 'input[type=radio]:not([disabled])'
  }).protect({
    disabled: function() {
      return this.html.data('tabulate') === false;
    }
  }).protect({
    findSiblings: function(radio) {
      var index, name, radios, selector;
      selector = this.selector;
      if (name = radio.name) {
        selector = `${selector}[name=${name}]`;
      }
      radios = luda(selector).els.filter(function(el) {
        return el.tabIndex >= 0;
      });
      index = radios.indexOf(radio);
      return {
        prev: radios[index - 1],
        next: radios[index + 1]
      };
    },
    trigger: function(e) {
      var next, prev;
      if (this.disabled()) {
        return;
      }
      if (e.shiftKey) {
        if (prev = this.findSiblings(e.target).prev) {
          e.preventDefault();
          return prev.focus();
        }
      } else {
        if (next = this.findSiblings(e.target).next) {
          e.preventDefault();
          return next.focus();
        }
      }
    }
  }).help({
    listen: function() {
      return [['keydown@tab', this.selector, this.trigger]];
    }
  });

})));
