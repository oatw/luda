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
    disableTargetProp: function() {
      var ref;
      return ((ref = this.attr) != null ? ref.disable : void 0) || 'disabled';
    },
    disableCreate: function() {
      var dataAttr, tabIndex;
      tabIndex = this.root.prop('tabIndex');
      dataAttr = this.data.disable.tabIndex;
      if (!this.root.hasData(dataAttr)) {
        this.root.data(dataAttr, tabIndex);
      }
      return this.root.prop('tabIndex', -1).prop(this.disableTargetProp(), true);
    },
    disableDestroy: function() {
      var tabIndex;
      tabIndex = this.root.data(this.data.disable.tabIndex);
      return this.root.prop('tabIndex', tabIndex).prop(this.disableTargetProp(), false);
    }
  });

})));
