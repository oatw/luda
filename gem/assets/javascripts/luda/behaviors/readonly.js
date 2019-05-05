//= require ../install
//= require ../factory
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../factory.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../factory.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Factory {
      _getConfig() {
        var _isReadonly, readonly;
        readonly = this._$component.getAttribute(this.constructor._READONLY_ATTRIBUTE);
        _isReadonly = readonly !== this.constructor._READONLY_FALSE_VALUE;
        return {_isReadonly};
      }

      _constructor() {
        ({_isReadonly: this._isReadonly} = this._getConfig());
        this._setOriginalTabIndex();
        return this._setTabIndex();
      }

      _onMutations() {
        return this._constructor();
      }

      _setOriginalTabIndex() {
        if (!this._$component.hasAttribute(this.constructor._ORIGINAL_TABINDEX_ATTRIBUTE)) {
          return this._$component.setAttribute(this.constructor._ORIGINAL_TABINDEX_ATTRIBUTE, this._$component.tabIndex);
        }
      }

      _setTabIndex() {
        if (this._isReadonly) {
          return this._$component.tabIndex = -1;
        } else {
          return this._$component.tabIndex = this._$component.getAttribute(this.constructor._ORIGINAL_TABINDEX_ATTRIBUTE);
        }
      }

    };

    _Class._SCOPE = 'readonly';

    _Class._READONLY_ATTRIBUTE = 'data-readonly';

    _Class._ORIGINAL_TABINDEX_ATTRIBUTE = 'data-readonly-tabindex';

    _Class._READONLY_FALSE_VALUE = 'false';

    _Class._SELECTOR = `[${_Class._READONLY_ATTRIBUTE}]`;

    _Class._observerConfig = {
      attributes: true,
      attributeFilter: [_Class._READONLY_ATTRIBUTE]
    };

    return _Class;

  }).call(this));

})));
