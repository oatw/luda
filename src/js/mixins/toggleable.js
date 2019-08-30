(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.mixin('toggleable', {
    // cls:
    //   toggleable:
    //     active: string  #required

    // data:
    //   toggleable:
    //     interruption: string  # required
    //     toggle: string        # optional

    // default:
    //   toggleable:
    //     trigger: boolean  #optional

    // evt:
    //   toggleable:
    //     activate: string     # required
    //     activated: string    # required
    //     deactivate: string   # required
    //     deactivated: string  # required

    // selector:
    //   toggleable:
    //     target: string  # optional
    toggleableActivate: function() {
      var evt;
      if (this.toggleableActive()) {
        return;
      }
      evt = this.toggleableTarget.trigger(this.evt.toggleable.activate, null, true)[0];
      if (evt.isDefaultPrevented()) {
        return;
      }
      clearTimeout(this.toggleableDeactivating);
      delete this.toggleableDeactivating;
      this.root.addClass(this.cls.toggleable.active);
      this.toggleableActivating = setTimeout(() => {
        delete this.toggleableActivating;
        return this.toggleableTarget.trigger(this.evt.toggleable.activated);
      }, this.toggleableTarget.transitionDuration());
      return true;
    },
    toggleableDeactivate: function() {
      var evt;
      if (!this.toggleableActive()) {
        return;
      }
      evt = this.toggleableTarget.trigger(this.evt.toggleable.deactivate, null, true)[0];
      if (evt.isDefaultPrevented()) {
        return;
      }
      clearTimeout(this.toggleableActivating);
      delete this.toggleableActivating;
      this.root.removeClass(this.cls.toggleable.active);
      this.toggleableDeactivating = setTimeout(() => {
        delete this.toggleableDeactivating;
        return this.toggleableTarget.trigger(this.evt.toggleable.deactivated);
      }, this.toggleableTarget.transitionDuration());
      return true;
    },
    toggleableToggle: function(force) {
      if (force === true) {
        return this.toggleableActivate();
      }
      if (force === false) {
        return this.toggleableDeactivate();
      }
      if (this.toggleableActive()) {
        return this.toggleableDeactivate();
      } else {
        return this.toggleableActivate();
      }
    },
    toggleableActive: function() {
      return this.root.hasClass(this.cls.toggleable.active);
    },
    toggleableTransitioning: function() {
      return 'toggleableActivating' in this || 'toggleableDeactivating' in this;
    },
    toggleableTriggerable: function(e) {
      var evtPath, index, ref, ref1, toggleAttr, trigger;
      if (this.toggleableTransitioning()) {
        return;
      }
      if (/key/.test(e.type)) {
        return true;
      }
      if (!this.root.els[0].contains(e.target)) {
        return true;
      }
      trigger = (ref = this.default) != null ? (ref1 = ref.toggleable) != null ? ref1.trigger : void 0 : void 0;
      toggleAttr = this.data.toggleable.trigger;
      if (!toggleAttr) {
        return trigger;
      }
      evtPath = e.eventPath();
      index = evtPath.indexOf(this.root.els[0]) + 1;
      evtPath.slice(0, index).some(function(el) {
        var ins;
        ins = luda(el);
        if (!ins.hasData(toggleAttr)) {
          return;
        }
        trigger = ins.data(toggleAttr) !== false;
        return true;
      });
      return trigger;
    },
    toggleableFocusOpener: function(e) {
      var ins;
      if (this.toggleableActive()) {
        return this.toggleableFocused = document.activeElement;
      }
      if (!this.toggleableFocused) {
        return;
      }
      if ('focus' in (ins = luda(this.toggleableFocused))) {
        return ins.focus(!e.detail, e.detail);
      } else {
        return this.toggleableFocused.focus({
          preventScroll: e.detail
        });
      }
    },
    toggleableActivateOnEvent: function(e) {
      if (!(this.toggleableTriggerable(e) && this.toggleableActivate())) {
        return;
      }
      this.toggleableFocusOpener(e);
      return true;
    },
    toggleableDeactivateOnEvent: function(e) {
      if (!(this.toggleableTriggerable(e) && this.toggleableDeactivate())) {
        return;
      }
      this.toggleableFocusOpener(e);
      return true;
    },
    toggleableToggleOnEvent: function(e) {
      if (!(this.toggleableTriggerable(e) && this.toggleableToggle())) {
        return;
      }
      this.toggleableFocusOpener(e);
      return true;
    },
    toggleableCreate: function() {
      var dataAttr, evt, interruption;
      dataAttr = this.data.toggleable.interruption;
      if (!(interruption = this.root.data(dataAttr))) {
        return;
      }
      evt = this.evt.toggleable[interruption];
      this.root.removeData(dataAttr);
      return this.toggleableTarget.trigger(evt);
    },
    toggleableDestroy: function() {
      var interruption;
      if ('toggleableActivating' in this) {
        interruption = 'activated';
        clearTimeout(this.toggleableActivating);
      } else if ('toggleableDeactivating' in this) {
        interruption = 'deactivated';
        clearTimeout(this.toggleableDeactivating);
      }
      return interruption && this.root.data(this.data.toggleable.interruption, interruption);
    },
    toggleableFind: function() {
      var ref, ref1, target;
      target = (ref = this.selector) != null ? (ref1 = ref.toggleable) != null ? ref1.target : void 0 : void 0;
      return {
        toggleableTarget: target || function() {
          return this.root;
        }
      };
    }
  });

})));
