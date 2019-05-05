(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js'), require('./dom.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js', './dom.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  var splice = [].splice;

  luda({
    _SWIPE_DISTANCE: 10,
    _EVENT_TYPE_PREFIX: 'luda',
    _SWIPE_LEFT: 'swipeleft',
    _SWIPE_RIGHT: 'swiperight',
    _SWIPE_UP: 'swipeup',
    _SWIPE_DOWN: 'swipedown',
    _SWIPE_LEFT_OR_UP: 'swipeleft or swipeup',
    _SWIPE_RIGHT_OR_DOWN: 'swiperight or swipedown',
    _DOC_READY: 'docready',
    _FORM_RESET: 'reset',
    eventPath: function(event) {
      var path;
      if (event.composedPath) {
        return path = event.composedPath();
      } else if (event.path) {
        return path = event.path;
      } else {
        return path = [event.target].concat(luda.$parents('*', event.target));
      }
    },
    on: function(event, ...selector) {
      var handler, ref;
      ref = selector, [...selector] = ref, [handler] = splice.call(selector, -1);
      switch (event) {
        case this._DOC_READY:
          return this._onDocReady(handler);
        case this._FORM_RESET:
          return this._onReset(selector[0], handler);
        case this._SWIPE_LEFT:
        case this._SWIPE_RIGHT:
        case this._SWIPE_UP:
        case this._SWIPE_DOWN:
        case this._SWIPE_LEFT_OR_UP:
        case this._SWIPE_RIGHT_OR_DOWN:
          return this._onSwipe(event, selector[0], handler);
        default:
          return this._on(event, selector[0], handler);
      }
    },
    onOpposite: function(event, selector, handler) {
      var _self;
      _self = this;
      return document.addEventListener(event, function(e) {
        var trigger;
        trigger = _self.eventPath(e).every(function($element) {
          return !$element.matches || !$element.matches(selector);
        });
        if (trigger) {
          return handler(e);
        }
      });
    },
    dispatch: function($target, type, detail, delayMilliseconds, options = {}) {
      var evt;
      if (typeof options.bubbles !== 'boolean') {
        options.bubbles = true;
      }
      if (typeof options.cancelable !== 'boolean') {
        options.cancelable = true;
      }
      if (typeof options.composed !== 'boolean') {
        options.composed = true;
      }
      evt = new Event(`${this._EVENT_TYPE_PREFIX}:${type}`, options);
      evt.detail = detail;
      if (typeof delayMilliseconds === 'number') {
        return setTimeout(function() {
          if ($target) {
            return $target.dispatchEvent(evt);
          }
        }, delayMilliseconds);
      } else {
        $target.dispatchEvent(evt);
        return evt;
      }
    },
    _onDocReady: function(handler) {
      if (document.readyState === 'loading') {
        return document.addEventListener('DOMContentLoaded', handler);
      } else {
        return handler();
      }
    },
    _onReset: function(selector, handler) {
      return document.addEventListener('reset', function(e) {
        if (selector != null) {
          return luda.$children(selector, e.target).forEach(function($element) {
            return handler.bind($element)(e);
          });
        } else {
          return handler(e);
        }
      });
    },
    _onSwipe: function(event, selector, handler) {
      var $touchStartElement, _self, touchStartE, touchStartX, touchStartY, watch;
      _self = this;
      watch = false;
      $touchStartElement = document;
      touchStartE = null;
      touchStartX = 0;
      touchStartY = 0;
      document.addEventListener('touchstart', function(e) {
        if (e.touches.length === 1) {
          touchStartX = e.touches[0].screenX;
          touchStartY = e.touches[0].screenY;
          if (selector != null) {
            return _self.eventPath(e).some(function($element) {
              if ($element.matches && $element.matches(selector)) {
                $touchStartElement = $element;
                touchStartE = e;
                watch = true;
                return true;
              }
            });
          } else {
            return watch = true;
          }
        }
      });
      return document.addEventListener('touchmove', function(e) {
        var eventX, eventXOrY, eventY, touchDistanceX, touchDistanceY;
        if (watch && e.touches.length === 1) {
          touchDistanceX = e.touches[0].screenX - touchStartX;
          touchDistanceY = e.touches[0].screenY - touchStartY;
          eventX = void 0;
          eventY = void 0;
          eventXOrY = void 0;
          if (Math.abs(touchDistanceX) >= _self._SWIPE_DISTANCE) {
            if (touchDistanceX > 0) {
              eventX = _self._SWIPE_RIGHT;
            } else {
              eventX = _self._SWIPE_LEFT;
            }
          }
          if (Math.abs(touchDistanceY) >= _self._SWIPE_DISTANCE) {
            if (touchDistanceY > 0) {
              eventY = _self._SWIPE_DOWN;
            } else {
              eventY = _self._SWIPE_UP;
            }
          }
          if (eventX === _self._SWIPE_LEFT || eventY === _self._SWIPE_UP) {
            eventXOrY = _self._SWIPE_LEFT_OR_UP;
          }
          if (eventX === _self._SWIPE_RIGHT || eventY === _self._SWIPE_DOWN) {
            eventXOrY = _self._SWIPE_RIGHT_OR_DOWN;
          }
          if (((eventX != null) && eventX === event) || ((eventY != null) && eventY === event) || eventXOrY === event) {
            if (selector != null) {
              return _self.eventPath(e).some(function($element) {
                if ($element === $touchStartElement) {
                  watch = false;
                  handler.bind($element)(touchStartE, e);
                  return true;
                }
              });
            } else {
              watch = false;
              return handler(touchStartE, e);
            }
          }
        }
      });
    },
    _on: function(event, selector, handler) {
      var _self;
      if (selector === window) {
        return window.addEventListener(event, function(e) {
          return handler(e);
        });
      } else {
        _self = this;
        return document.addEventListener(event, function(e) {
          if (selector != null) {
            return _self.eventPath(e).some(function($element) {
              if ($element.matches && $element.matches(selector)) {
                handler.bind($element)(e);
                return true;
              }
            });
          } else {
            return handler(e);
          }
        });
      }
    }
  });

})));
