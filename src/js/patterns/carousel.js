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
        var action, activatedIndex;
        if (this._$items.length && !this._isTransitioning()) {
          activatedIndex = this._activeIndex;
          if ((index != null) && index !== this._activeIndex && (0 <= index && index <= this._$items.length - 1) && this._canTransition(index, activatedIndex)) {
            this._activeIndex = index;
            action = index < activatedIndex ? '_slidePrev' : '_slideNext';
            return this[action](activatedIndex);
          }
        }
      }

      next() {
        var activatedIndex, index;
        if (this._$items.length && !this._isTransitioning()) {
          activatedIndex = this._activeIndex;
          index = activatedIndex + 1;
          if (index > this._$items.length - 1) {
            if (!this._wrap) {
              return;
            }
            index = 0;
          }
          if (!this._canTransition(index, activatedIndex)) {
            return;
          }
          this._activeIndex = index;
          this._slideNext(activatedIndex);
          this._playTimeStamp = Date.now();
          return this._pausedRemainTime = this._interval;
        }
      }

      prev() {
        var activatedIndex, index;
        if (this._$items.length && !this._isTransitioning()) {
          activatedIndex = this._activeIndex;
          index = activatedIndex - 1;
          if (index < 0) {
            if (!this._wrap) {
              return;
            }
            index = this._$items.length - 1;
          }
          if (!this._canTransition(index, activatedIndex)) {
            return;
          }
          this._activeIndex = index;
          this._slidePrev(activatedIndex);
          this._playTimeStamp = Date.now();
          return this._pausedRemainTime = this._interval;
        }
      }

      pause() {
        if (this._intervaling != null) {
          clearInterval(this._intervaling);
          this._intervaling = null;
          return this._pausedRemainTime = this._pausedRemainTime - (Date.now() - this._playTimeStamp);
        }
      }

      play() {
        var execute;
        if (this._interval && this._$items.length > 1) {
          this._playTimeStamp = Date.now();
          this.pause();
          execute = () => {
            this.next();
            return this._intervaling = setInterval(this.next.bind(this), this._interval);
          };
          return this._intervaling = setTimeout(execute, this._pausedRemainTime);
        }
      }

      // private
      _getConfig() {
        var _$indicators, _$items, _$nextControl, _$prevControl, _activeIndex, _interval, _wrap;
        _$items = luda.$unnested(this.constructor._ITEMS_SELECTOR, this._$component, this.constructor._SELECTOR);
        _$indicators = luda.$unnested(this.constructor._INDICATORS_SELECTOR, this._$component, this.constructor._SELECTOR);
        _$prevControl = luda.$child(this.constructor._PREV_CONTROL_SELECTOR, this._$component);
        _$nextControl = luda.$child(this.constructor._NEXT_CONTROL_SELECTOR, this._$component);
        _activeIndex = _$items.indexOf(luda.$child(`.${this.constructor._ITEM_ACTIVE_CSS_CLASS}`, this._$component));
        if (_activeIndex === -1) {
          _activeIndex = this.constructor._ACTIVE_INDEX;
        }
        _interval = this._$component.getAttribute(this.constructor._INTERVAL_ATTRIBUTE);
        if (_interval === this.constructor._FALSE) {
          _interval = false;
        } else {
          _interval = Math.abs(parseInt(_interval, 10)) || this.constructor._INTERVAL;
        }
        _wrap = this._$component.getAttribute(this.constructor._WRAP_ATTRIBUTE);
        _wrap = _wrap === this.constructor._FALSE ? false : this.constructor._WRAP;
        return {_$items, _$indicators, _$prevControl, _$nextControl, _activeIndex, _interval, _wrap};
      }

      _constructor() {
        ({_$items: this._$items, _$indicators: this._$indicators, _$prevControl: this._$prevControl, _$nextControl: this._$nextControl, _activeIndex: this._activeIndex, _interval: this._interval, _wrap: this._wrap} = this._getConfig());
        this._intervaling = null;
        this._playTimeStamp = 0;
        this._pausedRemainTime = this._interval;
        this._layout();
        this._handleTransitionCancel();
        return this.play();
      }

      _onMutations(mutations) {
        ({_$items: this._$items, _$indicators: this._$indicators, _$prevControl: this._$prevControl, _$nextControl: this._$nextControl, _activeIndex: this._activeIndex, _interval: this._interval, _wrap: this._wrap} = this._getConfig());
        this._setIndicatorsState();
        this._setDirectionControlState();
        return this.play();
      }

      _destroy() {
        return this.pause();
      }

      _layout() {
        this._$items.forEach(($item, index) => {
          $item.style.transition = 'none';
          if (index > this._activeIndex) {
            $item.classList.add(this.constructor._ITEM_NEXT_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_PREV_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          } else if (index < this._activeIndex) {
            $item.classList.add(this.constructor._ITEM_PREV_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_NEXT_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          } else {
            $item.classList.add(this.constructor._ITEM_ACTIVE_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_NEXT_CSS_CLASS);
            $item.classList.remove(this.constructor._ITEM_PREV_CSS_CLASS);
          }
          luda.reflow($item);
          return $item.style.transition = '';
        });
        this._setIndicatorsState();
        return this._setDirectionControlState();
      }

      _slideNext(activatedIndex) {
        var $activatedItem, $item;
        if (this._$items.length > 1) {
          $item = this._$items[this._activeIndex];
          $activatedItem = this._$items[activatedIndex];
          $item.style.transition = 'none';
          $item.classList.remove(this.constructor._ITEM_PREV_CSS_CLASS);
          $item.classList.add(this.constructor._ITEM_NEXT_CSS_CLASS);
          luda.reflow($item);
          $item.style.transition = '';
          $item.classList.remove(this.constructor._ITEM_NEXT_CSS_CLASS);
          $item.classList.add(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          $activatedItem.classList.remove(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          $activatedItem.classList.add(this.constructor._ITEM_PREV_CSS_CLASS);
          this._handleTransitionEnd(this._activeIndex, activatedIndex);
          this._setIndicatorsState();
          return this._setDirectionControlState();
        }
      }

      _slidePrev(activatedIndex) {
        var $activatedItem, $item;
        if (this._$items.length > 1) {
          $item = this._$items[this._activeIndex];
          $activatedItem = this._$items[activatedIndex];
          $item.style.transition = 'none';
          $item.classList.remove(this.constructor._ITEM_NEXT_CSS_CLASS);
          $item.classList.add(this.constructor._ITEM_PREV_CSS_CLASS);
          luda.reflow($item);
          $item.style.transition = '';
          $item.classList.remove(this.constructor._ITEM_PREV_CSS_CLASS);
          $item.classList.add(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          $activatedItem.classList.remove(this.constructor._ITEM_ACTIVE_CSS_CLASS);
          $activatedItem.classList.add(this.constructor._ITEM_NEXT_CSS_CLASS);
          this._handleTransitionEnd(this._activeIndex, activatedIndex);
          this._setIndicatorsState();
          return this._setDirectionControlState();
        }
      }

      _canTransition(activeIndex, activatedIndex) {
        return !this._activatePrevented(this._$items[activeIndex], activeIndex) && !this._deactivatePrevented(this._$items[activatedIndex], activatedIndex);
      }

      _handleTransitionEnd(activeIndex, activatedIndex) {
        var activateDuration, deactivateDuration;
        activateDuration = this._handleActivateEnd(this._$items[activeIndex], activeIndex);
        return deactivateDuration = this._handleDeactivateEnd(this._$items[activatedIndex], activatedIndex);
      }

      _handleTransitionCancel() {
        var activatedIndex, index;
        if (this._isActivating()) {
          index = parseInt(this._getActivatingMark(), 10);
          this._handleActivateCancel(this._$items[index], index);
        }
        if (this._isDeactivating()) {
          activatedIndex = parseInt(this._getDeactivatingMark(), 10);
          return this._handleDeactivateCancel(this._$items[activatedIndex], activatedIndex);
        }
      }

      _setIndicatorsState() {
        return this._$indicators.forEach(($indicator, index) => {
          return $indicator.disabled = index === this._activeIndex;
        });
      }

      _setDirectionControlState() {
        var ref, ref1, ref2, ref3;
        if (this._$items.length <= 1) {
          return (ref = this._$prevControl) != null ? ref.disabled = (ref1 = this._$nextControl) != null ? ref1.disabled = true : void 0 : void 0;
        } else {
          if ((ref2 = this._$prevControl) != null) {
            ref2.disabled = this._activeIndex === 0 && !this._wrap;
          }
          return (ref3 = this._$nextControl) != null ? ref3.disabled = this._activeIndex === this._$items.length - 1 && !this._wrap : void 0;
        }
      }

      static activate($carousel, index) {
        return this.query($carousel).activate(index);
      }

      static next($carousel) {
        return this.query($carousel).next();
      }

      static prev($carousel) {
        return this.query($carousel).prev();
      }

      static pause($carousel) {
        return this.query($carousel).pause();
      }

      static play($carousel) {
        return this.query($carousel).play();
      }

      // static private
      static _init() {
        var self;
        self = this;
        luda.on('click', this._INDICATORS_SELECTOR, function(e) {
          var instance;
          instance = self.query(luda.$parent(self._SELECTOR, this));
          return instance.activate(instance._$indicators.indexOf(this));
        });
        luda.on('touchstart', this._SELECTOR, function(e) {
          return self.query(this).pause();
        });
        luda.on('touchend', this._SELECTOR, function(e) {
          return setTimeout(() => {
            return self.query(this).play();
          });
        });
        luda.on('mouseover', this._SELECTOR, function(e) {
          return self.query(this).pause();
        });
        luda.on('mouseout', this._SELECTOR, function(e) {
          return self.query(this).play();
        });
        luda.on(luda._SWIPE_LEFT_OR_UP, this._SELECTOR, function(startE, e) {
          return self.query(this).next();
        });
        luda.on(luda._SWIPE_RIGHT_OR_DOWN, this._SELECTOR, function(startE, e) {
          return self.query(this).prev();
        });
        luda.on('click', this._PREV_CONTROL_SELECTOR, function(e) {
          return self.query(luda.$parent(self._SELECTOR, this)).prev();
        });
        return luda.on('click', this._NEXT_CONTROL_SELECTOR, function(e) {
          return self.query(luda.$parent(self._SELECTOR, this)).next();
        });
      }

    };

    _Class._SCOPE = 'carousel';

    _Class._SELECTOR = '.carousel';

    _Class._ITEMS_SELECTOR = '.carousel-item';

    _Class._PREV_CONTROL_SELECTOR = '.carousel-prev';

    _Class._NEXT_CONTROL_SELECTOR = '.carousel-next';

    _Class._INDICATORS_SELECTOR = '.carousel-indicators .btn';

    _Class._INTERVAL_ATTRIBUTE = 'data-carousel-interval';

    _Class._WRAP_ATTRIBUTE = 'data-carousel-wrap';

    _Class._ACTIVATED_INDEX_ATTRIBUTE = 'data-carousel-activated-index';

    _Class._ITEM_ACTIVE_CSS_CLASS = 'carousel-item-active';

    _Class._ITEM_NEXT_CSS_CLASS = 'carousel-item-next';

    _Class._ITEM_PREV_CSS_CLASS = 'carousel-item-prev';

    _Class._ACTIVE_INDEX = 0;

    _Class._INTERVAL = 5000;

    _Class._WRAP = true;

    _Class._FALSE = 'false';

    _Class._observerConfig = {
      childList: true,
      attributes: true,
      subtree: true,
      attributeFilter: [_Class._INTERVAL_ATTRIBUTE, _Class._WRAP_ATTRIBUTE]
    };

    return _Class;

  }).call(this));

})));
