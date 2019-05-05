(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../dom.js'), require('../event.js'), require('../factory.js'), require('../behaviors/focus.js'), require('../behaviors/enter.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../dom.js', '../event.js', '../factory.js', '../behaviors/focus.js', '../behaviors/enter.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Factory {
      _getConfig() {
        var _$defaultValues, _$valueHolder, _$values;
        _$values = luda.$children(this.constructor._VALUE_SELECTOR, this._$component);
        _$defaultValues = luda.$children(this.constructor._DEFAULT_VALUE_SELECTOR, this._$component);
        _$valueHolder = luda.$child(this.constructor._VALUE_HOLDER_SELECTOR, this._$component);
        return {_$values, _$valueHolder, _$defaultValues};
      }

      _constructor() {
        ({_$values: this._$values, _$valueHolder: this._$valueHolder, _$defaultValues: this._$defaultValues} = this._getConfig());
        this._setValueHolderAttribute();
        return this._setValueHolderValue();
      }

      _onMutations() {
        return this._constructor();
      }

      _setValueHolderValue() {
        var values;
        values = [];
        this._$values.forEach(($value, index) => {
          var value;
          if ($value.checked) {
            if ($value.hasAttribute(this.constructor._LABEL_ATTRIBUTE)) {
              value = $value.getAttribute(this.constructor._LABEL_ATTRIBUTE);
            } else {
              value = this._$defaultValues[index].innerText;
            }
          }
          if (value && !values.includes(value)) {
            return values.push(value);
          }
        });
        if (this._$valueHolder) {
          return this._$valueHolder.value = values.join(this.constructor._VALUE_SPLITOR);
        }
      }

      _setValueHolderAttribute() {
        if (this._$valueHolder) {
          return this._$valueHolder.setAttribute('readonly', '');
        }
      }

      static _init() {
        var self;
        self = this;
        luda.enter._add(this._ENTER_BEHAVIOR_SELECTOR);
        luda.on('change', `${this._SELECTOR} ${this._VALUE_SELECTOR}`, function(e) {
          return self.query(luda.$parent(self._SELECTOR, this))._setValueHolderValue();
        });
        luda.on(luda._FORM_RESET, this._SELECTOR, function(e) {
          return setTimeout(() => {
            return self.query(this)._setValueHolderValue();
          });
        });
        // prevent ios device pop out wired navigation pannel
        if (/iphone/i.test(navigator.userAgent) || /ipad/i.test(navigator.userAgent)) {
          return luda.on('focusin', this._ENTER_BEHAVIOR_SELECTOR, function(e) {
            this.blur();
            return this.classList.add(luda.focus._CSS_CLASS);
          });
        }
      }

    };

    _Class._SCOPE = 'fmDropdown';

    _Class._SELECTOR = '.fm-dropdown';

    _Class._VALUE_SPLITOR = '   ';

    _Class._LABEL_ATTRIBUTE = 'data-fm-dropdown-label';

    _Class._VALUE_SELECTOR = '.dropdown-items .btn-radio input, .dropdown-items .btn-check input';

    _Class._DEFAULT_VALUE_SELECTOR = '.dropdown-items .btn-radio label, .dropdown-items .btn-check label';

    _Class._VALUE_HOLDER_SELECTOR = '.fm input';

    _Class._ENTER_BEHAVIOR_SELECTOR = '.fm-dropdown .fm input';

    _Class._observerConfig = {
      childList: true,
      attributes: true,
      subtree: true,
      attributeFilter: ['checked', _Class._LABEL_ATTRIBUTE]
    };

    return _Class;

  }).call(this));

})));
