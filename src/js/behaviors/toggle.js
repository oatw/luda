(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/toggleable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/toggleable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('toggle', '[data-toggle-target]').protect({
    cls: {
      toggleable: {
        active: 'toggle-active'
      }
    },
    data: {
      target: 'data-toggle-target',
      for: 'data-toggle-for',
      auto: 'data-toggle-auto-deactivate',
      toggleable: {
        interruption: 'data-toggle_interruption',
        trigger: 'data-toggleable'
      }
    },
    default: {
      autoDuration: 3000
    },
    evt: {
      toggleable: {
        activate: 'luda:toggle:activate',
        activated: 'luda:toggle:activated',
        deactivate: 'luda:toggle:deactivate',
        deactivated: 'luda:toggle:deactivated'
      }
    }
  }).include({
    activate: function() {
      if (!this.toggleableActivate()) {
        return;
      }
      return this.toggleAutoState();
    },
    deactivate: function() {
      if (!this.toggleableDeactivate()) {
        return;
      }
      return this.toggleAutoState();
    },
    toggle: function(force) {
      if (!this.toggleableToggle(force)) {
        return;
      }
      return this.toggleAutoState();
    }
  }).protect(luda.mixin('toggleable').all()).protect({
    toggleAutoState: function() {
      if (!this.root.hasData(this.data.auto)) {
        return;
      }
      if (this.toggleableActive()) {
        return this.auto = setTimeout(() => {
          delete this.auto;
          return this.deactivate();
        }, this.root.data(this.data.auto) || this.default.autoDuration);
      } else {
        clearTimeout(this.auto);
        return delete this.auto;
      }
    },
    toggleOnEvent: function(e) {
      if (!this.toggleableToggleOnEvent(e)) {
        return;
      }
      return this.toggleAutoState();
    }
  }).help({
    find: function() {
      return this.toggleableFind();
    },
    create: function() {
      this.toggleableCreate();
      return this.toggleAutoState();
    },
    destroy: function() {
      this.toggleableDestroy();
      return 'auto' in this && clearTimeout(this.auto);
    },
    listen: function() {
      var self;
      self = this;
      return [
        ['click',
        this.toggleOnEvent],
        [
          'click',
          `[${this.data.for}]`,
          function(e) {
            var name;
            name = luda(this).data(self.data.for);
            return self.con.each(function(ins) {
              if (ins.root.data(self.data.target) !== name) {
                return;
              }
              ins.toggleOnEvent(e);
              return true;
            });
          }
        ]
      ];
    }
  });

})));
