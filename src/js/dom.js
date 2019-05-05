(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./install.js')) :
  typeof define === 'function' && define.amd ? define(['./install.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda({
    $child: function(selector, $ancestor) {
      if (!$ancestor) {
        $ancestor = document;
      }
      return $ancestor.querySelector(selector);
    },
    $children: function(selector, $ancestor) {
      var $descendant, descendants;
      if (!$ancestor) {
        $ancestor = document;
      }
      $descendant = this.$child(selector, $ancestor);
      if ($descendant) {
        return descendants = Array.from($ancestor.querySelectorAll(selector));
      } else {
        return descendants = [];
      }
    },
    $unnested: function(selector, $ancestor, ancestorSelector) {
      var descendants;
      descendants = this.$children(selector, $ancestor);
      return descendants.filter(($descendant) => {
        if (this.$parent(ancestorSelector, $descendant) === $ancestor) {
          return $descendant;
        }
      });
    },
    $parent: function(selector, $descendant) {
      var $ancestor;
      $ancestor = $descendant.parentNode;
      if ($ancestor) {
        if ($ancestor.matches && $ancestor.matches(selector)) {
          return $ancestor;
        } else {
          return this.$parent(selector, $ancestor);
        }
      }
    },
    $parents: function(selector, $descendant, _ancestors) {
      var $ancestor;
      $ancestor = this.$parent(selector, $descendant);
      if (!_ancestors) {
        _ancestors = [];
      }
      if ($ancestor) {
        _ancestors.push($ancestor);
        return this.$parents(selector, $ancestor, _ancestors);
      } else {
        return _ancestors;
      }
    },
    $after: function($node, $target) {
      var $parent;
      $parent = $target.parentNode;
      if ($parent.lastChild === $target) {
        return $parent.appendChild($node);
      } else {
        return $parent.insertBefore($node, $target.nextSibling);
      }
    },
    $prepend: function($node, $target) {
      if ($target.firstChild) {
        return $target.insertBefore($node, $target.firstChild);
      } else {
        return $target.appendChild($node);
      }
    },
    reflow: function($element) {
      return $element.offsetHeight;
    },
    _getTransitionDurations: function(style, propertyLength) {
      var durationArray;
      durationArray = style.split(',');
      while (durationArray.length < propertyLength) {
        durationArray = durationArray.concat(durationArray);
      }
      if (durationArray.length > propertyLength) {
        durationArray = durationArray.slice(0, propertyLength);
      }
      return durationArray.map(function(durationStr) {
        var duration;
        duration = parseFloat(durationStr);
        if (!duration) {
          return 0;
        }
        if (durationStr.match('ms')) {
          return duration;
        } else {
          return duration * 1000;
        }
      });
    },
    getTransitionDuration: function($element) {
      var delays, durations, finalDurations, length, styles;
      styles = window.getComputedStyle($element);
      length = styles.transitionProperty.split(',').length;
      if (!length) {
        return 0;
      }
      delays = this._getTransitionDurations(styles.transitionDelay, length);
      durations = this._getTransitionDurations(styles.transitionDuration, length);
      finalDurations = durations.map(function(duration, index) {
        return duration + delays[index];
      });
      return Math.max.apply(null, finalDurations);
    },
    _observeDom: function(onNodeAdded, onNodeRemoved) {
      var observer, observerConfig;
      observerConfig = {
        childList: true,
        subtree: true
      };
      observer = new MutationObserver(function(mutations) {
        return mutations.forEach(function(mutation) {
          var $addedNodes, $removedNodes;
          $removedNodes = Array.from(mutation.removedNodes);
          $addedNodes = Array.from(mutation.addedNodes);
          $removedNodes.forEach(function($node) {
            if ($node instanceof Element && onNodeRemoved) {
              return onNodeRemoved($node);
            }
          });
          return $addedNodes.forEach(function($node) {
            if ($node instanceof Element && onNodeAdded) {
              return onNodeAdded($node);
            }
          });
        });
      });
      observer.observe(document.documentElement, observerConfig);
      return observer;
    }
  });

})));
