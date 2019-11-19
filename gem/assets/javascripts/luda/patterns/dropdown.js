//= require ../kernel/index
//= require ../mixins/toggleable
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/toggleable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/toggleable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('dropdown', '.dropdown-absolute, .dropdown-static, .dropdown-fixed, .dropdown-static-m').protect({
    cls: {
      toggleable: {
        active: 'dropdown-active'
      }
    },
    data: {
      standalone: 'data-dropdown-standalone',
      toggleable: {
        interruption: 'data-dropdown_interruption',
        trigger: 'data-dropdownable'
      }
    },
    default: {
      toggleable: {
        trigger: true
      }
    },
    evt: {
      toggleable: {
        activate: 'luda:dropdown:activate',
        activated: 'luda:dropdown:activated',
        deactivate: 'luda:dropdown:deactivate',
        deactivated: 'luda:dropdown:deactivated'
      }
    },
    selector: {
      items: 'a[href]:not([disabled]),button:not([disabled]), input:not([disabled]),[tabindex]:not([disabled]), area[href]:not([disabled]),iframe:not([disabled])',
      toggleable: {
        target: '.dropdown-menu'
      }
    }
  }).include(luda.mixin('toggleable').alias({
    activate: 'toggleableActivate',
    deactivate: 'toggleableDeactivate',
    toggle: 'toggleableToggle'
  })).protect(luda.mixin('toggleable').all()).protect({
    parent: function() {
      var rootEl;
      rootEl = this.parentRoot.els[0];
      if (rootEl) {
        return this.con.create(rootEl)[0];
      } else {
        return null;
      }
    },
    escDeactivate: function(e) {
      var parent;
      if (this.toggleableActive()) {
        return this.toggleableDeactivateOnEvent(e);
      } else if (parent = this.parent()) {
        return parent.escDeactivate(e);
      }
    },
    prevItem: function(e) {
      var index, items, parent;
      if (this.toggleableActive()) {
        if (!(items = this.items.els).length) {
          return;
        }
        index = items.indexOf(document.activeElement) - 1;
        if (index < 0) {
          index = 0;
        }
        return items[index].focus();
      } else if (parent = this.parent()) {
        return parent.prevItem(e);
      }
    },
    nextItem: function(e) {
      var index, items, parent;
      if (this.toggleableActive()) {
        if (!(items = this.items.els).length) {
          return;
        }
        index = items.indexOf(document.activeElement) + 1;
        if (index >= items.length) {
          index = items.length - 1;
        }
        return items[index].focus();
      } else if (parent = this.parent()) {
        return parent.nextItem(e);
      }
    }
  }).help({
    find: function() {
      return Object.assign(this.toggleableFind(), {
        parentRoot: function() {
          return this.root.parent(this.con.root);
        },
        items: function() {
          var menu, self;
          self = this;
          menu = this.toggleableTarget;
          return menu.find(this.selector.items).filter(function(el) {
            var parentMenu;
            parentMenu = luda(el).parent(self.selector.toggleable.target);
            return parentMenu.els[0] === menu.els[0];
          });
        }
      });
    },
    listen: function() {
      var self;
      self = this;
      return [
        ['click',
        this.toggleableToggleOnEvent],
        ['keyup@tab',
        this.toggleableActivateOnEvent],
        ['keydown@esc&prevent',
        this.escDeactivate],
        ['keydown@left@up&prevent',
        this.prevItem],
        ['keydown@right@down&prevent',
        this.nextItem],
        [
          'click keyup@tab',
          function(e) {
            var exceptions;
            exceptions = [];
            e.eventPath().forEach(function(el) {
              return self.con.contains(el) && exceptions.push(el);
            });
            return self.con.each(function(ins,
          rootEl) {
              var isExcepted,
          isStandalone;
              isExcepted = exceptions.includes(rootEl);
              isStandalone = ins.root.hasData(self.data.standalone);
              !isExcepted && !isStandalone && ins.deactivate();
              return true;
            });
          }
        ]
      ];
    }
  });

})));
