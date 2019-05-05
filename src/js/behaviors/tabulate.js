(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../constants.js'), require('../dom.js'), require('../event.js'), require('../static.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../constants.js', '../dom.js', '../event.js', '../static.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Static {
      static _querySameName$radios($radio) {
        var $inputs, selector;
        if ($radio.name) {
          selector = `${this._selector}[name=${$radio.name}]`;
        } else {
          selector = this._selector;
        }
        $inputs = luda.$children(selector);
        return $inputs.filter(function($input) {
          return $input.tabIndex >= 0;
        });
      }

      static _query$prev$next($radio) {
        var $next, $prev, $sameNameRadios, radioIndex;
        $sameNameRadios = this._querySameName$radios($radio);
        radioIndex = $sameNameRadios.indexOf($radio);
        $prev = $sameNameRadios[radioIndex - 1];
        $next = $sameNameRadios[radioIndex + 1];
        return {$prev, $next};
      }

      static _init() {
        var self;
        self = this;
        return luda.on('keydown', function(e) {
          var $next, $prev;
          if (!document.documentElement.hasAttribute(self._DISABLED_ATTRIBUTE) && e.keyCode === luda.KEY_TAB && e.target.nodeName.toUpperCase() === 'INPUT' && e.target.type === 'radio') {
            if (e.shiftKey) {
              if ($prev = self._query$prev$next(e.target).$prev) {
                e.preventDefault();
                return $prev.focus();
              }
            } else {
              if ($next = self._query$prev$next(e.target).$next) {
                e.preventDefault();
                return $next.focus();
              }
            }
          }
        });
      }

    };

    _Class._SCOPE = 'tabulate';

    _Class._SELECTORS = ['input[type=radio]:not([disabled])'];

    _Class._DISABLED_ATTRIBUTE = 'data-tabulate-disabled';

    return _Class;

  }).call(this));

})));
