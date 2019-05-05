(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js'), require('./utilities.js'), require('./dom.js'), require('./event.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js', './utilities.js', './dom.js', './event.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  var Factory;

  luda(Factory = (function() {
    class Factory {
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

      _hasDescendant(descendant) {
        if (this._children.length && descendant) {
          if (this._children.includes(descendant)) {
            return true;
          }
          return this._children.some(function(child) {
            return child._hasDescendant(descendant);
          });
        } else {
          return false;
        }
      }

      _observe() {
        this._observer = new MutationObserver(this._onMutations.bind(this));
        return this._observer.observe(this._$component, this.constructor._observerConfig);
      }

      _disconnect() {
        this._observer.disconnect();
        return this._observer = null;
      }

      _activatePrevented($ele, detail) {
        var activateEvent;
        activateEvent = luda.dispatch($ele, this.constructor._ACTIVATE_EVENT_TYPE(), detail);
        return activateEvent.defaultPrevented;
      }

      _deactivatePrevented($ele, detail) {
        var deactivateEvent;
        deactivateEvent = luda.dispatch($ele, this.constructor._DEACTIVATE_EVENT_TYPE(), detail);
        return deactivateEvent.defaultPrevented;
      }

      _handleActivateEnd($ele, detail) {
        var activateDuration;
        this._setActivatingMark(detail);
        activateDuration = luda.getTransitionDuration($ele);
        luda.dispatch($ele, this.constructor._ACTIVATED_EVENT_TYPE(), detail, activateDuration);
        setTimeout(() => {
          if (this._$component) {
            return this._removeActivatingMark();
          }
        }, activateDuration);
        return activateDuration;
      }

      _handleDeactivateEnd($ele, detail) {
        var deactivateDuration;
        this._setDeactivatingMark(detail);
        deactivateDuration = luda.getTransitionDuration($ele);
        luda.dispatch($ele, this.constructor._DEACTIVATED_EVENT_TYPE(), detail, deactivateDuration);
        setTimeout(() => {
          if (this._$component) {
            return this._removeDeactivatingMark();
          }
        }, deactivateDuration);
        return deactivateDuration;
      }

      _handleActivateCancel($ele, detail) {
        if (this._isActivating()) {
          luda.dispatch($ele, this.constructor._ACTIVATED_EVENT_TYPE(), detail);
          return this._removeActivatingMark();
        }
      }

      _handleDeactivateCancel($ele, detail) {
        if (this._isDeactivating()) {
          luda.dispatch($ele, this.constructor._DEACTIVATED_EVENT_TYPE(), detail);
          return this._removeDeactivatingMark();
        }
      }

      _isActivating() {
        return this._$component.hasAttribute(this.constructor._ACTIVATING_MARK_ATTRIBUTE());
      }

      _isDeactivating() {
        return this._$component.hasAttribute(this.constructor._DEACTIVATING_MARK_ATTRIBUTE());
      }

      _isTransitioning() {
        return this._isActivating() || this._isDeactivating();
      }

      _getActivatingMark() {
        return this._$component.getAttribute(this.constructor._ACTIVATING_MARK_ATTRIBUTE());
      }

      _getDeactivatingMark() {
        return this._$component.getAttribute(this.constructor._DEACTIVATING_MARK_ATTRIBUTE());
      }

      _removeActivatingMark() {
        return this._$component.removeAttribute(this.constructor._ACTIVATING_MARK_ATTRIBUTE());
      }

      _removeDeactivatingMark() {
        return this._$component.removeAttribute(this.constructor._DEACTIVATING_MARK_ATTRIBUTE());
      }

      _setActivatingMark(value) {
        return this._$component.setAttribute(this.constructor._ACTIVATING_MARK_ATTRIBUTE(), value);
      }

      _setDeactivatingMark(value) {
        return this._$component.setAttribute(this.constructor._DEACTIVATING_MARK_ATTRIBUTE(), value);
      }

      static create($component) {
        var $family, componentIsElementInstance, instance, parent;
        componentIsElementInstance = $component instanceof Element;
        if (!componentIsElementInstance) {
          throw new Error(this._$COMPONENT_INVALID_ERROR);
        }
        $family = this._query$family($component);
        instance = this.query($component);
        if ($family._$parent) {
          if (parent = this.query($family._$parent)) {
            if (!instance) {
              this._instances.push(instance = this._createInstance($component));
            }
            if (instance._parent !== parent) {
              parent._children.push(instance) && (instance._parent = parent);
            }
            $family._$children.forEach(($child) => {
              return this.create($child);
            });
            return instance;
          } else {
            this.create($family._$parent);
            return this.query($component);
          }
        } else {
          if (!instance) {
            this._instances.push(instance = this._createInstance($component));
          }
          $family._$children.forEach(($child) => {
            return this.create($child);
          });
          return instance;
        }
      }

      static destroy(instance$component) {
        var attribute, instance, results, value;
        instance = this.query(instance$component);
        if (instance) {
          if (instance._observer) {
            instance._disconnect();
          }
          if (instance._destroy) {
            instance._destroy();
          }
          while (instance._children.length) {
            this.destroy(instance._children[0]);
          }
          if (instance._parent) {
            luda.except(instance, instance._parent._children);
          }
          luda.except(instance, this._instances);
          results = [];
          for (attribute in instance) {
            value = instance[attribute];
            results.push(instance[attribute] = null);
          }
          return results;
        }
      }

      static query(instance$component) {
        var instance;
        instance = null;
        if (instance$component instanceof this && this._instances.includes(instance$component)) {
          instance = instance$component;
        } else if (instance$component instanceof Element) {
          this._instances.some(function(inited) {
            if (inited._$component === instance$component) {
              instance = inited;
              return true;
            }
          });
        }
        return instance;
      }

      static _query$family($component) {
        var _$children, _$parent;
        _$parent = null;
        _$children = [];
        if (this._SELECTOR) {
          _$parent = luda.$parent(this._SELECTOR, $component);
          _$children = luda.$unnested(this._SELECTOR, $component, this._SELECTOR);
        }
        return {_$parent, _$children};
      }

      static _createInstance($component) {
        var instance;
        instance = new this();
        instance._$component = $component;
        instance._parent = null;
        instance._children = [];
        instance._observer = null;
        if (instance._constructor) {
          instance._constructor();
        }
        if (!(instance._observer && instance._onMutations && this._observerConfig)) {
          instance._observe();
        }
        return instance;
      }

      static _onEleAdded($ele) {
        return Factory._onEleAddedOrRemoved($ele, 'create');
      }

      static _onEleRemoved($ele) {
        return Factory._onEleAddedOrRemoved($ele, 'destroy');
      }

      static _onEleAddedOrRemoved($ele, action) {
        return Factory._Observed.forEach(function(Observed) {
          if ($ele.matches(Observed._SELECTOR)) {
            return Observed[action]($ele);
          }
          return luda.$children(Observed._SELECTOR, $ele).forEach(function($child) {
            return Observed[action]($child);
          });
        });
      }

      static _observe(classObj) {
        if (!Factory._observer) {
          Factory._observer = luda._observeDom(Factory._onEleAdded, Factory._onEleRemoved);
        }
        if (!Factory._Observed.includes(classObj)) {
          return Factory._Observed.push(classObj);
        }
      }

      static _install() {
        var exposed, self;
        self = this;
        if (this === Factory) {
          return this;
        }
        if (!(this._SELECTOR || typeof this._SELECTOR !== 'string')) {
          throw new Error(this._COMPONENT_NO_SELECTOR_ERROR);
        }
        if (!this.hasOwnProperty('_instances')) {
          this._instances = [];
        }
        if (typeof this._init === 'function') {
          exposed = this._init();
        }
        luda.on(luda._DOC_READY, function() {
          luda.$children(self._SELECTOR).forEach(function($component) {
            return self.create($component);
          });
          return Factory._observe(self);
        });
        if (exposed) {
          return exposed;
        } else {
          return this;
        }
      }

    }
    Factory._SCOPE = 'Factory';

    Factory._COMPONENT_NO_SELECTOR_ERROR = 'Extended component must has a css selector';

    Factory._$COMPONENT_INVALID_ERROR = '@param $component must be an instance of Element';

    Factory._SELECTOR = '';

    Factory._instances = [];

    Factory._Observed = [];

    Factory._observer = null;

    Factory._observerConfig = {
      childList: true,
      subtree: true
    };

    return Factory;

  }).call(this));

})));
