/*! 
   * Luda 0.3.0 | https://oatw.github.io/luda
   * Copyright 2019 Oatw | https://oatw.blog
   * MIT license | http://opensource.org/licenses/MIT
   */
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  (factory());
}(this, (function () { 'use strict';

  var Type = {
    isArray: Array.isArray,
    isString: function(x) {
      return typeof x === 'string';
    },
    isFunction: function(x) {
      return typeof x === 'function';
    },
    isObject: function(x) {
      return typeof x === 'object';
    },
    isBool: function(x) {
      return typeof x === 'boolean';
    },
    isNumeric: function(x) {
      return !isNaN(parseFloat(x)) && isFinite(x);
    },
    isDecimalism: function(x) {
      return /^\d*\.?\d+$/.test(x && !/^0+\d+\.?/.test(x));
    },
    isId: function(x) {
      return /^#[\w-]*$/.test(x);
    },
    isClass: function(x) {
      return /^\.[\w-]*$/.test(x);
    },
    isTag: function(x) {
      return /^\w+$/.test(x);
    },
    isSingleTag: function(x) {
      return /^\s*<(\w+)\s*\/?>(?:<\/\1>)?\s*$/.test(x);
    },
    isHtml: function(x) {
      return /<.+>/.test(x);
    },
    isScript: function(x) {
      return x.tagName === 'SCRIPT' && /^$|^module$|\/(?:java|ecma)script/i.test(x.type);
    },
    isFragment: function(x) {
      return /^\s*<(\w+)[^>]*>/.test(x);
    },
    isWindow: function(x) {
      return x && x === window;
    },
    isDocument: function(x) {
      return x && x.nodeType === 9;
    },
    isElement: function(x) {
      return x && x.nodeType === 1;
    }
  };

  function createMounter(target, messagePrefix, handler) {
    var mount;
    return mount = function(name, val) {
      var msg, n, v;
      if (Type.isString(name)) {
        if (name in target) {
          msg = `Namespace '${name}' is occupied, `;
          msg += `skip ${messagePrefix || 'mounting'}.`;
          console.warn(msg);
        } else {
          target[name] = handler ? handler(name, val) : val;
        }
      } else {
        for (n in name) {
          v = name[n];
          mount(n, v);
        }
      }
      return this;
    };
  }

  var getEnv;

  getEnv = function() {
    if (typeof document !== 'undefined') {
      if (typeof window !== 'undefined') {
        return window;
      }
      if (typeof global !== 'undefined') {
        return global;
      }
    }
    throw new Error('Unsupported environment!');
  };

  var environment = getEnv();

  function find(selector, ctx = document) {
    if (!(Type.isDocument(ctx) || Type.isElement(ctx))) {
      return [];
    }
    return Array.from((function() {
      switch (false) {
        case !Type.isClass(selector):
          return ctx.getElementsByClassName(selector.slice(1));
        case !Type.isTag(selector):
          return ctx.getElementsByTagName(selector);
        default:
          // when Type.isId selector
          //  if el = ctx.getElementById selector.slice(1) then [el] else []
          return ctx.querySelectorAll(selector);
      }
    })());
  }

  var containers, containersMap;

  containersMap = null;

  containers = function(type) {
    var div, table, tr;
    if (containersMap) {
      return containersMap[type] || containersMap['*'];
    }
    div = document.createElement('div');
    table = document.createElement('table');
    tr = document.createElement('tr');
    containersMap = {
      '*': div,
      thead: table,
      tbody: table,
      tfoot: table,
      tr: document.createElement('tbody'),
      th: tr,
      td: tr
    };
    return containers(type);
  };

  function parseHTML(html) {
    var container;
    if (!Type.isString(html)) {
      return [];
    }
    if (Type.isSingleTag(html)) {
      return [document.createElement(RegExp.$1)];
    }
    container = containers(Type.isFragment(html && RegExp.$1));
    container.innerHTML = html;
    return Array.from(container.childNodes).map(function(node) {
      if (node.parentNode) {
        return node.parentNode.removeChild(node);
      }
    });
  }

  var Luda, luda;

  Luda = class Luda {
    constructor(selector, ctx = document) {
      this.els = [];
      this.length = 0;
      if (!selector) {
        return;
      }
      if (selector instanceof Luda) {
        return selector;
      }
      this.els = (function() {
        switch (false) {
          case !Type.isString(selector):
            if (Type.isHtml(selector)) {
              return parseHTML(selector);
            } else {
              if (ctx instanceof Luda) {
                ctx = ctx.els[0];
              }
              return find(selector, ctx);
            }
            break;
          case !(selector.nodeType || Type.isWindow(selector)):
            return [selector];
          case !Type.isArray(selector):
            return selector;
          default:
            return Array.from(selector);
        }
      })();
      this.length = this.els.length;
    }

  };

  if (!(luda = environment.luda)) {
    environment.luda = luda = function(selector, ctx) {
      return new Luda(selector, ctx);
    };
    luda.include = createMounter(Luda.prototype, 'including');
    luda.extend = createMounter(luda, 'extending');
  }

  var ValuesMap = {
    'false': false,
    'true': true,
    'Infinity': 2e308,
    'NaN': 0/0,
    'null': void 0,
    'undefined': void 0
  };

  function readValue(value) {
    if (value === null || value === 'null') {
      return;
    }
    if (!Type.isString(value)) {
      return value;
    }
    try {
      return JSON.parse(value);
    } catch (error) {
      if (Type.isDecimalism(value)) {
        return Number(value);
      } else if (value in ValuesMap) {
        return ValuesMap[value];
      } else {
        return value;
      }
    }
  }

  function parseValue(value) {
    if (!Type.isObject(value)) {
      return value;
    }
    try {
      return JSON.stringify(value);
    } catch (error) {
      return value;
    }
  }

  function splitValues(str) {
    if (Type.isString(str)) {
      return str.match(/\S+/g) || [];
    } else {
      return [];
    }
  }

  luda.include({
    each: function(callback) {
      this.els.some(function(el, index) {
        return callback.call(el, el, index) === false;
      });
      return this;
    }
  });

  luda.include({
    removeAttr: function(attr) {
      var attrs;
      attrs = splitValues(attr);
      if (!attrs.length) {
        return this;
      }
      this.els.forEach(function(el) {
        return attrs.forEach(function(att) {
          return el.removeAttribute(att);
        });
      });
      return this;
    }
  });

  luda.include({
    attr: function(attr, value) {
      var key, val;
      if (!attr) {
        return;
      }
      if (Type.isString(attr)) {
        if (arguments.length >= 2) {
          if (value === void 0) {
            return this;
          }
          if (value === null) {
            return this.removeAttr(attr);
          }
          this.els.forEach(function(el) {
            return el.setAttribute(attr, parseValue(value));
          });
          return this;
        }
        if (!this.els[0]) {
          return;
        }
        return readValue(this.els[0].getAttribute(attr));
      }
      for (key in attr) {
        val = attr[key];
        this.attr(key, val);
      }
      return this;
    }
  });

  luda.include({
    hasAttr: function(attr) {
      if (!attr) {
        return false;
      }
      return this.els.some(function(el) {
        return el.hasAttribute(attr);
      });
    }
  });

  var pattern, replacer;

  pattern = /-([a-z])/g;

  replacer = function(match, letter) {
    return letter.toUpperCase();
  };

  function camelCase(str) {
    return str.replace(pattern, replacer);
  }

  var pattern$1, replacer$1;

  pattern$1 = /([A-Z])/g;

  replacer$1 = function(match, letter) {
    return `-${letter.toLowerCase()}`;
  };

  function dashCase(str) {
    return `${str[0].toLowerCase()}${str.slice(1).replace(pattern$1, replacer$1)}`;
  }

  var guid;

  guid = 0;

  function guid$1() {
    return guid += 1;
  }

  function pluck(arr, prop, deep) {
    var plucked;
    plucked = [];
    arr.forEach(function(item) {
      var results, val;
      val = item[prop];
      results = [];
      while (val !== null) {
        plucked.push(val);
        if (!deep) {
          break;
        }
        results.push(val = val[prop]);
      }
      return results;
    });
    return plucked;
  }

  function unique(arr) {
    if (!(arr.length > 1)) {
      return arr;
    }
    return arr.filter(function(item, index) {
      return arr.indexOf(item) === index;
    });
  }

  ['isString', 'isFunction', 'isArray', 'isObject', 'isBool', 'isNumeric', 'isDecimalism', 'isElement'].forEach(function(key) {
    return luda.extend(key, Type[key]);
  });

  luda.extend({
    camelCase: camelCase,
    dashCase: dashCase,
    guid: guid$1,
    pluck: pluck,
    unique: unique
  });

  var _cache, cache, cacheFactory, privateCache, publicCache;

  publicCache = {};

  privateCache = {};

  cacheFactory = function(cache) {
    return function(guid, key, value) {
      if (!guid) {
        return cache;
      }
      if (key === null) {
        return delete cache[guid];
      } else if (value === null) {
        if (!(guid in cache)) {
          return;
        }
        delete cache[guid][key];
        if (!Object.keys(cache[guid]).length) {
          return delete cache[guid];
        }
      } else if (value === void 0) {
        if (key === void 0) {
          return cache[guid];
        }
        if (Type.isObject(key)) {
          return cache[guid] = key;
        }
        if (!(guid in cache)) {
          return;
        }
        return cache[guid][key];
      } else {
        if (key === void 0) {
          return;
        }
        cache[guid] || (cache[guid] = {});
        return cache[guid][key] = value;
      }
    };
  };

  cache = cacheFactory(publicCache);

  _cache = cacheFactory(privateCache);

  var expando = '__luda_guid';

  var _access, access, accessFactory, clean;

  accessFactory = function(c) {
    return function(owner, key, value) {
      var uid;
      if (!arguments.length) {
        return c();
      }
      uid = owner[expando] || (owner[expando] = guid$1());
      return c(uid, key, value);
    };
  };

  access = accessFactory(cache);

  _access = accessFactory(_cache);

  clean = function(owner) {
    if (owner[expando]) {
      _access(owner, null);
      return access(owner, null);
    }
  };

  luda.include({
    removeCache: function(key) {
      var keys;
      if (arguments.length) {
        keys = splitValues(key).map(function(k) {
          return camelCase(k);
        });
        if (!keys.length) {
          return this;
        }
        this.els.forEach(function(el) {
          return keys.forEach(function(k) {
            return access(el, k, null);
          });
        });
      } else {
        this.els.forEach(function(el) {
          return access(el, null);
        });
      }
      return this;
    }
  });

  luda.extend({
    cache: function(isPrivate) {
      if (isPrivate) {
        return _access();
      } else {
        return access();
      }
    }
  });

  luda.include({
    cache: function(key, value) {
      var k, v;
      if (!key) {
        if (!this.els[0]) {
          return;
        }
        return access(this.els[0]) || access(this.els[0], {});
      }
      if (Type.isString(key)) {
        key = camelCase(key);
        if (arguments.length < 2) {
          if (!this.els[0]) {
            return;
          }
          if (!access(this.els[0])) {
            access(this.els[0], {});
          }
          return access(this.els[0], key);
        }
        if (value === void 0) {
          return this;
        }
        if (value === null) {
          return this.removeCache(key);
        }
        this.els.forEach(function(el) {
          if (!access(el)) {
            access(el, {});
          }
          return access(el, key, value);
        });
        return this;
      }
      for (k in key) {
        v = key[k];
        this.cache(k, v);
      }
      return this;
    }
  });

  var parse, pattern$2;

  pattern$2 = /^\./;

  parse = function(cls) {
    if (Type.isString(cls)) {
      return cls.replace(pattern$2, '');
    } else {
      return cls;
    }
  };

  var parseClass = parse;

  luda.include({
    toggleClass: function(cls, force) {
      var classes, isForce;
      classes = splitValues(cls);
      isForce = force !== void 0;
      if (!classes.length) {
        return this;
      }
      classes = classes.map(function(c) {
        return parseClass(c);
      });
      this.els.forEach(function(el) {
        return classes.forEach(function(c) {
          if (isForce) {
            if (force) {
              return el.classList.add(c);
            } else {
              return el.classList.remove(c);
            }
          } else {
            return el.classList.toggle(c);
          }
        });
      });
      return this;
    }
  });

  luda.include({
    addClass: function(cls) {
      return this.toggleClass(cls, true);
    }
  });

  luda.include({
    hasClass: function(cls) {
      if (!cls) {
        return false;
      }
      cls = parseClass(cls);
      return this.els.some(function(el) {
        return el.classList.contains(cls);
      });
    }
  });

  luda.include({
    removeClass: function(cls) {
      if (arguments.length) {
        return this.toggleClass(cls, false);
      } else {
        return this.attr('class', '');
      }
    }
  });

  luda.include({
    add: function(selector, context) {
      return luda(unique(this.els.concat(luda(selector, context).els)));
    }
  });

  luda.include({
    get: function(index) {
      if (index === void 0) {
        return this.els;
      }
      return this.els[index < 0 ? index + this.els.length : index];
    }
  });

  luda.include({
    eq: function(index) {
      return luda(this.get(index));
    }
  });

  function matches(el, selector) {
    return el && el.matches && el.matches(selector);
  }

  function collect(els, comparator, oppsite) {
    if (!comparator || !(els != null ? els.length : void 0)) {
      return els;
    }
    return els.filter(function(el, index) {
      var match;
      match = (function() {
        switch (false) {
          case !Type.isString(comparator):
            return matches(el, comparator);
          case !Type.isFunction(comparator):
            return comparator.call(el, el, index);
          case !(comparator instanceof Luda):
            return comparator.els.includes(el);
          default:
            return el === comparator;
        }
      })();
      if (oppsite) {
        return !match;
      } else {
        return match;
      }
    });
  }

  luda.include({
    filter: function(comparator) {
      if (!comparator) {
        return luda();
      }
      return luda(collect(this.els, comparator));
    }
  });

  luda.include({
    first: function() {
      return this.eq(0);
    }
  });

  luda.include({
    has: function(selector) {
      var comparator;
      if (Type.isString(selector)) {
        comparator = function(el) {
          return find(selector, el).length > 0;
        };
      } else {
        comparator = function(el) {
          return el.contains(selector);
        };
      }
      return this.filter(comparator);
    }
  });

  luda.include({
    children: function(comparator) {
      var all;
      all = [];
      this.els.forEach(function(el) {
        return [].push.apply(all, el.children);
      });
      return luda(collect(unique(all), comparator));
    }
  });

  luda.include({
    parent: function(comparator) {
      var parents;
      if (!comparator) {
        return luda(unique(pluck(this.els, 'parentNode')));
      }
      parents = [];
      this.els.forEach(function(el) {
        var matched, parent;
        while (parent = el.parentNode) {
          matched = collect([parent], comparator)[0];
          if (matched) {
            return parents.push(matched);
          }
          el = parent;
        }
      });
      return luda(unique(parents));
    }
  });

  luda.include({
    index: function(selector) {
      var child, collection;
      child = selector ? luda(selector).els[0] : this.els[0];
      collection = selector ? this.els : luda(child).parent().children().els;
      return collection.indexOf(child);
    }
  });

  luda.include({
    is: function(comparator) {
      if (!comparator || !this.els.length) {
        return false;
      }
      return collect(this.els, comparator).length > 0;
    }
  });

  luda.include({
    last: function() {
      return this.eq(-1);
    }
  });

  luda.include({
    map: function(callback) {
      var collection;
      collection = this.els.map(function(el, index) {
        return callback.call(el, el, index);
      });
      return luda(collection);
    }
  });

  luda.include({
    not: function(comparator) {
      if (!comparator || !this.els.length) {
        return this;
      }
      return luda(collect(this.els, comparator, true));
    }
  });

  luda.include({
    slice: function() {
      return luda([].slice.apply(this.els, arguments));
    }
  });

  luda.extend({
    ready: function(callback) {
      var handler;
      if (document.readyState === 'loading') {
        handler = function() {
          callback(luda);
          return document.removeEventListener('DOMContentLoaded', handler);
        };
        document.addEventListener('DOMContentLoaded', handler);
      } else {
        handler = function() {
          return callback(luda);
        };
        setTimeout(handler);
      }
      return this;
    }
  });

  function findAll(selector, ctx) {
    var all;
    all = find(selector, ctx);
    if (matches(ctx, selector)) {
      all.push(ctx);
    }
    return all;
  }

  var Components, autoCreateAndDestroy, autoable, config, disAutoSelector, observer;

  disAutoSelector = '[data-auto=false]';

  Components = [];

  observer = null;

  config = {
    childList: true,
    subtree: true,
    attributes: true
  };

  autoCreateAndDestroy = function(Component) {
    if (Components.includes(Component)) {
      return;
    }
    Components.push(Component);
    if (observer) {
      return;
    }
    observer = new MutationObserver(function(mus) {
      var attrNodes, nodes;
      nodes = [];
      attrNodes = [];
      mus.forEach(function(mu) {
        nodes = nodes.concat(Array.from(mu.addedNodes)).concat(Array.from(mu.removedNodes));
        if (mu.type === 'attributes') {
          return attrNodes.push(mu.target);
        }
      });
      nodes = unique(nodes);
      attrNodes = unique(attrNodes);
      return Components.forEach(function(C) {
        var els;
        els = [];
        nodes.forEach(function(node) {
          return els = els.concat(findAll(C.root, node));
        });
        unique(els).forEach(function(el) {
          if (matches(el, disAutoSelector)) {
            return;
          }
          if (document.contains(el)) {
            return C.create(el);
          } else {
            return C.destroy(el);
          }
        });
        return attrNodes.forEach(function(el) {
          if (matches(el, disAutoSelector)) {
            return;
          }
          if (matches(el, C.root)) {
            return C.create(el);
          } else if (C.instances[el[expando]]) {
            return C.destroy(el);
          }
        });
      });
    });
    observer.observe(document, config);
    return _access(document, 'ComponentsAutomation', {
      Components: Components,
      watcher: observer
    });
  };

  autoable = function(selector) {
    return `${selector}:not(${disAutoSelector})`;
  };

  var print;

  print = function(msg, style) {
    if (Type.isString(msg)) {
      return console.log(`%c${msg}`, style);
    }
    return console.log(msg);
  };

  var print$1 = print;

  var active, factory, infoStyle, prvLabelStyle, pubLabelStyle;

  active = false;

  pubLabelStyle = 'color:#0085ff;font-weight:bold';

  prvLabelStyle = 'color:#f8427f;font-weight:bold';

  infoStyle = 'color:#383838;font-weight:bold';

  factory = function(style, label) {
    var log;
    return log = function() {
      var msg, time;
      if (!arguments.length) {
        return active;
      }
      if (arguments.length === 1 && Type.isBool(arguments[0])) {
        active = arguments[0];
        msg = `Luda log ${(active ? 'opened' : 'closed')}.`;
        return log(msg);
      }
      if (!active) {
        return;
      }
      time = Date.now();
      print$1(`\n\n\n${label}LOG ${guid$1()} ${time}`, style.label);
      return Array.from(arguments).forEach(function(arg) {
        return print$1(arg, style.info);
      });
    };
  };

  luda.extend('log', factory({
    info: infoStyle,
    label: pubLabelStyle
  }, ''));

  var log = factory({
    info: infoStyle,
    label: prvLabelStyle
  }, 'LUDA ');

  function eventPath(event) {
    if (event.composedPath) {
      return event.composedPath();
    } else if (event.path) {
      return event.path;
    } else {
      return [event.target].concat(pluck([event.target], 'parentNode', true));
    }
  }

  var LudaEvent;

  LudaEvent = class LudaEvent {
    constructor(event) {
      this.originalEvent = event;
    }

    isDefaultPrevented() {
      return this.originalEvent.defaultPrevented;
    }

    isPropagationStopped() {
      return !this.originalEvent.bubbles || this._propagationStopped;
    }

    isImmediatePropagationStopped() {
      return this._immediatePropagationStopped;
    }

    preventDefault() {
      return this.originalEvent.preventDefault();
    }

    stopPropagation() {
      this.originalEvent.stopPropagation();
      return this._propagationStopped = true;
    }

    stopImmediatePropagation() {
      this.originalEvent.stopImmediatePropagation();
      return this._immediatePropagationStopped = true;
    }

    eventPath() {
      return eventPath(this.originalEvent);
    }

  };

  function ludaEvent(event) {
    var ludaEvent;
    ludaEvent = new LudaEvent(event);
    return new Proxy(ludaEvent, {
      get: function(target, key) {
        if (key in target) {
          return target[key];
        } else {
          return target.originalEvent[key];
        }
      }
    });
  }

  function nMatches(definedNamespace, namespace) {
    return namespace.every(function(n) {
      return definedNamespace.includes(n);
    });
  }

  var Variables = {
    expando: 'event',
    focusEvents: {
      focus: 'focusin',
      blur: 'focusout'
    },
    hoverEvents: {
      mouseenter: 'mouseover',
      mouseleave: 'mouseout'
    },
    swipeEvents: {
      left: 'swipeleft',
      right: 'swiperight',
      up: 'swipeup',
      down: 'swipedown'
    },
    swipeDistance: 10,
    keyCodes: {
      enter: 13,
      tab: 9,
      ctrl: 17,
      alt: 18,
      shift: 16,
      esc: 27,
      back: 8,
      space: 32,
      cap: 20,
      up: 38,
      down: 40,
      left: 37,
      right: 39,
      del: 46,
      end: 35,
      home: 36,
      ins: 45,
      pgUp: 33,
      pgDown: 34
    }
  };

  function parseEventName(name) {
    var keysRe, preventRe, stopRe;
    stopRe = /(&stop)+/ig;
    preventRe = /(&prevent)+/ig;
    keysRe = new RegExp(`@(${Object.keys(Variables.keyCodes).join('|')})`, 'g');
    return splitValues(name).map(function(n) {
      var evtName, keyCodes, matchedKeys, preventDefault, splited, stopPropagation, type;
      stopPropagation = stopRe.test(n);
      preventDefault = preventRe.test(n);
      splited = n.replace(stopRe, '').replace(preventRe, '').replace(keysRe, '').split('.');
      evtName = splited[0];
      type = Variables.focusEvents[evtName] || Variables.hoverEvents[evtName] || evtName;
      keyCodes = [];
      matchedKeys = n.match(keysRe);
      matchedKeys && matchedKeys.forEach(function(key) {
        var k, keyCode;
        k = key.replace(/@/g, '');
        if (keyCode = Variables.keyCodes[k]) {
          return keyCodes.push(keyCode);
        }
      });
      return {
        type: type,
        stop: stopPropagation,
        prevent: preventDefault,
        namespace: splited.slice(1),
        key: keyCodes
      };
    });
  }

  luda.include({
    trigger: function(name, detail, afterTrigger) {
      var handledEvts;
      if (afterTrigger && !Type.isFunction(afterTrigger)) {
        handledEvts = [];
      }
      this.els.forEach(function(el) {
        var events;
        if (Type.isString(name)) {
          events = parseEventName(name).map(function(evt) {
            var event;
            event = new CustomEvent(evt.type, {
              bubbles: true,
              cancelable: true,
              composed: true,
              detail: detail
            });
            event.namespace = evt.namespace;
            return event;
          });
        } else {
          events = Type.isArray(name) ? name : [name];
        }
        return events.forEach(function(e) {
          var isFocusEvent;
          e.ludaEvent = ludaEvent(e);
          isFocusEvent = Object.values(Variables.focusEvents).includes(e.type);
          if (isFocusEvent && Type.isFunction(el[e.type])) {
            el[e.type]();
          } else {
            el.dispatchEvent(e);
          }
          if (Type.isFunction(afterTrigger)) {
            return afterTrigger(e.ludaEvent, e.ludaEvent.detail, el);
          } else if (afterTrigger) {
            return handledEvts.push(e.ludaEvent);
          }
        });
      });
      return handledEvts || this;
    }
  });

  var createEvent, startX, startY, touchMoveHandler, touchStartHandler, triggered;

  startX = startY = 0/0;

  triggered = false;

  touchStartHandler = function(e) {
    if (e.defaultPrevented) {
      return;
    }
    if (e.touches.length !== 1) {
      return;
    }
    startX = e.touches[0].screenX;
    startY = e.touches[0].screenY;
    return triggered = false;
  };

  touchMoveHandler = function(e) {
    var direction, endX, endY, xMoved, yMoved;
    if (e.defaultPrevented) {
      return;
    }
    if (e.touches.length !== 1) {
      return;
    }
    if (triggered) {
      return;
    }
    endX = e.touches[0].screenX;
    xMoved = endX - startX;
    if (Math.abs(xMoved) >= Variables.swipeDistance) {
      triggered = true;
      direction = xMoved > 0 ? 'right' : 'left';
      return luda(e.target).trigger(createEvent(direction, startX, endX, xMoved));
    }
    endY = e.touches[0].screenY;
    yMoved = endY - startY;
    if (Math.abs(yMoved) >= Variables.swipeDistance) {
      triggered = true;
      direction = yMoved > 0 ? 'down' : 'up';
      return luda(e.target).trigger(createEvent(direction, startY, endY, yMoved));
    }
  };

  createEvent = function(direction, start, end, moved) {
    var event;
    event = new CustomEvent(Variables.swipeEvents[direction], {
      bubbles: true,
      cancelable: true,
      composed: true
    });
    event.start = start;
    event.end = end;
    event.distance = Math.abs(moved);
    return event;
  };

  var swipeEvent = {
    add: function(el) {
      el.addEventListener('touchstart', touchStartHandler);
      return el.addEventListener('touchmove', touchMoveHandler);
    },
    remove: function(el) {
      el.removeEventListener('touchstart', touchStartHandler);
      return el.removeEventListener('touchmove', touchMoveHandler);
    }
  };

  var removeEvent;

  var removeEvent$1 = removeEvent = function(el, type, selector, callback, namespace) {
    var evtCache, length, swipeTypes, typeCache;
    evtCache = _access(el, Variables.expando);
    if (!evtCache) {
      return;
    }
    if (!type) {
      for (type in evtCache) {
        typeCache = evtCache[type];
        removeEvent(el, type, selector, callback, namespace);
      }
    } else if (type !== 'handler' && (typeCache = evtCache[type])) {
      typeCache.quene || (typeCache.quene = []);
      typeCache.quene = typeCache.quene.filter(function(item) {
        if (callback && callback !== item.callback) {
          return true;
        }
        if (selector && selector !== item.selector) {
          return true;
        }
        if (namespace && !nMatches(item.namespace, namespace)) {
          return true;
        }
      });
      if (!typeCache.quene.length && typeCache.binded && evtCache.handler) {
        el.removeEventListener(type, evtCache.handler);
        delete evtCache[type];
      }
      swipeTypes = Object.values(Variables.swipeEvents);
      if (swipeTypes.includes(type) && swipeTypes.every(function(t) {
        return !evtCache[t];
      })) {
        swipeEvent.remove(el);
      }
    }
    length = Object.keys(evtCache).length;
    if (!length || (length === 1 && 'handler' in evtCache)) {
      return _access(el, Variables.expando, null);
    }
  };

  var addEvent;

  addEvent = function(el, type, selector, callback, namespace, kc, stop, prevent, _one) {
    var evtCache, expando, handler, quene, swipeBinded, swipeTypes, typeCache;
    if (type === 'handler') {
      throw new Error('handler cannot be used as event type');
    }
    expando = Variables.expando;
    evtCache = _access(el, expando) || _access(el, expando, {});
    typeCache = evtCache[type] || (evtCache[type] = {});
    quene = typeCache.quene || (typeCache.quene = []);
    quene.push({
      selector: selector,
      callback: callback,
      namespace: namespace,
      key: kc,
      stop: stop,
      prevent: prevent,
      one: _one
    });
    handler = evtCache.handler || (evtCache.handler = function(event) {
      var cached, collection, eType, self;
      self = this;
      cached = _access(self, Variables.expando);
      eType = event.type;
      if (!(cached && cached[eType])) {
        return;
      }
      collection = eventPath(event);
      collection = collection.slice(0, collection.indexOf(self) + 1);
      event = event.ludaEvent || ludaEvent(event);
      // simulate event bubble behaviors
      // to make sure quene callbacks triggered from event.target to self
      return collection.every(function(node) {
        cached[eType].quene.every(function(it) {
          var returnValue;
          if (((selector = it.selector) && matches(node, selector)) || (!it.selector && node === self)) {
            if (event.namespace && !nMatches(it.namespace, event.namespace)) {
              return true;
            }
            if (event.keyCode && it.key.length && !it.key.includes(event.keyCode)) {
              return true;
            }
            event.currentTarget = node;
            returnValue = it.callback.call(node, event, event.detail);
            if (it.one) {
              removeEvent$1(self, eType, it.selector, it.callback, it.namespace);
            }
            if (it.stop || returnValue === false) {
              event.stopPropagation();
            }
            if (it.prevent || returnValue === false) {
              event.preventDefault();
            }
          }
          // make sure callbacks in front called but callbacks behind not called
          // if immediate propagation called
          return !event.isImmediatePropagationStopped();
        });
        // make sure same level callbacks called
        // but parents level callbacks not called if propagation stoped
        return !event.isPropagationStopped();
      });
    });
    swipeTypes = Object.values(Variables.swipeEvents);
    if (swipeTypes.includes(type)) {
      swipeBinded = swipeTypes.some(function(type) {
        var ref;
        return (ref = evtCache[type]) != null ? ref.binded : void 0;
      });
      if (!swipeBinded) {
        swipeEvent.add(el);
      }
    }
    if (!typeCache.binded) {
      typeCache.binded = true;
      return el.addEventListener(type, handler);
    }
  };

  var addEvent$1 = addEvent;

  luda.include({
    on: function(name, selector, callback, _one) {
      var key, keyCallback, self;
      self = this;
      if (!Type.isString(name)) {
        for (key in name) {
          keyCallback = name[key];
          this.on(key, selector, keyCallback);
        }
        return this;
      }
      if (Type.isFunction(selector)) {
        callback = selector;
        selector = '';
      }
      parseEventName(name).forEach(function(option) {
        return self.els.forEach(function(el) {
          return addEvent$1(el, option.type, selector, callback, option.namespace, option.key, option.stop, option.prevent, _one);
        });
      });
      return this;
    }
  });

  luda.include({
    off: function(name, selector, callback) {
      var self;
      self = this;
      if (name === void 0) {
        this.els.forEach(function(el) {
          return removeEvent$1(el);
        });
        return this;
      }
      if (Type.isFunction(selector)) {
        callback = selector;
        selector = '';
      }
      parseEventName(name).forEach(function(option) {
        return self.els.forEach(function(el) {
          return removeEvent$1(el, option.type, selector, callback, option.namespace);
        });
      });
      return this;
    }
  });

  var addEvents, findRoot, isntPropagation, namespace, removeEvents;

  namespace = function(C) {
    return `.${C.id}`;
  };

  findRoot = function(C, event) {
    var rootEl;
    if (Type.isDocument(C.root)) {
      return C.root;
    }
    rootEl = null;
    event.eventPath().some(function(el) {
      if (!matches(el, C.root)) {
        return;
      }
      return rootEl = el;
    });
    return rootEl;
  };

  isntPropagation = function(C, event, rootEl) {
    if (Type.isDocument(C.root)) {
      return true;
    }
    if (event.currentTarget === rootEl) {
      return true;
    }
    return luda(event.currentTarget).parent(C.root).els[0] === rootEl;
  };

  addEvents = function(C) {
    var events;
    events = C.helpers.listen.call(C.prototype);
    return events.forEach(function(evt) {
      var callbacks, evtSelector, name, selector;
      if (!evt[0]) {
        return;
      }
      name = `${evt[0]}${namespace(C)}`;
      selector = Type.isFunction(evt[1]) ? '' : evt[1];
      callbacks = Type.isFunction(evt[1]) ? evt.slice(1) : evt.slice(2);
      evtSelector = selector;
      return callbacks.forEach(function(callback) {
        var handler;
        if (!Type.isFunction(callback)) {
          return;
        }
        if (Object.values(C.prototype).includes(callback)) {
          if (Type.isString(C.root) && selector.replace(C.root, '') === selector) {
            evtSelector = selector ? `${C.root} ${selector}` : C.root;
          }
          handler = function(event, data) {
            var rootEl;
            if (!(rootEl = findRoot(C, event))) {
              return;
            }
            if (!isntPropagation(C, event, rootEl)) {
              return;
            }
            return callback.call(C.create(rootEl)[0], event, data);
          };
        } else {
          handler = function(event, data) {
            return callback.call(this, event, data);
          };
        }
        return luda(document).on(name, evtSelector, handler);
      });
    });
  };

  removeEvents = function(C) {
    return luda(document).off(namespace(C));
  };

  luda.include({
    parents: function(comparator) {
      return luda(collect(unique(pluck(this.els, 'parentElement', true)), comparator));
    }
  });

  function unnested(instance, els) {
    var rootEl, rootSelector;
    rootEl = instance.root.els[0];
    rootSelector = instance.constructor.root;
    return els.filter(function(el) {
      var rootParent;
      if (el === rootEl) {
        return true;
      }
      if (matches(el, rootSelector)) {
        return false;
      }
      rootParent = luda(el).parent(rootSelector).els[0];
      if (document.contains(el)) {
        return rootParent === rootEl;
      } else {
        return !rootParent;
      }
    });
  }

  var addTraversal, cleanTraversal, createGetter;

  createGetter = function(C, name, selector, nestable, cacheable) {
    return Object.defineProperty(C.prototype, name, {
      get: function() {
        var cache, collection, matched, rootEl;
        if (!selector) {
          return luda();
        }
        if (selector instanceof Luda) {
          return selector;
        }
        if (Type.isFunction(selector)) {
          return selector.call(this);
        }
        if (!Type.isString(selector)) {
          return luda(selector);
        }
        if (!(rootEl = this.root.els[0])) {
          return luda();
        }
        cacheable && (cache = C.instances[this.id].traversal);
        if (cache && name in cache) {
          return cache[name];
        }
        matched = luda(selector, rootEl).els;
        !nestable && (matched = unnested(this, matched));
        collection = luda(unique(matched));
        if (!cache) {
          return collection;
        }
        if (collection.length) {
          return cache[name] = collection;
        } else {
          return collection;
        }
      }
    });
  };

  addTraversal = function(C) {
    var cacheable, msg, name, nestable, selector, traversals;
    traversals = C.helpers.find.call(C.prototype);
    nestable = Type.isDocument(C.root);
    cacheable = Type.isString(C.root);
    for (name in traversals) {
      selector = traversals[name];
      if (name in C.prototype) {
        msg = `'${name}' was defined on prototype`;
        msg = `${msg}, skip adding traversal getter.`;
        console.warn(msg);
      } else {
        createGetter(C, name, selector, nestable, cacheable);
      }
    }
    return cacheable && (C.prototype.cleanTraversal = function(name) {
      var cached, traversal;
      if (!(cached = this.constructor.instances[this.id])) {
        return;
      }
      if (!(traversal = cached.traversal)) {
        return;
      }
      return cleanTraversal(traversal, name);
    });
  };

  cleanTraversal = function(cache, name) {
    var names;
    if (!cache) {
      return;
    }
    if (!Type.isString(name)) {
      name = '';
    }
    names = name ? splitValues(name) : Object.keys(cache);
    return names.forEach(function(n) {
      return delete cache[n];
    });
  };

  var config$1, createObserver, cur, executeMutations, findSameMutation, nodesEqual, runAttrCallbacks, runDomCallbacks, stopWatch, watch;

  config$1 = {
    childList: true,
    subtree: true,
    attributes: true,
    attributeOldValue: true
  };

  cur = function(ins, callback, target) {
    var isInProto, proto;
    proto = ins.constructor.prototype;
    isInProto = Object.values(proto).includes(callback);
    if (isInProto) {
      return ins;
    } else {
      return target;
    }
  };

  runDomCallbacks = function(type, mutation, watches, nestable) {
    var C, ins, mu, nodes;
    ins = mutation.ins;
    C = ins.constructor;
    mu = mutation.mu;
    nodes = Array.from(mu[`${type}Nodes`]);
    return watches.dom.forEach(function(dom) {
      var els;
      els = [];
      nodes.forEach(function(n) {
        return els = els.concat(findAll(dom.selector, n));
      });
      if (!els.length) {
        return;
      }
      !nestable && (els = unnested(ins, unique(els)));
      return els.length && dom.callbacks.forEach(function(callback) {
        var ctx;
        ctx = cur(ins, callback, els);
        if (callback !== C.prototype.cleanTraversal) {
          log(`${C.id} ID: ${ins.id} executes nodes ${type} callback.`, 'Root element', ins.root.els[0], 'Cache', C.instances[ins.id], `Nodes ${type}`, els, `Callback ${callback.name || ''}`, callback, 'Context', ctx, 'Arguments', [els, type]);
        }
        return callback.call(ctx, els, type);
      });
    });
  };

  runAttrCallbacks = function(mutation, watches, nestable) {
    var C, ins, mu, name, oldVal, target;
    ins = mutation.ins;
    mu = mutation.mu;
    C = ins.constructor;
    name = mu.attributeName;
    target = mu.target;
    oldVal = mu.oldValue;
    return name && watches.attr.forEach(function(attr) {
      if (name !== attr.name) {
        return;
      }
      if (!matches(target, attr.selector)) {
        return;
      }
      if (!nestable && !unnested(ins, [target]).length) {
        return;
      }
      return attr.callbacks.forEach(function(callback) {
        var ctx;
        ctx = cur(ins, callback, target);
        log(`${C.id} ID: ${ins.id} executes ${name} changed callback.`, 'Root element', ins.root.els[0], 'Cache', C.instances[ins.id], 'Changed target', target, `Callback ${callback.name || ''}`, callback, 'Context', ctx, 'Arguments', [target, oldVal]);
        return callback.call(ctx, target, oldVal);
      });
    });
  };

  executeMutations = function(C, mutations, nestable) {
    return mutations.forEach(function(mutation) {
      runDomCallbacks('added', mutation, C.watches, nestable);
      runDomCallbacks('removed', mutation, C.watches, nestable);
      return runAttrCallbacks(mutation, C.watches, nestable);
    });
  };

  nodesEqual = function(nodesOne, nodesTwo) {
    var itemsOne, itemsTwo;
    if (nodesOne.length !== nodesTwo.length) {
      return false;
    }
    if (nodesOne.length === 0 && nodesTwo.length === 0) {
      return true;
    }
    itemsOne = Array.from(nodesOne);
    itemsTwo = Array.from(nodesTwo);
    return !itemsOne.some(function(node, index) {
      return node !== itemsTwo[index];
    });
  };

  findSameMutation = function(mutations, mu) {
    var theSameMutation;
    theSameMutation = null;
    mutations.some(function(mutation) {
      if (mu === mutation.mu) {
        return theSameMutation = mutation;
      }
      if (mu.type !== mutation.mu.type) {
        return;
      }
      if (mu.target !== mutation.mu.target) {
        return;
      }
      if (mu.attributeName !== mutation.mu.attributeName) {
        return;
      }
      if (mu.oldValue !== mutation.mu.oldValue) {
        return;
      }
      if (!nodesEqual(mu.addedNodes, mutation.mu.addedNodes)) {
        return;
      }
      if (!nodesEqual(mu.removedNodes, mutation.mu.removedNodes)) {
        return;
      }
      return theSameMutation = mutation;
    });
    return theSameMutation;
  };

  createObserver = function(C, instance) {
    var inses, nestable, observer, rootEl;
    inses = C.instances;
    rootEl = instance.root.els[0];
    nestable = Type.isDocument(C.root);
    observer = new MutationObserver(function(mus) {
      var mutations;
      mutations = mus.map(function(mu) {
        return {
          ins: instance,
          mu: mu
        };
      });
      !nestable && find(C.root, rootEl).forEach(function(el) {
        var cached, ins, watcher;
        if (!(cached = inses[el[expando]])) {
          return;
        }
        if (!(ins = cached.instance)) {
          return;
        }
        if (!(watcher = cached.watcher)) {
          return;
        }
        return watcher.takeRecords().forEach(function(mu) {
          var nestedMutation;
          nestedMutation = findSameMutation(mutations, mu);
          if (nestedMutation) {
            return nestedMutation.ins = ins;
          }
        });
      });
      return executeMutations(C, mutations, nestable);
    });
    observer.observe(rootEl, config$1);
    return observer;
  };

  watch = function(C, ins) {
    var conf;
    if (!C.watches) {
      conf = C.helpers.watch.call(C.prototype);
      C.watches = {
        dom: (conf.dom || []).map(function(d) {
          return {
            selector: Type.isFunction(d[0]) ? '*' : d[0],
            callbacks: Type.isFunction(d[0]) ? d : d.slice(1)
          };
        }),
        attr: (conf.attr || []).map(function(a) {
          return {
            name: a[0],
            selector: Type.isFunction(a[1]) ? '*' : a[1],
            callbacks: Type.isFunction(a[1]) ? a.slice(1) : a.slice(2)
          };
        })
      };
    }
    return createObserver(C, ins);
  };

  stopWatch = function(ins, watcher) {
    return watcher.disconnect();
  };

  var Base;

  Base = (function() {
    class Base {
      constructor(root) {
        var C, create, definedWatch, find, inses, listen, proto, rootEl, traversal, watcher;
        C = this.constructor;
        proto = C.prototype;
        inses = C.instances;
        if (!(Type.isString(C.root) || Type.isDocument(C.root))) {
          throw new Error('Component root can only be selectors or document');
        }
        if (root instanceof C) {
          return root;
        }
        if (Type.isDocument(C.root)) {
          root = C.root;
        }
        this.root = luda(root);
        if (!(rootEl = this.root.els[0])) {
          return;
        }
        if (this.root.length > 1) {
          this.root = luda(rootEl);
        }
        this.id = rootEl[expando] || (rootEl[expando] = guid$1());
        if (this.id in inses) {
          return inses[this.id].instance;
        }
        if ((listen = C.helpers.listen) && !C.eventsBinded) {
          addEvents(C);
          C.eventsBinded = true;
        }
        if ((find = C.helpers.find) && !C.traversalAdded) {
          addTraversal(C);
          C.traversalAdded = true;
        }
        if (proto.cleanTraversal) {
          traversal = {};
        }
        if (traversal && !C.watches) {
          if (definedWatch = C.helpers.watch) {
            C.helpers.watch = function() {
              var watches;
              watches = definedWatch.call(this);
              watches.dom || (watches.dom = []);
              watches.dom.unshift([proto.cleanTraversal]);
              return watches;
            };
          } else {
            C.helpers.watch = function() {
              return {
                dom: [[proto.cleanTraversal]]
              };
            };
          }
        }
        if (C.helpers.watch) {
          watcher = watch(C, this);
        }
        inses[this.id] = {
          instance: this,
          traversal: traversal,
          watcher: watcher
        };
        _access(rootEl, C.id, inses[this.id]);
        if (create = C.helpers.create) {
          create.call(this);
        }
        log(`${C.id} ID: ${this.id} created.`, 'Root element', rootEl, 'Cache', inses[this.id]);
      }

      static create(selector, ctx) {
        var C;
        C = this;
        if (Type.isDocument(this.root) || !selector) {
          selector = this.root;
        }
        return luda(selector, ctx).els.map(function(el) {
          return new C(el);
        });
      }

      static destroy(selector, ctx) {
        var C, hasInstances, inses;
        C = this;
        inses = this.instances;
        if (Type.isDocument(this.root) || !selector) {
          selector = this.root;
        }
        luda(selector, ctx).els.forEach(function(rootEl) {
          var destroy, id, instance, watcher;
          if (!(id = rootEl[expando])) {
            return;
          }
          if (!(id in inses)) {
            return;
          }
          instance = inses[id].instance;
          watcher = inses[id].watcher;
          if (destroy = C.helpers.destroy) {
            destroy.call(instance);
          }
          if (watcher) {
            stopWatch(instance, watcher);
          }
          delete inses[id];
          _access(rootEl, C.id, null);
          return log(`${C.id} ID: ${id} destroied.`, 'Root element', rootEl, 'Cache', inses[id]);
        });
        hasInstances = Object.keys(inses).length;
        if (!hasInstances && C.eventsBinded) {
          removeEvents(C);
          C.eventsBinded = false;
        }
        return this;
      }

      static help(key, val) {
        this.help = createMounter(this.helpers, 'helping');
        return this.help(key, val);
      }

      static include(key, val) {
        var C, fn;
        C = this;
        fn = function(name, value) {
          C.included.push(name);
          return value;
        };
        this.include = createMounter(this.prototype, 'including', fn);
        return this.include(key, val);
      }

      static protect(key, val) {
        this.protect = createMounter(this.prototype, 'protecting');
        return this.protect(key, val);
      }

      static contains(selector, ctx) {
        var inses;
        inses = this.instances;
        return luda(selector, ctx).els.some(function(el) {
          var id;
          return (id = el[expando]) && inses[id];
        });
      }

      static each(callback) {
        Object.values(this.instances).some(function(cache, index) {
          var instance, rootEl;
          instance = cache.instance;
          rootEl = instance.root.els[0];
          return callback(instance, rootEl, index, cache) === false;
        });
        return this;
      }

    }
    Base.prototype.win = luda(window);

    Base.prototype.doc = luda(document);

    Object.defineProperty(Base.prototype, 'html', {
      get: function() {
        return luda(document.documentElement);
      }
    });

    Object.defineProperty(Base.prototype, 'body', {
      get: function() {
        return luda(document.body);
      }
    });

    Object.defineProperty(Base.prototype, 'con', {
      get: function() {
        return this.constructor;
      }
    });

    return Base;

  }).call(this);

  var Base$1 = Base;

  var constructorAccessWarn, createComponentProxy, createInstancesCallProxy, createInstancesProxy, instanceAccessWarn;

  constructorAccessWarn = function(action, C, key) {
    var msg;
    if (!(key in C && !C.extended.includes(key))) {
      return;
    }
    msg = `${action} private property '${key}' of ${C.id}`;
    return console.warn(msg);
  };

  createComponentProxy = function(C) {
    var proxy;
    return proxy = new Proxy(C, {
      get: function(target, key) {
        constructorAccessWarn('Getting', C, key);
        return C[key];
      },
      set: function(target, key, val) {
        constructorAccessWarn('Setting', C, key);
        return C[key] = val;
      },
      apply: function(target, ctx, args) {
        var inses;
        inses = C.create.apply(C, args);
        return createInstancesProxy(inses);
      }
    });
  };

  instanceAccessWarn = function(action, ins, key) {
    var msg;
    if (!(key in ins && !ins.con.included.includes(key))) {
      return;
    }
    msg = `${action} private property '${key}' of ${ins.con.id} ${ins.id}`;
    return console.warn(msg);
  };

  createInstancesProxy = function(inses) {
    var proxy;
    return proxy = new Proxy(inses, {
      set: function(target, key, val) {
        return inses.map(function(ins) {
          instanceAccessWarn('Setting', ins, key);
          return ins[key] = val;
        });
      },
      get: function(target, key) {
        var vals;
        vals = inses.map(function(ins) {
          instanceAccessWarn('Getting', ins, key);
          return ins[key];
        });
        return createInstancesCallProxy(inses, vals, key, proxy);
      }
    });
  };

  createInstancesCallProxy = function(inses, vals, key, instancesProxy) {
    var proxy;
    return proxy = new Proxy(new Function(), {
      get: function(target, k) {
        if (!Type.isFunction(vals[k])) {
          return vals[k];
        }
        return vals[k].bind(vals);
      },
      apply: function(target, ctx, args) {
        var option, returns;
        returns = inses.map(function(ins) {
          return ins[key].apply(ins, args);
        });
        option = args[args.length - 1];
        if (Type.isObject(option) && option.chain === false) {
          return returns;
        } else {
          return instancesProxy;
        }
      }
    });
  };

  function createProxy(Component) {
    return createComponentProxy(Component);
  }

  var factory$1;

  luda.extend('component', factory$1 = function(name, root) {
    var Component;
    Component = (function() {
      class Component extends Base$1 {}
      Component.id = camelCase(`Component${(name ? '-' + name : '_' + guid$1())}`);

      Component.root = root ? root : name ? `.${dashCase(name)}` : document;

      Component.instances = {};

      Component.helpers = {};

      Component.included = ['toString'];

      Component.extended = ['toString'];

      Component.eventsBinded = false;

      Component.autoEnabled = false;

      Component.traversalAdded = false;

      Component.watches = null;

      return Component;

    }).call(this);
    if (name) {
      luda.extend(name, createProxy(Component));
    }
    luda.ready(function() {
      if (Type.isDocument(Component.root)) {
        Component.create(Component.root);
      }
      if (!Type.isString(Component.root)) {
        return;
      }
      Component.create(autoable(Component.root));
      autoCreateAndDestroy(Component);
      return Component.autoEnabled = true;
    });
    return Component;
  });

  function computeStyle(el, prop, isVar) {
    var style;
    if (!Type.isElement(el) || !prop) {
      return;
    }
    style = window.getComputedStyle(el, null);
    if (prop) {
      if (isVar) {
        return style.getPropertyValue(prop) || void 0;
      } else {
        return style[prop];
      }
    } else {
      return style;
    }
  }

  function isVariable(prop) {
    return /^--/.test(prop);
  }

  function readProp(prop, isVar) {
    if (isVar === void 0) {
      isVar = isVariable(prop);
    }
    if (isVar) {
      return prop;
    } else {
      return camelCase(prop);
    }
  }

  var numericProps;

  numericProps = ['animationIterationCount', 'columnCount', 'flexGrow', 'flexShrink', 'fontWeight', 'lineHeight', 'opacity', 'order', 'orphans', 'widows', 'zIndex'];

  function parseValue$1(prop, value, isVar) {
    if (isVar === void 0) {
      isVar = isVariable(prop);
    }
    if (isVar || numericProps.includes(prop)) {
      return value;
    }
    if (Type.isNumeric(value)) {
      return `${value}px`;
    } else {
      return value;
    }
  }

  luda.include({
    css: function(prop, value) {
      var isVar, key, val;
      if (Type.isString(prop)) {
        isVar = isVariable(prop);
        prop = readProp(prop, isVar);
        if (arguments.length < 2) {
          return this.els[0] && computeStyle(this.els[0], prop, isVar);
        }
        if (!prop) {
          return this;
        }
        value = parseValue$1(prop, value, isVar);
        this.els.forEach(function(el) {
          if (!Type.isElement(el)) {
            return;
          }
          if (isVar) {
            return el.style.setProperty(prop, value);
          } else {
            return el.style[prop] = value;
          }
        });
        return this;
      }
      for (key in prop) {
        val = prop[key];
        this.css(key, val);
      }
      return this;
    }
  });

  luda.include({
    removeCss: function(prop) {
      return this.css(prop, '');
    }
  });

  var parse$1, pattern$3;

  pattern$3 = /^data-/i;

  parse$1 = function(name) {
    return camelCase(name.replace(pattern$3, ''));
  };

  var parseName = parse$1;

  luda.include({
    removeData: function(name) {
      var names;
      if (arguments.length) {
        names = splitValues(name);
        if (!names.length) {
          return this;
        }
        names = names.map(function(n) {
          return parseName(n);
        });
        this.els.forEach(function(el) {
          return names.forEach(function(n) {
            return delete el.dataset[n];
          });
        });
      } else {
        this.els.forEach(function(el) {
          var n, ref, results, val;
          ref = el.dataset;
          results = [];
          for (n in ref) {
            val = ref[n];
            results.push(delete el.dataset[n]);
          }
          return results;
        });
      }
      return this;
    }
  });

  luda.include({
    data: function(name, value) {
      var datas, key, ref, val;
      if (!name) {
        if (!this.els[0]) {
          return;
        }
        datas = {};
        ref = this.els[0].dataset;
        for (key in ref) {
          val = ref[key];
          datas[key] = readValue(val);
        }
        return datas;
      }
      if (Type.isString(name)) {
        name = parseName(name);
        if (arguments.length >= 2) {
          if (value === void 0) {
            return this;
          }
          if (value === null) {
            return this.removeData(name);
          }
          val = parseValue(value);
          this.els.forEach(function(el) {
            return el.dataset[name] = val;
          });
          return this;
        }
        if (!this.els[0]) {
          return;
        }
        return readValue(this.els[0].dataset[name]);
      }
      for (key in name) {
        val = name[key];
        this.data(key, val);
      }
      return this;
    }
  });

  luda.include({
    hasData: function(key) {
      if (!key) {
        return false;
      }
      key = parseName(key);
      return this.els.some(function(el) {
        return el.dataset && key in el.dataset;
      });
    }
  });

  var factory$3;

  factory$3 = function(prop) {
    return function() {
      var el;
      if (!(el = this.els[0])) {
        return;
      }
      if (Type.isWindow(el)) {
        return window[`inner${prop}`];
      }
      return el[`client${prop}`];
    };
  };

  luda.include({
    innerWidth: factory$3('Width'),
    innerHeight: factory$3('Height')
  });

  function computeStyleInt(el, prop) {
    return parseInt(computeStyle(el, prop), 10) || 0;
  }

  function getExtraSpace(el, xAxis) {
    return computeStyleInt(el, `border${(xAxis ? 'Left' : 'Top')}Width`) + computeStyleInt(el, `padding${(xAxis ? 'Left' : 'Top')}`) + computeStyleInt(el, `padding${(xAxis ? 'Right' : 'Bottom')}`) + computeStyleInt(el, `border${(xAxis ? 'Right' : 'Bottom')}Width`);
  }

  var factory$4;

  factory$4 = function(prop) {
    return function(value) {
      var e, valNumber;
      if (!(e = this.els[0])) {
        if (value === void 0) {
          return void 0;
        } else {
          return this;
        }
      }
      if (!arguments.length) {
        if (Type.isWindow(e)) {
          return e[camelCase(`outer-${prop}`)];
        }
        return e.getBoundingClientRect()[prop] - getExtraSpace(e, prop === 'width');
      }
      valNumber = parseInt(value, 10);
      this.els.forEach(function(el) {
        var boxSizing, extra;
        if (!Type.isElement(el)) {
          return;
        }
        boxSizing = computeStyle(el, 'boxSizing');
        extra = 0;
        if (boxSizing === 'border-box') {
          extra = getExtraSpace(el, prop === 'width');
        }
        return el.style[prop] = parseValue$1(prop, valNumber + extra);
      });
      return this;
    };
  };

  luda.include({
    width: factory$4('width'),
    height: factory$4('height')
  });

  var factory$5;

  factory$5 = function(prop) {
    return function(includeMargins) {
      var el, marginOne, marginTwo, offsetSize;
      if (!(el = this.els[0])) {
        return;
      }
      if (Type.isWindow(el)) {
        return window[`outer${prop}`];
      }
      offsetSize = el[`offset${prop}`];
      if (!includeMargins) {
        return offsetSize;
      }
      marginOne = computeStyleInt(el, `margin${(prop === 'Width' ? 'Left' : 'Top')}`);
      marginTwo = computeStyleInt(el, `margin${(prop === 'Width' ? 'Right' : 'Bottom')}`);
      return offsetSize + marginOne + marginTwo;
    };
  };

  luda.include({
    outerWidth: factory$5('Width'),
    outerHeight: factory$5('Height')
  });

  luda.include({
    one: function(name, selector, callback) {
      return this.on(name, selector, callback, true);
    }
  });

  function getValue(el) {
    var val;
    if (el.multiple && el.options) {
      val = [];
      [].forEach.call(el.options, function(option) {
        var optionValue;
        if (option.selected && !option.disabled && !option.parentNode.disabled) {
          optionValue = readValue(option.value);
          if (optionValue === void 0 || optionValue === null) {
            optionValue = '';
          }
          return val.push(optionValue);
        }
      });
      return val;
    }
    val = readValue(el.value);
    if (val === void 0 || val === null) {
      return '';
    } else {
      return val;
    }
  }

  luda.include({
    val: function(value) {
      if (value === void 0) {
        return this.els[0] && getValue(this.els[0]);
      }
      this.els.forEach(function(el) {
        var val;
        if (el.tagName === 'SELECT') {
          if (Type.isArray(value)) {
            val = value;
          } else if (value === null) {
            val = [];
          } else {
            val = [value];
          }
          return [].forEach.call(el.options, function(option) {
            var selected;
            selected = val.includes(readValue(option.value));
            luda(option).attr('selected', selected ? '' : null);
            return option.selected = selected;
          });
        } else {
          val = value === null ? '' : parseValue(value);
          luda(el).attr('value', val);
          return el.value = val;
        }
      });
      return this;
    }
  });

  var Variables$1 = {
    scriptExpando: 'script'
  };

  function clone(el, cacheAndEvts, deep) {
    var cloned, clonedScripts, clones, nodes, scripts;
    cloned = el.cloneNode(true);
    // track script execute status,
    // no matter the cloned or the original script executed,
    // the other should not be executed again.
    scripts = findAll('script', el);
    clonedScripts = findAll('script', cloned);
    scripts.forEach(function(script, i) {
      var cache;
      if (!Type.isScript(script)) {
        return;
      }
      if (script.src) {
        return;
      }
      cache = _access(script, Variables$1.scriptExpando);
      cache || (cache = {
        executed: false
      });
      _access(script, Variables$1.scriptExpando, cache);
      return _access(clonedScripts[i], Variables$1.scriptExpando, cache);
    });
    if (!cacheAndEvts) {
      return cloned;
    }
    if (deep) {
      nodes = findAll('*', el);
      clones = findAll('*', cloned);
    } else {
      nodes = [el];
      clones = [cloned];
    }
    nodes.forEach(function(node, i) {
      var _evt, cache, config, type;
      // copy events for the cloned node
      // if the original node has events
      if (_evt = _access(node, Variables.expando)) {
        for (type in _evt) {
          config = _evt[type];
          config.quene && config.quene.forEach(function(it) {
            return addEvent$1(clones[i], type, it.selector, it.callback, it.namespace, it.key, it.stop, it.prevent, it._one);
          });
        }
      }
      if (cache = access(node)) {
        // copy pub cache if the original node has pub cache
        return access(clones[i], Object.assign({}, cache));
      }
    });
    return cloned;
  }

  luda.include({
    find: function(selector) {
      var all;
      all = [];
      this.els.forEach(function(el) {
        var found;
        found = find(selector, el);
        if (found.length) {
          return [].push.apply(all, found);
        }
      });
      return luda(unique(all));
    }
  });

  var CDATARe, geval;

  CDATARe = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;

  geval = eval;

  function evalScripts(node) {
    var collection, scripts;
    collection = luda(node);
    scripts = collection.filter('script').add(collection.find('script')).els;
    return scripts.forEach(function(el) {
      var scriptCache;
      if (!(!el.src && Type.isScript(el))) {
        return;
      }
      if (!el.ownerDocument.documentElement.contains(el)) {
        return;
      }
      scriptCache = _access(el, Variables$1.scriptExpando);
      if (scriptCache && scriptCache.executed) {
        return;
      }
      geval(el.textContent.replace(CDATARe, ''));
      if (scriptCache) {
        return scriptCache.executed = true;
      } else {
        return _access(el, Variables$1.scriptExpando, {
          executed: true
        });
      }
    });
  }

  function insertElement(anchor, child, prepend, prependTarget) {
    if (prepend) {
      anchor.insertBefore(child, prependTarget);
    } else {
      anchor.appendChild(child);
    }
    return evalScripts(child);
  }

  luda.include({
    insertAfter: function(selector) {
      var els;
      els = this.els;
      luda(selector).els.forEach(function(target, index) {
        var parent;
        parent = target.parentNode;
        return parent && els.forEach(function(child) {
          var childToBeInserted;
          childToBeInserted = index ? clone(child, true, true) : child;
          return insertElement(parent, childToBeInserted, true, target.nextSibling);
        });
      });
      return this;
    }
  });

  luda.include({
    after: function() {
      var argReverse, handler, self;
      self = this;
      argReverse = [].reverse.apply(arguments);
      handler = function(selector) {
        var els;
        els = luda(selector).els.slice().reverse();
        return luda(els).insertAfter(self);
      };
      [].forEach.call(argReverse, handler);
      return this;
    }
  });

  function insertContent(parent, child, prepend) {
    return parent.forEach(function(p, parentIndex) {
      return child.forEach(function(c) {
        var childToBeInserted;
        childToBeInserted = parentIndex ? clone(c, true, true) : c;
        return insertElement(p, childToBeInserted, prepend, prepend && p.firstChild);
      });
    });
  }

  luda.include({
    appendTo: function(selector) {
      insertContent(luda(selector).els, this.els);
      return this;
    }
  });

  luda.include({
    append: function() {
      var els, handler;
      els = this.els;
      handler = function(selector) {
        return insertContent(els, luda(selector).els);
      };
      [].forEach.call(arguments, handler);
      return this;
    }
  });

  luda.include({
    insertBefore: function(selector) {
      var els;
      els = this.els;
      luda(selector).els.forEach(function(target, index) {
        var parent;
        parent = target.parentNode;
        return parent && els.forEach(function(child) {
          var childToBeInserted;
          childToBeInserted = index ? clone(child, true, true) : child;
          return insertElement(parent, childToBeInserted, true, target);
        });
      });
      return this;
    }
  });

  luda.include({
    before: function() {
      var handler, self;
      self = this;
      handler = function(selector) {
        return luda(selector).insertBefore(self);
      };
      [].forEach.call(arguments, handler);
      return this;
    }
  });

  luda.include({
    clone: function(cacheAndEvents, deep) {
      var collection;
      if (deep === void 0) {
        deep = cacheAndEvents;
      }
      collection = this.els.map(function(el) {
        return clone(el, cacheAndEvents, deep);
      });
      return luda(collection);
    }
  });

  luda.include({
    detach: function() {
      this.els.forEach(function(el) {
        var parent;
        if (parent = el.parentNode) {
          return parent.removeChild(el);
        }
      });
      return this;
    }
  });

  function clean$1(ctx) {
    return findAll('*', ctx).forEach(function(el) {
      removeEvent$1(el);
      return clean(el);
    });
  }

  luda.include({
    empty: function() {
      this.els.forEach(function(el) {
        var child, i, len, ref;
        ref = el.children;
        for (i = 0, len = ref.length; i < len; i++) {
          child = ref[i];
          clean$1(child);
        }
        return el.textContent = '';
      });
      return this;
    }
  });

  luda.include({
    html: function(html) {
      if (html === void 0 && this.els.length) {
        return this.els[0].innerHTML;
      }
      this.els.forEach(function(el) {
        var child, i, len, ref;
        ref = el.children;
        for (i = 0, len = ref.length; i < len; i++) {
          child = ref[i];
          clean$1(child);
        }
        return el.innerHTML = html;
      });
      return this;
    }
  });

  luda.include({
    prependTo: function(selector) {
      insertContent(luda(selector).els, this.els.reverse(), true);
      return this;
    }
  });

  luda.include({
    prepend: function() {
      var els, handler;
      els = this.els;
      handler = function(selector) {
        return insertContent(els, luda(selector).els, true);
      };
      [].forEach.call(arguments, handler);
      return this;
    }
  });

  luda.include({
    remove: function() {
      this.els.forEach(function(el) {
        var parent;
        clean$1(el);
        if (parent = el.parentNode) {
          return parent.removeChild(el);
        }
      });
      return this;
    }
  });

  luda.include({
    replaceWith: function(selector) {
      return this.before(selector).remove();
    }
  });

  luda.include({
    replaceAll: function(selector) {
      luda(selector).replaceWith(this);
      return this;
    }
  });

  luda.include({
    text: function(text) {
      if (text === void 0) {
        if (this.els[0]) {
          return this.els[0].textContent;
        } else {
          return '';
        }
      }
      this.els.forEach(function(el) {
        var child, i, len, ref;
        ref = el.children;
        for (i = 0, len = ref.length; i < len; i++) {
          child = ref[i];
          clean$1(child);
        }
        return el.textContent = text;
      });
      return this;
    }
  });

  luda.include({
    unwrap: function() {
      this.parent().els.forEach(function(el) {
        var collection;
        collection = luda(el);
        return collection.replaceWith(collection.children());
      });
      return this;
    }
  });

  luda.include({
    wrapAll: function(selector) {
      var structure, wrapper;
      if (!this.els.length) {
        return this;
      }
      structure = luda(selector);
      this.first().before(structure);
      wrapper = structure.els[0];
      while (wrapper.children.length) {
        wrapper = wrapper.firstElementChild;
      }
      return this.appendTo(wrapper);
    }
  });

  luda.include({
    contents: function() {
      var all;
      all = [];
      this.els.forEach(function(el) {
        var content;
        if (el.tagName === 'IFRAME') {
          content = [el.contentDocument];
        } else {
          content = el.childNodes;
        }
        return [].push.apply(all, content);
      });
      return luda(unique(all));
    }
  });

  luda.include({
    wrapInner: function(selector) {
      this.els.forEach(function(el) {
        var contents, target;
        target = luda(el);
        contents = target.contents();
        if (contents.els.length) {
          return contents.wrapAll(selector);
        } else {
          return target.append(selector);
        }
      });
      return this;
    }
  });

  luda.include({
    wrap: function(selector) {
      this.els.forEach(function(el, index) {
        var wrapper;
        wrapper = luda(selector).els[0];
        return luda(el).wrapAll(index ? clone(wrapper, true, true) : wrapper);
      });
      return this;
    }
  });

  luda.include({
    matches: function(selector) {
      if (!this.els.length) {
        return false;
      }
      if (!selector) {
        return false;
      }
      return this.els.some(function(el) {
        return matches(el, selector);
      });
    }
  });

  var Mixin;

  var Mixin$1 = Mixin = class Mixin {
    constructor(conf) {
      this.conf = conf;
    }

    get(key) {
      return this.conf[key];
    }

    all() {
      return Object.assign({}, this.conf);
    }

    only(keys) {
      var picked;
      picked = {};
      if (!(arguments.length === 1 && Type.isArray(keys))) {
        keys = Array.from(arguments);
      }
      keys.forEach((k) => {
        if (k in this.conf) {
          return picked[k] = this.conf[k];
        }
      });
      return picked;
    }

    except(keys) {
      var k, picked, ref, v;
      picked = {};
      if (!(arguments.length === 1 && Type.isArray(keys))) {
        keys = Array.from(arguments);
      }
      ref = this.conf;
      for (k in ref) {
        v = ref[k];
        if (!keys.includes(k)) {
          picked[k] = v;
        }
      }
      return picked;
    }

    alias(newName, name) {
      var k, picked, v;
      picked = {};
      if (arguments.length === 1 && Type.isObject(newName)) {
        for (k in newName) {
          v = newName[k];
          if (v in this.conf) {
            picked[k] = this.conf[v];
          }
        }
      } else {
        if (name in this.conf) {
          picked[newName] = this.conf[name];
        }
      }
      return picked;
    }

  };

  var get, mount, named, unmount;

  named = {};

  mount = createMounter(named, 'mixing');

  unmount = function(name) {
    return delete named[name];
  };

  get = function(name) {
    return named[name] || {};
  };

  luda.extend({
    mixin: function(name, conf) {
      var mixin;
      if (arguments.length === 1) {
        if (Type.isString(name)) {
          return get(name);
        } else {
          return new Mixin$1(conf);
        }
      } else {
        if (conf === null) {
          unmount(name);
          return this;
        } else {
          mixin = new Mixin$1(conf);
          mount(name, mixin);
          return this;
        }
      }
    }
  });

  luda.mixin.named = named;

  luda.include({
    offsetParent: function() {
      return luda(this.els[0] && this.els[0].offsetParent);
    }
  });

  luda.include({
    offset: function() {
      var docEl, el, rect;
      el = this.els[0];
      if (!el) {
        return;
      }
      docEl = document.documentElement;
      rect = el.getBoundingClientRect();
      return {
        top: rect.top + window.pageYOffset - docEl.clientTop,
        left: rect.left + window.pageXOffset - docEl.clientLeft
      };
    }
  });

  luda.include({
    position: function() {
      var el;
      el = this.els[0];
      if (!el) {
        return;
      }
      return {
        left: el.offsetLeft,
        top: el.offsetTop
      };
    }
  });

  luda.include({
    prop: function(prop, value) {
      var key, val;
      if (!prop) {
        return;
      }
      if (Type.isString(prop)) {
        if (arguments.length < 2) {
          return this.els[0] && this.els[0][prop];
        }
        this.els.forEach(function(el) {
          return el[prop] = value;
        });
        return this;
      }
      for (key in prop) {
        val = prop[key];
        this.prop(key, val);
      }
      return this;
    }
  });

  luda.include({
    removeProp: function(prop) {
      var props;
      props = splitValues(prop);
      if (!props.length) {
        return this;
      }
      this.els.forEach(function(el) {
        return props.forEach(function(p) {
          return delete el[p];
        });
      });
      return this;
    }
  });

  luda.include({
    reflow: function() {
      this.els.forEach(function(el) {
        return el.offsetHeight;
      });
      return this;
    }
  });

  function getDurations(style, propertyLength) {
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
  }

  luda.include({
    transitionDuration: function() {
      var delays, durations, el, finalDurations, length, styles;
      if (!(el = this.els[0])) {
        return;
      }
      styles = window.getComputedStyle(el);
      length = styles.transitionProperty.split(',').length;
      if (!length) {
        return 0;
      }
      delays = getDurations(styles.transitionDelay, length);
      durations = getDurations(styles.transitionDuration, length);
      finalDurations = durations.map(function(duration, index) {
        return duration + delays[index];
      });
      return Math.max.apply(null, finalDurations);
    }
  });

  luda.include({
    closest: function(comparator) {
      var filtered;
      if (!comparator || !this.els.length) {
        return luda();
      }
      filtered = this.filter(comparator);
      if (filtered.els.length) {
        return filtered;
      }
      return this.parent().closest(comparator);
    }
  });

  luda.include({
    next: function(comparator, _all) {
      return luda(collect(unique(pluck(this.els, 'nextElementSibling', _all)), comparator));
    }
  });

  luda.include({
    nextAll: function(comparator) {
      return this.next(comparator, true);
    }
  });

  luda.include({
    prev: function(comparator, _al) {
      return luda(collect(unique(pluck(this.els, 'previousElementSibling', _al)), comparator));
    }
  });

  luda.include({
    prevAll: function(comparator) {
      return this.prev(comparator, true);
    }
  });

  luda.include({
    siblings: function(comparator) {
      var all;
      all = [];
      this.els.forEach(function(el) {
        var sibs;
        sibs = luda(el).parent().children(function(child) {
          return child !== el;
        }).els;
        return [].push.apply(all, sibs);
      });
      return luda(collect(unique(all), comparator));
    }
  });

})));
