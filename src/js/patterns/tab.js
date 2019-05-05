(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../install.js'), require('../dom.js'), require('../event.js'), require('../factory.js')) :
  typeof define === 'function' && define.amd ? define(['../install.js', '../dom.js', '../event.js', '../factory.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda((function() {
    var _Class;

    _Class = class extends luda.Factory {
      
      // public
      activate(index) {
        var activatedIndex;
        if (this._$panes.length && !this._isTransitioning()) {
          activatedIndex = this._activeIndex;
          if ((index != null) && index !== this._activeIndex && (0 <= index && index <= this._$panes.length - 1)) {
            if (!this._canTransition(index, activatedIndex)) {
              return;
            }
            this._activeIndex = index;
            return this._activate(activatedIndex);
          }
        }
      }

      // private
      _getConfig() {
        var _$indicators, _$panes, _activeIndex;
        _$panes = luda.$unnested(this.constructor._PANE_SELECTOR, this._$component, this.constructor._SELECTOR);
        _$indicators = luda.$unnested(this.constructor._INDICATOR_SELECTOR, this._$component, this.constructor._SELECTOR);
        _activeIndex = this.constructor._ACTIVE_INDEX;
        _$indicators.some(function($indicator, index) {
          if ($indicator.checked) {
            _activeIndex = index;
            return true;
          }
        });
        return {_$panes, _$indicators, _activeIndex};
      }

      _constructor() {
        ({_$panes: this._$panes, _$indicators: this._$indicators, _activeIndex: this._activeIndex} = this._getConfig());
        this._layout();
        return this._handleTransitionCancel();
      }

      _onMutations(mutations) {
        ({_$panes: this._$panes, _$indicators: this._$indicators, _activeIndex: this._activeIndex} = this._getConfig());
        return this._setIndicatorsState();
      }

      _layout() {
        this._$panes.forEach(($pane, index) => {
          $pane.style.transition = 'none';
          if (index === this._activeIndex) {
            $pane.classList.add(this.constructor._PANE_ACTIVE_CSS_CLASS);
          } else {
            $pane.classList.remove(this.constructor._PANE_ACTIVE_CSS_CLASS);
          }
          luda.reflow($pane);
          return $pane.style.transition = '';
        });
        return this._setIndicatorsState();
      }

      _activate(activatedIndex) {
        var $activatedPane, $pane;
        $pane = this._$panes[this._activeIndex];
        $activatedPane = this._$panes[activatedIndex];
        $pane.classList.add(this.constructor._PANE_ACTIVE_CSS_CLASS);
        $activatedPane.classList.remove(this.constructor._PANE_ACTIVE_CSS_CLASS);
        this._handleTransitionEnd(this._activeIndex, activatedIndex);
        return this._setIndicatorsState();
      }

      _canTransition(activeIndex, activatedIndex) {
        return !this._activatePrevented(this._$panes[activeIndex], activeIndex) && !this._deactivatePrevented(this._$panes[activatedIndex], activatedIndex);
      }

      _handleTransitionEnd(activeIndex, activatedIndex) {
        var activateDuration, deactivateDuration;
        activateDuration = this._handleActivateEnd(this._$panes[activeIndex], activeIndex);
        return deactivateDuration = this._handleDeactivateEnd(this._$panes[activatedIndex], activatedIndex);
      }

      _handleTransitionCancel() {
        var activatedIndex, index;
        if (this._isActivating()) {
          index = parseInt(this._getActivatingMark(), 10);
          this._handleActivateCancel(this._$panes[index], index);
        }
        if (this._isDeactivating()) {
          activatedIndex = parseInt(this._getDeactivatingMark(), 10);
          return this._handleDeactivateCancel(this._$panes[activatedIndex], activatedIndex);
        }
      }

      _setIndicatorsState() {
        return this._$indicators.forEach(($indicator, index) => {
          if (index === this._activeIndex) {
            $indicator.setAttribute('checked', '');
            return $indicator.checked = true;
          } else {
            $indicator.removeAttribute('checked');
            return $indicator.checked = false;
          }
        });
      }

      static activate($tab, index) {
        return this.query($tab).activate(index);
      }

      // static private
      static _init() {
        var self;
        self = this;
        return luda.on('change', this._INDICATOR_SELECTOR, function(e) {
          var instance;
          if (this.checked) {
            instance = self.query(luda.$parent(self._SELECTOR, this));
            instance._setIndicatorsState();
            return instance.activate(instance._$indicators.indexOf(this));
          }
        });
      }

    };

    _Class._SCOPE = 'tab';

    _Class._SELECTOR = '.tab';

    _Class._PANE_SELECTOR = '.tab-pane';

    _Class._INDICATOR_SELECTOR = '.tab-indicators .btn-radio input[type=radio]';

    _Class._PANE_ACTIVE_CSS_CLASS = 'tab-pane-active';

    _Class._ACTIVE_INDEX = 0;

    _Class._observerConfig = {
      childList: true,
      subtree: true
    };

    return _Class;

  }).call(this));

})));
