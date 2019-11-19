(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  var listened, quene;

  listened = false;

  quene = [];

  luda.mixin('resetable', {
    listen: function(fn) {
      var pushed;
      pushed = quene.some((it) => {
        return it.Component === this.con;
      });
      if (!pushed) {
        quene.push({
          Component: this.con,
          reset: fn
        });
      }
      if (listened) {
        return;
      }
      listened = true;
      return luda(document).on('reset.MixinResetable', function(e) {
        if (e.isDefaultPrevented()) {
          return;
        }
        return setTimeout(function() {
          return quene.forEach(function(it) {
            return it.Component.each(function(ins, rootEl) {
              e.target.contains(rootEl) && it.reset.call(ins);
              return true;
            });
          });
        });
      });
    }
  });

})));
