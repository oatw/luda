(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda({
    KEY_LEFT: 37,
    KEY_UP: 38,
    KEY_RIGHT: 39,
    KEY_DOWN: 40,
    KEY_TAB: 9,
    KEY_ESC: 27,
    KEY_ENTER: 13
  });

})));
