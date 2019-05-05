(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../constants.js'), require('../dom.js'), require('../event.js'), require('../factory.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../constants.js', '../dom.js', '../event.js', '../factory.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Factory {
      activate() {
        var ref;
        if (this._isActive() || this._isTransitioning()) {
          return;
        }
        if (this._activatePrevented(this._$menu)) {
          return;
        }
        this._$component.classList.add(this.constructor._ACTIVE_CSS_CLASS);
        this.constructor._$focused.push(document.activeElement);
        if ((ref = this._parent) != null) {
          ref.activate();
        }
        return this._handleActivateEnd(this._$menu);
      }

      deactivate(focus) {
        var ref;
        if (!(this._isActive() && !this._isTransitioning())) {
          return;
        }
        if (this._deactivatePrevented(this._$menu)) {
          return;
        }
        this._$component.classList.remove(this.constructor._ACTIVE_CSS_CLASS);
        this._children.forEach(function(child) {
          return child.deactivate();
        });
        if (focus) {
          if ((ref = this.constructor._$focused[this.constructor._$focused.length - 1]) != null) {
            ref.focus();
          }
        }
        this.constructor._$focused.splice(this.constructor._$focused.length - 1, 1);
        return this._handleDeactivateEnd(this._$menu);
      }

      toggle(focus) {
        if (this._isActive()) {
          return this.deactivate(focus);
        } else {
          return this.activate();
        }
      }

      _prev() {
        var focusIndex;
        if (this._$items.length && this._isActive()) {
          focusIndex = this._$items.indexOf(document.activeElement) - 1;
          if (focusIndex < 0) {
            focusIndex = 0;
          }
          return this._$items[focusIndex].focus();
        }
      }

      _next() {
        var focusIndex;
        if (this._$items.length && this._isActive()) {
          focusIndex = this._$items.indexOf(document.activeElement) + 1;
          if (focusIndex > this._$items.length - 1) {
            focusIndex = this._$items.length - 1;
          }
          return this._$items[focusIndex].focus();
        }
      }

      _getConfig() {
        var _$items, _$menu, _$noneSwitches, _$switches, _isStandalone;
        _$menu = luda.$child(this.constructor._MENU_SELECTOR, this._$component);
        _$switches = luda.$unnested(this.constructor._SWITCHES_SELECTOR, this._$component, this.constructor._SELECTOR).concat(luda.$unnested(this.constructor._SWITCHES_SELECTOR, _$menu, this.constructor._MENU_SELECTOR));
        _$noneSwitches = luda.$unnested(this.constructor._NONE_SWITCHES_SELECTOR, this._$component, this.constructor._SELECTOR).concat(luda.$unnested(this.constructor._NONE_SWITCHES_SELECTOR, _$menu, this.constructor._MENU_SELECTOR));
        _$items = luda.$unnested(this.constructor._ITEMS_SELECTOR, _$menu, this.constructor._MENU_SELECTOR);
        _isStandalone = this._$component.hasAttribute(this.constructor._STANDALONE_ATTRIBUTE);
        return {_$menu, _$items, _$switches, _$noneSwitches, _isStandalone};
      }

      _constructor() {
        this._onMutations();
        this._handleActivateCancel(this._$menu);
        return this._handleDeactivateCancel(this._$menu);
      }

      _onMutations(mutations) {
        return ({_$menu: this._$menu, _$items: this._$items, _$switches: this._$switches, _$noneSwitches: this._$noneSwitches, _isStandalone: this._isStandalone} = this._getConfig());
      }

      _isActive() {
        return this._$component.classList.contains(this.constructor._ACTIVE_CSS_CLASS);
      }

      _deactivateChildrenExcept(exceptions) {
        if (exceptions && !(exceptions instanceof Array)) {
          exceptions = [exceptions];
        }
        if (exceptions) {
          return this._children.forEach(function(child) {
            if (child._isActive() && !exceptions.includes(child)) {
              return child.deactivate();
            }
          });
        } else {
          return this._children.forEach(function(child) {
            if (child._isActive()) {
              return child.deactivate();
            }
          });
        }
      }

      static activate($dropdown) {
        return this.query($dropdown).activate();
      }

      static deactivate($dropdown, focus) {
        return this.query($dropdown).deactivate(focus);
      }

      static toggle($dropdown, focus) {
        return this.query($dropdown).toggle(focus);
      }

      static deactivateExcept(instances$dropdowns) {
        var exceptions;
        exceptions = [];
        if (instances$dropdowns && !(instances$dropdowns instanceof Array)) {
          instances$dropdowns = [instances$dropdowns];
        }
        if (instances$dropdowns) {
          instances$dropdowns.forEach((instance$dropdown) => {
            var exception;
            if (exception = this.query(instance$dropdown)) {
              return exceptions.push(exception);
            }
          });
        }
        if (exceptions.length) {
          return this._instances.forEach(function(instance) {
            var instanceHasntExceptionChild, instanceIsntInExceptions;
            instanceIsntInExceptions = !exceptions.includes(instance);
            instanceHasntExceptionChild = exceptions.every(function(exception) {
              return !instance._hasDescendant(exception);
            });
            if (instance._isActive() && instanceIsntInExceptions && instanceHasntExceptionChild) {
              return instance.deactivate();
            }
          });
        } else {
          return this._instances.forEach(function(instance) {
            if (instance._isActive()) {
              return instance.deactivate();
            }
          });
        }
      }

      static _standaloneInstances() {
        return this._instances.filter(function(instance) {
          if (instance._isStandalone) {
            return instance;
          }
        });
      }

      static _init() {
        var self;
        self = this;
        luda.onOpposite('click', this._SELECTOR, function(e) {
          return self.deactivateExcept(self._standaloneInstances());
        });
        luda.on('click', this._SELECTOR, function(e) {
          var focus, instance, toggleChecked;
          if (instance = self.query(this)) {
            toggleChecked = false;
            focus = !e.detail;
            self.deactivateExcept(self._standaloneInstances().concat(instance));
            instance._deactivateChildrenExcept();
            if (instance._parent) {
              instance._parent._deactivateChildrenExcept(instance);
            }
            if (instance._$switches.length || instance._$noneSwitches.length) {
              luda.eventPath(e).some(function($path) {
                if (instance._$switches.includes($path)) {
                  instance.toggle(focus);
                  return toggleChecked = true;
                } else if (instance._$noneSwitches.includes($path)) {
                  return toggleChecked = true;
                }
              });
            }
            if (!toggleChecked) {
              return instance.toggle(focus);
            }
          }
        });
        luda.onOpposite('keyup', this._SELECTOR, function(e) {
          return self.deactivateExcept();
        });
        luda.on('keyup', this._SELECTOR, function(e) {
          var instance;
          if (e.keyCode === luda.KEY_TAB && (instance = self.query(this))) {
            self.deactivateExcept(instance);
            return instance.activate();
          }
        });
        luda.on('keydown', this._SELECTOR, function(e) {
          var instance, ref;
          if (e.keyCode === luda.KEY_ESC && (instance = self.query(this))) {
            e.preventDefault();
            if (instance._isActive()) {
              return instance.deactivate(true);
            } else {
              return (ref = instance._parent) != null ? ref.deactivate(true) : void 0;
            }
          }
        });
        return luda.on('keydown', this._SELECTOR, function(e) {
          var instance, ref, ref1;
          if ([luda.KEY_LEFT, luda.KEY_UP].includes(e.keyCode) && (instance = self.query(this))) {
            e.preventDefault();
            if (instance._isActive()) {
              return instance._prev();
            } else {
              return (ref = instance._parent) != null ? ref._prev() : void 0;
            }
          } else if ([luda.KEY_RIGHT, luda.KEY_DOWN].includes(e.keyCode) && (instance = self.query(this))) {
            e.preventDefault();
            if (instance._isActive()) {
              return instance._next();
            } else {
              return (ref1 = instance._parent) != null ? ref1._next() : void 0;
            }
          }
        });
      }

    };

    _Class._SCOPE = 'dropdown';

    _Class._SELECTOR = '.dropdown-fixed,.dropdown-absolute, .dropdown-static,.dropdown-absolute-m';

    _Class._MENU_SELECTOR = '.dropdown-menu';

    _Class._ITEMS_SELECTOR = 'a[href]:not([disabled]),button:not([disabled]), input:not([disabled]),[tabindex]:not([disabled])';

    _Class._TOGGLE_ATTRIBUTE = 'data-dropdown-toggle';

    _Class._TOGGLE_DISABLED_ATTRIBUTE = 'data-dropdown-toggle-disabled';

    _Class._STANDALONE_ATTRIBUTE = 'data-dropdown-standalone';

    _Class._SWITCHES_SELECTOR = `[${_Class._TOGGLE_ATTRIBUTE}]`;

    _Class._NONE_SWITCHES_SELECTOR = `[${_Class._TOGGLE_DISABLED_ATTRIBUTE}]`;

    _Class._ACTIVE_CSS_CLASS = 'dropdown-active';

    _Class._observerConfig = {
      childList: true,
      attributes: true,
      subtree: true,
      attributeFilter: [_Class._TOGGLE_ATTRIBUTE, _Class._TOGGLE_DISABLED_ATTRIBUTE, _Class._STANDALONE_ATTRIBUTE]
    };

    _Class._$focused = [];

    return _Class;

  }).call(this));

})));
