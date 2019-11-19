//= require ../kernel/index
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.mixin('disable', {
    // attr:
    //   disable: 'readonly | disabled'  # optional

    // data:
    //   disable:
    //     tabIndex: string  # required
    disableCreate: function() {
      var dataAttr, ref, rootEl, tabIndex;
      rootEl = this.root.els[0];
      tabIndex = rootEl.tabIndex;
      dataAttr = this.data.disable.tabIndex;
      if (!this.root.hasData(dataAttr)) {
        this.root.data(dataAttr, tabIndex);
      }
      rootEl.tabIndex = -1;
      return rootEl[((ref = this.attr) != null ? ref.disable : void 0) || 'disabled'] = true;
    },
    disableDestroy: function() {
      var ref, rootEl;
      rootEl = this.root.els[0];
      rootEl.tabIndex = this.root.data(this.data.disable.tabIndex);
      return rootEl[((ref = this.attr) != null ? ref.disable : void 0) || 'disabled'] = false;
    }
  });

})));
