(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../dom.js'), require('../event.js'), require('../static.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../dom.js', '../event.js', '../static.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Static {
      static _isActive() {
        return !document.documentElement.hasAttribute(this._DISABLED_ATTRIBUTE);
      }

      static _removeFocusClassExcept($exception) {
        return Array.from(this._$focus).forEach(($focus) => {
          if ($focus !== $exception) {
            return $focus.classList.remove(this._CSS_CLASS);
          }
        });
      }

      static _addFocusClassExceptHtmlAndBody($target) {
        if ($target !== document.body && $target !== document.documentElement) {
          return $target.classList.add(this._CSS_CLASS);
        }
      }

      static _changeFocusStateOnKeyEvent(e) {
        if (this._isActive()) {
          this._removeFocusClassExcept(e.target);
          return this._addFocusClassExceptHtmlAndBody(e.target);
        }
      }

      static _changeFocusStateOnMouseDownEvent(e) {
        var target;
        if (this._isActive()) {
          if (e.target.matches(this._PARENT_FOCUS_CHILDREN_SELECTOR)) {
            target = luda.$parent(this._PARENT_FOCUS_SELECTOR, e.target);
          } else {
            target = e.target;
          }
          if (target.matches(this._selector)) {
            this._removeFocusClassExcept(target);
            return this._addFocusClassExceptHtmlAndBody(target);
          } else {
            return this._removeFocusClassExcept();
          }
        }
      }

      static _setElementPrototype() {
        var blur, focus, self;
        focus = HTMLElement.prototype.focus;
        blur = HTMLElement.prototype.blur;
        self = this;
        HTMLElement.prototype.focus = function() {
          focus.apply(this, arguments);
          if (self._isActive() && document.activeElement === this) {
            self._removeFocusClassExcept(this);
            return self._addFocusClassExceptHtmlAndBody(this);
          }
        };
        return HTMLElement.prototype.blur = function() {
          blur.apply(this, arguments);
          if (self._isActive()) {
            return this.classList.remove(self._CSS_CLASS);
          }
        };
      }

      static _init() {
        this._setElementPrototype();
        luda.on('keydown', this._changeFocusStateOnKeyEvent.bind(this));
        luda.on('keyup', this._changeFocusStateOnKeyEvent.bind(this));
        luda.on('mousedown', this._changeFocusStateOnMouseDownEvent.bind(this));
        luda.on('touchstart', this._TOUCHSTART_FOCUS_SELECTOR, this._changeFocusStateOnMouseDownEvent.bind(this));
        return luda.on('focusin', this._changeFocusStateOnMouseDownEvent.bind(this));
      }

    };

    _Class._SCOPE = 'focus';

    _Class._CSS_CLASS = 'focus';

    // mouse focusable selectors
    _Class._SELECTORS = ['select', 'textarea', ':not(.btn-check):not(.btn-radio):not(.btn-file) > input:not([type=button]):not([type=submit]):not([type=reset])'];

    _Class._TOUCHSTART_FOCUS_SELECTOR = 'input[type=range]';

    _Class._PARENT_FOCUS_SELECTOR = 'select[multiple]';

    _Class._PARENT_FOCUS_CHILDREN_SELECTOR = `${_Class._PARENT_FOCUS_SELECTOR} *`;

    _Class._DISABLED_ATTRIBUTE = 'data-focus-disabled';

    _Class._$focus = document.getElementsByClassName(_Class._CSS_CLASS);

    return _Class;

  }).call(this));

})));
