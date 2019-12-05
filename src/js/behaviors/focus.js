(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  var Focus;

  Focus = luda.component('focus', document).protect({
    cls: {
      focus: 'focus'
    },
    selector: {
      focused: '.focus',
      always: ['select', 'textarea', ':not(.btn-check):not(.btn-radio):not(.btn-file) > input:not([type=button]):not([type=submit]):not([type=reset])', '[contenteditable]', '[contenteditable=true]'],
      nested: ['select', '[contenteditable]', '[contenteditable=true]'],
      touch: 'input[type=range]'
    }
  }).protect({
    disabled: function() {
      return this.html.data('focus') === false;
    }
  }).protect({
    addClass: function(node) {
      if (this.disabled()) {
        return;
      }
      return this.focused.els.concat(node).forEach((el) => {
        var addable;
        addable = el === node && el !== this.html.els[0] && el !== this.body.els[0];
        return luda(el).toggleClass(this.cls.focus, addable);
      });
    },
    cacheEvt: function(e) {
      if (this.disabled() || e.target.disabled) {
        return;
      }
      return this.evtTriggeredFocus = e.type;
    },
    focus: function(e) {
      var evt, node, parent, target;
      if (this.disabled() || (node = e.target).disabled) {
        return;
      }
      (evt = this.evtTriggeredFocus) && delete this.evtTriggeredFocus;
      if (evt && /key/.test(evt)) {
        target = node;
      } else if (luda(node).is(this.selector.always.join(','))) {
        target = node;
      } else if (luda(node).is(this.selector.nested.join(' *,'))) {
        parent = this.selector.nested.join(',');
        e.eventPath().some(function(el) {
          return luda(el).is(parent) && (target = el);
        });
      }
      return this.addClass(target);
    },
    blur: function(e) {
      if (this.disabled()) {
        return;
      }
      return luda(e.target).toggleClass(this.cls.focus, false);
    }
  }).help({
    find: function() {
      return {
        focused: this.selector.focused
      };
    },
    listen: function() {
      return [['keydown keyup touchstart mousedown', this.cacheEvt], ['mousedown focusin', this.focus], ['touchstart', this.selector.touch, this.focus], ['focusout', this.blur]];
    }
  });

  luda.include({
    focus: function(addClass, preventScroll) {
      var el, ins;
      if (!(el = this.els[0])) {
        return;
      }
      ins = Object.values(Focus.instances)[0].instance;
      if (ins.disabled()) {
        return this;
      }
      if (!luda.isBool(addClass)) {
        addClass = true;
      }
      if (!luda.isBool(preventScroll)) {
        preventScroll = false;
      }
      addClass && ins.addClass(el);
      el.focus({
        preventScroll: preventScroll
      });
      return this;
    },
    blur: function() {
      var ins;
      ins = Object.values(Focus.instances)[0].instance;
      if (ins.disabled()) {
        return this;
      }
      this.els.forEach(function(el) {
        return el.blur();
      });
      return this;
    }
  });

})));
