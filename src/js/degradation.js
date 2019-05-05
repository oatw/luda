(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  (factory());
}(this, (function () { 'use strict';

  var Degradation;

  Degradation = {
    _URL_ATTRIBUTE: 'data-degradation-url',
    _HTML: ['<div id="luda-degradation-html" ', 'style="padding:100px 30px;text-align:center">', '<h1>Your Browser Is Too Old!</h1>', '<p>', 'Please visit this site with a modern browser ', '<a target="_blank" href="https://www.google.com/chrome/">', '(Chrome recommended)', '</a>', '.</p>', '</div>'].join(''),
    _CSS_PROPERTIES: [
      {
        display: 'flex',
        position: ['sticky||-webkit-sticky',
      'fixed']
      },
      'transition',
      'animation'
    ],
    _JS_PROPERTIES: {
      es6Class: 'class X {}',
      es6ArrowFunction: '((x) => x)()',
      mutationObserver: 'new MutationObserver(function(){})'
    },
    _NOTIFY_MILLSECONDS: 500,
    check: function() {
      this._checkEnv();
      this._checkJS(this._JS_PROPERTIES);
      return this._checkCSS(this._CSS_PROPERTIES);
    },
    _eval: eval,
    _checkEnv: function() {
      if (typeof document !== 'undefined') {
        if (typeof window !== 'undefined') {
          return window;
        }
        if (typeof global !== 'undefined') {
          return global;
        }
      }
      throw new Error('Unsupported runtime environment.');
    },
    _checkJS: function(properties) {
      var err, property, results, value;
      results = [];
      for (property in properties) {
        value = properties[property];
        try {
          results.push(this._eval(value));
        } catch (error) {
          err = error;
          this._notify();
          throw new Error(property + ' ' + err);
        }
      }
      return results;
    },
    _checkCSS: function(properties) {
      var ele, i, len, name, property, results, value, valueEle;
      ele = document.createElement('div');
      results = [];
      for (i = 0, len = properties.length; i < len; i++) {
        property = properties[i];
        if (typeof property === 'string') {
          results.push(this._CSSPropertySupported(ele, property));
        } else {
          results.push((function() {
            var results1;
            results1 = [];
            for (name in property) {
              value = property[name];
              this._CSSPropertySupported(ele, name);
              if (value instanceof Array) {
                results1.push((function() {
                  var j, len1, results2;
                  results2 = [];
                  for (j = 0, len1 = value.length; j < len1; j++) {
                    valueEle = value[j];
                    results2.push(this._CSSValueSupported(ele, name, valueEle));
                  }
                  return results2;
                }).call(this));
              } else {
                results1.push(this._CSSValueSupported(ele, name, value));
              }
            }
            return results1;
          }).call(this));
        }
      }
      return results;
    },
    _CSSPropertySupported: function(ele, property) {
      if (typeof ele.style[property] !== 'string') {
        this._notify();
        throw new Error('Unsupported CSS property: ' + property);
      }
    },
    _CSSValueSupported: function(ele, property, valueStr) {
      var i, len, value, values;
      values = valueStr.split('||');
      for (i = 0, len = values.length; i < len; i++) {
        value = values[i];
        ele.style[property] = value;
        if (ele.style[property] === value) {
          return;
        }
      }
      this._notify();
      throw new Error('Unsupported CSS property value: ' + property + ' ' + valueStr);
    },
    _notify: function() {
      var _self, i, len, redirectUrl, ref, script;
      redirectUrl = document.documentElement.getAttribute(this._URL_ATTRIBUTE);
      if (redirectUrl) {
        return location.href = redirectUrl;
      }
      ref = document.scripts;
      for (i = 0, len = ref.length; i < len; i++) {
        script = ref[i];
        redirectUrl = script.getAttribute(this._URL_ATTRIBUTE);
        if (redirectUrl) {
          return location.href = redirectUrl;
        }
      }
      _self = this;
      return setInterval(function() {
        if (!document.getElementById('luda-degradation-html')) {
          if (document.body) {
            return document.body.innerHTML = _self._HTML;
          }
        }
      }, this._NOTIFY_MILLSECONDS);
    }
  };

  Degradation.check();

})));
