(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../dom.js'), require('../event.js'), require('../static.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../dom.js', '../event.js', '../static.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Static {
      static activate(name$target) {
        return this._query$targets(name$target).forEach(($target) => {
          if ($target.classList.contains(this._ACTIVE_CSS_CLASS)) {
            return;
          }
          if (this._isTransitioning($target)) {
            return;
          }
          if (this._activatePrevented($target)) {
            return;
          }
          $target.classList.add(this._ACTIVE_CSS_CLASS);
          this._handleActivateEnd($target);
          if (this._shouldAutoDeactivate($target)) {
            return this._delayDeactivate($target);
          }
        });
      }

      static deactivate(name$target) {
        return this._query$targets(name$target).forEach(($target) => {
          if (!$target.classList.contains(this._ACTIVE_CSS_CLASS)) {
            return;
          }
          if (this._isTransitioning($target)) {
            return;
          }
          if (this._deactivatePrevented($target)) {
            return;
          }
          $target.classList.remove(this._ACTIVE_CSS_CLASS);
          return this._handleDeactivateEnd($target);
        });
      }

      static toggle(name$target) {
        return this._query$targets(name$target).forEach(($target) => {
          if ($target.classList.contains(this._ACTIVE_CSS_CLASS)) {
            return this.deactivate($target);
          } else {
            return this.activate($target);
          }
        });
      }

      static _onElementAdded($ele) {
        this._handleActivateCancel($ele);
        this._handleDeactivateCancel($ele);
        if (this._shouldAutoDeactivate($ele)) {
          return this._delayDeactivate($ele);
        }
      }

      static _shouldAutoDeactivate($target) {
        return $target.hasAttribute(this._AUTO_DEACTIVATE_ATTRIBUTE);
      }

      static _delayDeactivate($target) {
        var delay;
        delay = parseInt($target.getAttribute(this._AUTO_DEACTIVATE_ATTRIBUTE), 10);
        if (!delay) {
          delay = this._AUTO_DEACTIVATE_DURATION;
        }
        return setTimeout(() => {
          if ($target) {
            return this.deactivate($target);
          }
        }, delay);
      }

      static _query$targets(name$target) {
        if (name$target instanceof Element) {
          return [name$target];
        } else {
          return luda.$children(`[${this._TOGGLE_TARGET_ATTRIBUTE}=${name$target}]`);
        }
      }

      static _init() {
        var clickEventSelector, self;
        self = this;
        clickEventSelector = `[${this._TOGGLE_FOR_ATTRIBUTE}],[${this._TOGGLE_ATTRIBUTE}]`;
        luda.on(luda._DOC_READY, function() {
          return luda.$children(self._selector).forEach(function($target) {
            if (self._shouldAutoDeactivate($target)) {
              return self._delayDeactivate($target);
            }
          });
        });
        return luda.on('click', clickEventSelector, function(e) {
          var toggleChecked;
          toggleChecked = false;
          return luda.eventPath(e).some(function($path) {
            var $toggle, toggleName;
            if ($path instanceof Element) {
              if ($path.hasAttribute(self._TOGGLE_ATTRIBUTE) || $path.hasAttribute(self._TOGGLE_FOR_ATTRIBUTE)) {
                if (toggleName = $path.getAttribute(self._TOGGLE_FOR_ATTRIBUTE)) {
                  self.toggle(toggleName);
                  toggleChecked = true;
                }
                if ($path.hasAttribute(self._TOGGLE_ATTRIBUTE)) {
                  if ($path.hasAttribute(self._TOGGLE_TARGET_ATTRIBUTE)) {
                    $toggle = $path;
                  } else {
                    $toggle = luda.$parent(`[${self._TOGGLE_TARGET_ATTRIBUTE}]`, $path);
                  }
                  if ($toggle) {
                    self.toggle($toggle);
                    return toggleChecked = true;
                  }
                }
              } else if ($path.hasAttribute(self._TOGGLE_DISABLED_ATTRIBUTE)) {
                return toggleChecked = true;
              }
            }
          });
        });
      }

    };

    _Class._SCOPE = 'toggle';

    _Class._TOGGLE_TARGET_ATTRIBUTE = 'data-toggle-target';

    _Class._TOGGLE_ATTRIBUTE = 'data-toggle';

    _Class._TOGGLE_FOR_ATTRIBUTE = 'data-toggle-for';

    _Class._TOGGLE_DISABLED_ATTRIBUTE = 'data-toggle-disabled';

    _Class._AUTO_DEACTIVATE_ATTRIBUTE = 'data-toggle-auto-deactivate';

    _Class._AUTO_DEACTIVATE_DURATION = 3000;

    _Class._ACTIVE_CSS_CLASS = 'toggle-active';

    _Class._SELECTORS = [`[${_Class._TOGGLE_TARGET_ATTRIBUTE}]`];

    return _Class;

  }).call(this));

})));
