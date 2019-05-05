//= require ./install
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda({
    except: function(element, arr) {
      if (arr.includes(element)) {
        return arr.splice(arr.indexOf(element), 1);
      }
    }
  });

})));
