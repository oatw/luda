(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js'), require('./utilities.js'), require('./dom.js'), require('./event.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js', './utilities.js', './dom.js', './event.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  var Static;

  luda(Static = (function() {
    class Static {
      static _ACTIVATE_EVENT_TYPE() {
        return `${this._SCOPE}:activate`;
      }

      static _ACTIVATED_EVENT_TYPE() {
        return `${this._SCOPE}:activated`;
      }

      static _DEACTIVATE_EVENT_TYPE() {
        return `${this._SCOPE}:deactivate`;
      }

      static _DEACTIVATED_EVENT_TYPE() {
        return `${this._SCOPE}:deactivated`;
      }

      static _ACTIVATING_MARK_ATTRIBUTE() {
        return `data-${this._SCOPE}-activating`;
      }

      static _DEACTIVATING_MARK_ATTRIBUTE() {
        return `data-${this._SCOPE}-deactivating`;
      }

      static _add(selector) {
        if (typeof selector !== 'string') {
          throw new Error(this._SELECTOR_INVALID_ERROR);
        }
        if (!this._SELECTORS.includes(selector)) {
          this._SELECTORS.push(selector);
        }
        return this._mergeSelectors();
      }

      static _remove(selector) {
        if (typeof selector !== 'string') {
          throw new Error(this._SELECTOR_INVALID_ERROR);
        }
        luda.except(selector, this._SELECTORS);
        return this._mergeSelectors();
      }

      static _mergeSelectors() {
        return this._selector = this._SELECTORS.join(',');
      }

      static _activatePrevented($ele, detail) {
        var activateEvent;
        activateEvent = luda.dispatch($ele, this._ACTIVATE_EVENT_TYPE(), detail);
        return activateEvent.defaultPrevented;
      }

      static _deactivatePrevented($ele, detail) {
        var deactivateEvent;
        deactivateEvent = luda.dispatch($ele, this._DEACTIVATE_EVENT_TYPE(), detail);
        return deactivateEvent.defaultPrevented;
      }

      static _handleActivateEnd($ele, detail) {
        var activateDuration;
        this._setActivatingMark($ele, detail);
        activateDuration = luda.getTransitionDuration($ele);
        luda.dispatch($ele, this._ACTIVATED_EVENT_TYPE(), detail, activateDuration);
        setTimeout(() => {
          if ($ele) {
            return this._removeActivatingMark($ele);
          }
        }, activateDuration);
        return activateDuration;
      }

      static _handleDeactivateEnd($ele, detail) {
        var deactivateDuration;
        this._setDeactivatingMark($ele, detail);
        deactivateDuration = luda.getTransitionDuration($ele);
        luda.dispatch($ele, this._DEACTIVATED_EVENT_TYPE(), detail, deactivateDuration);
        setTimeout(() => {
          if ($ele) {
            return this._removeDeactivatingMark($ele);
          }
        }, deactivateDuration);
        return deactivateDuration;
      }

      static _handleActivateCancel($ele, detail) {
        if (this._isActivating($ele)) {
          luda.dispatch($ele, this._ACTIVATED_EVENT_TYPE(), detail);
          return this._removeActivatingMark($ele);
        }
      }

      static _handleDeactivateCancel($ele, detail) {
        if (this._isDeactivating($ele)) {
          luda.dispatch($ele, this._DEACTIVATED_EVENT_TYPE(), detail);
          return this._removeDeactivatingMark($ele);
        }
      }

      static _isActivating($ele) {
        return $ele.hasAttribute(this._ACTIVATING_MARK_ATTRIBUTE());
      }

      static _isDeactivating($ele) {
        return $ele.hasAttribute(this._DEACTIVATING_MARK_ATTRIBUTE());
      }

      static _isTransitioning($ele) {
        return this._isActivating($ele) || this._isDeactivating($ele);
      }

      static _getActivatingMark($ele) {
        return $ele.getAttribute(this._ACTIVATING_MARK_ATTRIBUTE());
      }

      static _getDeactivatingMark($ele) {
        return $ele.getAttribute(this._DEACTIVATING_MARK_ATTRIBUTE());
      }

      static _removeActivatingMark($ele) {
        return $ele.removeAttribute(this._ACTIVATING_MARK_ATTRIBUTE());
      }

      static _removeDeactivatingMark($ele) {
        return $ele.removeAttribute(this._DEACTIVATING_MARK_ATTRIBUTE());
      }

      static _setActivatingMark($ele, value) {
        return $ele.setAttribute(this._ACTIVATING_MARK_ATTRIBUTE(), value);
      }

      static _setDeactivatingMark($ele, value) {
        return $ele.setAttribute(this._DEACTIVATING_MARK_ATTRIBUTE(), value);
      }

      static _onEleAdded($ele) {
        return Static._onEleAddedOrRemoved($ele, '_onElementAdded');
      }

      static _onEleRemoved($ele) {
        return Static._onEleAddedOrRemoved($ele, '_onElementRemoved');
      }

      static _onEleAddedOrRemoved($ele, action) {
        return Static._Observed.forEach(function(Observed) {
          var $matched;
          if (!Observed[action]) {
            return;
          }
          $matched = luda.$children(Observed._selector, $ele);
          if ($ele.matches(Observed._selector)) {
            $matched.unshift($ele);
          }
          return $matched.forEach(function($target) {
            return Observed[action]($target);
          });
        });
      }

      static _observe(classObj) {
        if (!Static._observer) {
          Static._observer = luda._observeDom(Static._onEleAdded, Static._onEleRemoved);
        }
        if (classObj._onElementAdded || classObj._onElementRemoved && classObj._selector) {
          if (!Static._Observed.includes(classObj)) {
            return Static._Observed.push(classObj);
          }
        }
      }

      static _install() {
        var exposed, self;
        self = this;
        if (this === Static) {
          return this;
        }
        if (!this.hasOwnProperty('_SELECTORS')) {
          this._SELECTORS = [];
        }
        this._mergeSelectors();
        if (typeof this._init === 'function') {
          exposed = this._init();
        }
        luda.on(luda._DOC_READY, function() {
          return Static._observe(self);
        });
        if (exposed) {
          return exposed;
        } else {
          return this;
        }
      }

    }
    Static._SCOPE = 'Static';

    Static._SELECTOR_INVALID_ERROR = '@param selector must be a css selector string';

    Static._SELECTORS = [];

    Static._Observed = [];

    Static._observer = null;

    Static._selector = '';

    return Static;

  }).call(this));

})));
