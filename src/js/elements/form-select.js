(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../dom.js'), require('../event.js'), require('../factory.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../dom.js', '../event.js', '../factory.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Factory {
      select(indexOrIndexArray) {
        var selectedIndexes;
        if (this._$select.multiple) {
          if (this._$multipleSelectPlaceholder) {
            selectedIndexes = indexOrIndexArray;
          } else {
            selectedIndexes = indexOrIndexArray.map(function(index) {
              return index + 1;
            });
          }
          Array.from(this._$select.options).forEach(function($option, index) {
            return $option.selected = selectedIndexes.includes(index);
          });
          return this._markSelectedOption();
        } else {
          this._$select.selectedIndex = indexOrIndexArray;
          this._setSingleSelectSimulatorValue();
          return this._markSelectedOption();
        }
      }

      _getConfig() {
        var _$defaultSelectedOptions, _$multipleSelectPlaceholder, _$select, _$singleSelectSimulator, _defaultSelectedOptionMarked;
        _$select = luda.$child(this.constructor._SELECT_SELECTOR, this._$component);
        _$singleSelectSimulator = luda.$child(this.constructor._SINGLE_SELECT_SIMULATOR_SELECTOR, this._$component);
        _$multipleSelectPlaceholder = luda.$child(`.${this.constructor._MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS}`, this._$component);
        _$defaultSelectedOptions = luda.$children(`[${this.constructor._DEFAULT_SELECTED_OPTION_ATTRIBUTE}]`, this._$component);
        _defaultSelectedOptionMarked = this._$component.hasAttribute(this.constructor._INITED_ATTRIBUTE);
        return {_$select, _$singleSelectSimulator, _$multipleSelectPlaceholder, _$defaultSelectedOptions, _defaultSelectedOptionMarked};
      }

      _constructor() {
        ({_$select: this._$select, _$singleSelectSimulator: this._$singleSelectSimulator, _$multipleSelectPlaceholder: this._$multipleSelectPlaceholder, _$defaultSelectedOptions: this._$defaultSelectedOptions, _defaultSelectedOptionMarked: this._defaultSelectedOptionMarked} = this._getConfig());
        if (this._$select) {
          if (this._$select.multiple) {
            return this._initMultipleSelect();
          } else {
            return this._initSingleSelect();
          }
        }
      }

      _onMutations() {
        return this._constructor();
      }

      _markSelectedOption() {
        if (this._observer) {
          this._disconnect();
        }
        Array.from(this._$select.options).forEach(function($option) {
          if ($option.selected) {
            return $option.setAttribute('selected', 'selected');
          } else {
            return $option.removeAttribute('selected');
          }
        });
        if (!this._observer) {
          return this._observe();
        }
      }

      _markDefaultSelectedOption() {
        this._$component.setAttribute(this.constructor._INITED_ATTRIBUTE, '');
        return Array.from(this._$select.options).forEach(($option) => {
          if ($option.selected) {
            return $option.setAttribute(this.constructor._DEFAULT_SELECTED_OPTION_ATTRIBUTE, '');
          }
        });
      }

      _setSingleSelectedDefaultSelectedOption() {
        var hasSelected;
        hasSelected = Array.from(this._$select.options).some(function($option) {
          return $option.getAttribute('selected') === 'selected';
        });
        if (!hasSelected) {
          return this._$select.selectedIndex = -1;
        }
      }

      _insertSingleSelectSimulator() {
        this._$singleSelectSimulator = document.createElement('input');
        this._$singleSelectSimulator.tabIndex = -1;
        return luda.$after(this._$singleSelectSimulator, this._$select);
      }

      _setSingleSelectPlaceholderValue() {
        return this._$singleSelectSimulator.placeholder = this._$select.getAttribute(this.constructor._PLACEHOLDER_ATTRIBUTE);
      }

      _setSingleSelectSimulatorValue() {
        var $selectedOption;
        if ($selectedOption = this._$select.options[this._$select.selectedIndex]) {
          return this._$singleSelectSimulator.value = $selectedOption.innerText;
        } else {
          return this._$singleSelectSimulator.value = '';
        }
      }

      _initSingleSelect() {
        if (!this._$singleSelectSimulator) {
          this._insertSingleSelectSimulator();
        }
        if (this._$select.hasAttribute(this.constructor._PLACEHOLDER_ATTRIBUTE)) {
          this._setSingleSelectedDefaultSelectedOption();
          this._setSingleSelectPlaceholderValue();
        }
        if (!this._defaultSelectedOptionMarked) {
          this._markDefaultSelectedOption();
        }
        this._setSingleSelectSimulatorValue();
        return this._markSelectedOption();
      }

      _insertMultipleSelectBlankOption() {
        this._$multipleSelectPlaceholder = document.createElement('option');
        this._$multipleSelectPlaceholder.className = this.constructor._MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS;
        this._$multipleSelectPlaceholder.disabled = true;
        return luda.$prepend(this._$multipleSelectPlaceholder, this._$select);
      }

      _setMultipleSelectPlaceholderValue() {
        return this._$multipleSelectPlaceholder.innerText = this._$select.getAttribute(this.constructor._PLACEHOLDER_ATTRIBUTE);
      }

      _initMultipleSelect() {
        if (!this._$multipleSelectPlaceholder) {
          if (this._$select.hasAttribute(this.constructor._PLACEHOLDER_ATTRIBUTE)) {
            this._insertMultipleSelectBlankOption();
            this._setMultipleSelectPlaceholderValue();
          }
        }
        if (!this._defaultSelectedOptionMarked) {
          return this._markDefaultSelectedOption();
        }
      }

      _reset() {
        if (this._$select) {
          Array.from(this._$select.options).forEach(($option) => {
            return $option.selected = this._$defaultSelectedOptions.includes($option);
          });
          if (!this._$select.multiple) {
            this._setSingleSelectSimulatorValue();
          }
          return this._markSelectedOption();
        }
      }

      static select($select, indexOrIndexArray) {
        return this.query($select).select(indexOrIndexArray);
      }

      static _init() {
        var self;
        self = this;
        luda.on('change', `${this._SELECTOR} ${this._SELECT_SELECTOR}`, function(e) {
          var instance;
          instance = self.query(luda.$parent(self._SELECTOR, this));
          if (!this.multiple) {
            instance._setSingleSelectSimulatorValue();
          }
          return instance._markSelectedOption();
        });
        return luda.on(luda._FORM_RESET, this._SELECTOR, function(e) {
          return setTimeout(() => {
            return self.query(this)._reset();
          });
        });
      }

    };

    _Class._SCOPE = 'fmSelect';

    _Class._SELECTOR = '.fm-select';

    _Class._SELECT_SELECTOR = 'select';

    _Class._SINGLE_SELECT_SIMULATOR_SELECTOR = 'input';

    _Class._PLACEHOLDER_ATTRIBUTE = 'placeholder';

    _Class._MULTIPLE_SELECT_PLACEHOLDER_CSS_CLASS = 'fm-select-multiple-placeholder';

    _Class._DEFAULT_SELECTED_OPTION_ATTRIBUTE = 'data-fm-select-default-selected';

    _Class._INITED_ATTRIBUTE = 'data-fm-select-inited';

    _Class._observerConfig = {
      childList: true,
      attributes: true,
      subtree: true,
      attributeFilter: ['selected']
    };

    return _Class;

  }).call(this));

})));
