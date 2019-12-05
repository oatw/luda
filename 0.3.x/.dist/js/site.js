/*! 
   * Luda 0.3.1 | https://oatw.github.io/luda
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
    luda(document).on('turbolinks:before-visit', function(e) {
      var $container;
      $container = luda('#doc-aside').get(0);
      return docAsideScrollTop = $container ? $container.scrollTop : 0;
    });
    luda(document).on('turbolinks:render', function(e) {
      var $container;
      $container = luda('#doc-aside').get(0);
      if ($container) {
        return $container.scrollTop = docAsideScrollTop;
      }
    });
    clipboard = null;
    renderCode = function() {
      var $codes;
      $codes = luda('.highlight:not(.rendered)');
      return $codes.each(function() {
        luda(this).addClass('rendered');
        return this.outerHTML = `<div class='rel'><button type='button' class='code-copy abs-r abs-t zi-high btn btn-small btn-secondary'>Copy</button>${this.outerHTML}</div>`;
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
        luda(e.trigger).removeClass('focus btn-secondary').addClass('btn-primary').text('Copied!');
        return setTimeout(function() {
          return luda(e.trigger).addClass('btn-secondary').removeClass('btn-primary').text('Copy');
        }, 2000);
      });
    };
    initCode = function() {
      renderCode();
      return initClipboard();
    };
    luda.ready(function() {
      return initCode();
    });
    luda(document).on('turbolinks:render', initCode);
    insertSubNav = function() {
      var $titles, items, selectors;
      selectors = '#doc-container h2[id],#doc-container h3[id],#doc-container h4[id]';
      $titles = luda(selectors);
      items = '';
      if ($titles.length) {
        $titles.each(function() {
          var itemClass, link;
          link = `<a href='#${this.id}' data-turbolinks='false' class='doc-sub-nav-item td-none'>${luda(this).text().replace(/^#/, '').replace(/modifier$/i, '')}</a>`;
          switch (this.tagName.toLowerCase()) {
            case 'h2':
              itemClass = 'p7 mt-small mb-tiny py-none text-ellipsis';
              break;
            case 'h3':
              itemClass = 'p7 pl-medium mb-tiny py-none text-ellipsis';
              break;
            default:
              itemClass = 'p7 pl-large mb-tiny py-none text-ellipsis';
          }
          return items += `<p class='${itemClass}'>${link}</p>`;
        });
        return luda('#doc-sub-nav .nav-items').html(items);
      }
    };
    luda.ready(function() {
      return insertSubNav();
    });
    luda(document).on('turbolinks:render', insertSubNav);
    appendAnchors = function() {
      var $titles, selectors;
      selectors = '#doc-container h2[id]:not(.rendered),#doc-container h3[id]:not(.rendered),#doc-container h4[id]:not(.rendered),#doc-container h5[id]:not(.rendered),#doc-container h6[id]:not(.rendered)';
      $titles = luda(selectors);
      if ($titles.length) {
        return $titles.each(function() {
          var link;
          luda(this).addClass('rendered rel');
          link = `<a href='#${this.id}' data-turbolinks='false' class='doc-anchor abs td-none c-primary'>#</a>`;
          return luda(this).prepend(link);
        });
      }
    };
    luda.ready(function() {
      return appendAnchors();
    });
    return luda(document).on('turbolinks:render', appendAnchors);
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
      return luda('html').data(APPLIED_THEME_ATTRIBUTE);
    };
    loadTheme = function(theme, callback) {
      var $appliedTheme, $theme, pathPattern;
      pathPattern = luda('html').data(THEME_PATH_PATTERN_ATTRIBUTE);
      $appliedTheme = luda(`[${APPLIED_THEME_STYLE_ATTRIBUTE}]`);
      $theme = luda('<link>');
      $theme.get(0).rel = 'stylesheet';
      $theme.get(0).type = 'text/css';
      $theme.data(APPLIED_THEME_STYLE_ATTRIBUTE, theme);
      $theme.get(0).href = pathPattern.replace(THEME_PATH_PLACEHOLDER, theme);
      $theme.get(0).onload = callback;
      return $appliedTheme.replaceWith($theme);
    };
    changeTheme = function(theme) {
      if (!(isChanging || theme === appliedTheme())) {
        isChanging = true;
        luda('html').data(APPLIED_THEME_ATTRIBUTE, theme);
        luda('body').addClass(CHANGING_CLASS);
        return setTimeout(function() {
          return loadTheme(theme, function() {
            toggleThemeElements();
            luda('body').removeClass(CHANGING_CLASS);
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
      return luda(`[${APPLIED_THEME_STYLE_ATTRIBUTE}]`).each(function() {
        var themeName;
        themeName = luda(this).data(APPLIED_THEME_STYLE_ATTRIBUTE);
        if (themeName !== appliedThemeName) {
          return luda(this).remove();
        }
      });
    };
    toggleThemeElements = function($range) {
      var appliedThemeName;
      appliedThemeName = appliedTheme();
      return luda(`[${SHOW_FOR_THEME_ATTRIBUTE}]`, $range).each(function() {
        var themeName;
        themeName = luda(this).data(SHOW_FOR_THEME_ATTRIBUTE);
        return luda(this).toggleClass(HIDDEN_CLASS, themeName === appliedThemeName);
      });
    };
    luda(document).on('change', TRIGGER_SELECTOR, function() {
      return changeTheme(this.value);
    });
    luda(document).on('turbolinks:render', function() {
      return removeOldThemes();
    });
    luda(document).on('turbolinks:before-render', function(e) {
      return toggleThemeElements(e.data.newBody);
    });
    return luda(document).on('turbolinks:load', function(e) {
      if (!e.data.timing.requestStart) {
        return toggleThemeElements();
      }
    });
  })();

})));
//# sourceMappingURL=site.js.map
