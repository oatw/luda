/*! 
   * Luda 0.1.13 | https://oatw.github.io/luda
   * Copyright 2019 Oatw | https://oatw.blog
   * MIT license | http://opensource.org/licenses/MIT
   */
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  (factory());
}(this, (function () { 'use strict';

  (function() {
    var appendAnchors, clipboard, docAsideScrollTop, initClipboard, initCode, insertSubNav, renderCode;
    docAsideScrollTop = 0;
    luda.on('turbolinks:before-visit', function(e) {
      var $container;
      $container = luda.$child('#doc-aside');
      return docAsideScrollTop = $container ? $container.scrollTop : 0;
    });
    luda.on('turbolinks:render', function(e) {
      var $container;
      $container = luda.$child('#doc-aside');
      if ($container) {
        return $container.scrollTop = docAsideScrollTop;
      }
    });
    clipboard = null;
    renderCode = function() {
      var $codes;
      $codes = luda.$children('.highlight:not(.rendered)');
      return $codes.forEach(function($code) {
        $code.classList.add('rendered');
        return $code.outerHTML = `<div class='rel'><button type='button' class='code-copy abs-r abs-t zi-high btn btn-small btn-secondary'>Copy</button>${$code.outerHTML}</div>`;
      });
    };
    initClipboard = function() {
      if (clipboard) {
        clipboard.destroy();
      }
      clipboard = new ClipboardJS('.code-copy', {
        target: function(trigger) {
          return trigger.nextElementSibling;
        }
      });
      return clipboard.on('success', function(e) {
        e.clearSelection();
        e.trigger.classList.remove('focus');
        e.trigger.innerText = 'Copied!';
        e.trigger.classList.add('btn-primary');
        e.trigger.classList.remove('btn-secondary');
        return setTimeout(function() {
          e.trigger.innerText = 'Copy';
          e.trigger.classList.add('btn-secondary');
          return e.trigger.classList.remove('btn-primary');
        }, 2000);
      });
    };
    initCode = function() {
      renderCode();
      return initClipboard();
    };
    luda.on('docready', initCode);
    luda.on('turbolinks:render', initCode);
    insertSubNav = function() {
      var $titles, items, selectors;
      selectors = '#doc-container h2[id],#doc-container h3[id],#doc-container h4[id]';
      $titles = luda.$children(selectors);
      items = '';
      if ($titles.length) {
        $titles.forEach(function($title) {
          var link;
          link = `<a href='#${$title.id}' data-turbolinks='false' class='doc-sub-nav-item td-none'>${$title.innerText.replace(/^#/, '').replace(/modifier$/i, '')}</a>`;
          switch ($title.tagName.toLowerCase()) {
            case 'h2':
              return items += `<p class='mt-small py-none text-ellipsis'>${link}</p>`;
            case 'h3':
              return items += `<p class='p6 pl-small py-none text-ellipsis'>${link}</p>`;
            default:
              return items += `<p class='p6 pl-medium py-none text-ellipsis'>${link}</p>`;
          }
        });
        return luda.$child('#doc-sub-nav .nav-items').innerHTML = items;
      }
    };
    luda.on('docready', insertSubNav);
    luda.on('turbolinks:render', insertSubNav);
    appendAnchors = function() {
      var $titles, selectors;
      selectors = '#doc-container h2[id]:not(.rendered),#doc-container h3[id]:not(.rendered),#doc-container h4[id]:not(.rendered),#doc-container h5[id]:not(.rendered),#doc-container h6[id]:not(.rendered)';
      $titles = luda.$children(selectors);
      if ($titles.length) {
        return $titles.forEach(function($title) {
          var link;
          $title.classList.add('rendered');
          $title.classList.add('rel');
          link = `<a href='#${$title.id}' data-turbolinks='false' class='doc-anchor abs td-none c-primary'>#</a>`;
          return $title.insertAdjacentHTML('afterBegin', link);
        });
      }
    };
    luda.on('docready', appendAnchors);
    return luda.on('turbolinks:render', appendAnchors);
  })();

  (function() {
    var APPLIED_THEME_ATTRIBUTE, APPLIED_THEME_STYLE_ATTRIBUTE, CHANGING_CLASS, HIDDEN_CLASS, SHOW_FOR_THEME_ATTRIBUTE, THEME_PATH_PATTERN_ATTRIBUTE, THEME_PATH_PLACEHOLDER, TRIGGER_SELECTOR, appliedTheme, changeTheme, isChanging, loadTheme, removeOldThemes, toggleThemeElements;
    APPLIED_THEME_ATTRIBUTE = 'data-applied-theme';
    THEME_PATH_PATTERN_ATTRIBUTE = 'data-theme-path-pattern';
    THEME_PATH_PLACEHOLDER = '$theme$';
    APPLIED_THEME_STYLE_ATTRIBUTE = 'data-theme-style';
    SHOW_FOR_THEME_ATTRIBUTE = 'data-theme';
    HIDDEN_CLASS = 'd-none';
    CHANGING_CLASS = 'changing-theme';
    TRIGGER_SELECTOR = '.change-theme';
    isChanging = false;
    appliedTheme = function() {
      return document.documentElement.getAttribute(APPLIED_THEME_ATTRIBUTE);
    };
    loadTheme = function(theme, callback) {
      var $appliedTheme, $theme, pathPattern;
      pathPattern = document.documentElement.getAttribute(THEME_PATH_PATTERN_ATTRIBUTE);
      $appliedTheme = luda.$child(`[${APPLIED_THEME_STYLE_ATTRIBUTE}]`);
      $theme = document.createElement('link');
      $theme.rel = 'stylesheet';
      $theme.type = 'text/css';
      $theme.setAttribute(APPLIED_THEME_STYLE_ATTRIBUTE, theme);
      $theme.href = pathPattern.replace(THEME_PATH_PLACEHOLDER, theme);
      $theme.onload = callback;
      return document.head.replaceChild($theme, $appliedTheme);
    };
    changeTheme = function(theme) {
      if (!(isChanging || theme === appliedTheme())) {
        isChanging = true;
        document.documentElement.setAttribute(APPLIED_THEME_ATTRIBUTE, theme);
        document.body.classList.add(CHANGING_CLASS);
        return setTimeout(function() {
          return loadTheme(theme, function() {
            toggleThemeElements();
            document.body.classList.remove(CHANGING_CLASS);
            return setTimeout(function() {
              return isChanging = false;
            }, 500);
          });
        }, 500);
      }
    };
    removeOldThemes = function() {
      var appliedThemeName;
      appliedThemeName = appliedTheme();
      return luda.$children(`[${APPLIED_THEME_STYLE_ATTRIBUTE}]`).forEach(function($theme) {
        var themeName;
        themeName = $theme.getAttribute(APPLIED_THEME_STYLE_ATTRIBUTE);
        if (themeName !== appliedThemeName) {
          return $theme.remove();
        }
      });
    };
    toggleThemeElements = function($range) {
      var appliedThemeName;
      appliedThemeName = appliedTheme();
      return luda.$children(`[${SHOW_FOR_THEME_ATTRIBUTE}]`, $range).forEach(function($ele) {
        var themeName;
        themeName = $ele.getAttribute(SHOW_FOR_THEME_ATTRIBUTE);
        if (themeName === appliedThemeName) {
          return $ele.classList.remove(HIDDEN_CLASS);
        } else {
          return $ele.classList.add(HIDDEN_CLASS);
        }
      });
    };
    luda.on('change', TRIGGER_SELECTOR, function() {
      return changeTheme(this.value);
    });
    luda.on('turbolinks:render', function() {
      return removeOldThemes();
    });
    luda.on('turbolinks:before-render', function(e) {
      return toggleThemeElements(e.data.newBody);
    });
    return luda.on('turbolinks:load', function(e) {
      if (!e.data.timing.requestStart) {
        return toggleThemeElements();
      }
    });
  })();

})));
//# sourceMappingURL=site.js.map
