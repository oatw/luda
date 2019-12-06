(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.mixin('tabable', {
    // cls:
    //   tabable:
    //     active: string           # required
    //     indicatorActive: string  # required
    //     prev: string             # optional
    //     next: string             # optional

    // data:
    //   tabable:
    //     interruption: string  # required
    //     wrap: string          # optional

    // default:
    //   tabable:
    //     activeIndex: integer  # optional
    //     wrap: boolean         # optional

    // evt:
    //   tabable:
    //     activate: string     #required
    //     activated: string    #required
    //     deactivate: string   #required
    //     deactivated: string  #required

    // selector:
    //   tabable:
    //     targets: string     # required
    //     indicators: string  # required
    //     prevCtrl: string    # optional
    //     nextCtrl: string    # optional
    tabableActiveIndex: function() {
      var index, ref, ref1;
      index = ((ref = this.default) != null ? (ref1 = ref.tabable) != null ? ref1.activeIndex : void 0 : void 0) || 0;
      this.tabableTargets.els.some((it, i) => {
        if (!luda(it).hasClass(this.cls.tabable.active)) {
          return false;
        }
        index = i;
        return true;
      });
      return index;
    },
    tabableWrapable: function() {
      var ref, ref1, wrapAttr, wrapable;
      wrapAttr = this.data.tabable.wrap;
      if (!wrapAttr) {
        return false;
      }
      wrapable = this.root.data(wrapAttr);
      if (wrapable === false) {
        return false;
      }
      return (ref = this.default) != null ? (ref1 = ref.tabable) != null ? ref1.wrap : void 0 : void 0;
    },
    tabableActivate: function(index) {
      var direction;
      if (!luda.isNumeric(index)) {
        return;
      }
      direction = index < this.tabableActiveIndex() ? 'prev' : 'next';
      return this.tabableSlide(index, direction);
    },
    tabableNext: function() {
      var index;
      index = this.tabableActiveIndex() + 1;
      if (index >= this.tabableTargets.length) {
        if (!this.tabableWrapable()) {
          return;
        }
        index = 0;
      }
      return this.tabableSlide(index, 'next');
    },
    tabablePrev: function() {
      var index;
      index = this.tabableActiveIndex() - 1;
      if (index < 0) {
        if (!this.tabableWrapable()) {
          return;
        }
        index = this.tabableTargets.length - 1;
      }
      return this.tabableSlide(index, 'prev');
    },
    tabableLayout: function() {
      this.tabableTargets.els.forEach((it, index) => {
        var activeCls, isActive, item, nextCls, prevCls;
        item = luda(it);
        if ((activeCls = this.cls.tabable.active) && item.hasClass(activeCls)) {
          return;
        }
        if ((nextCls = this.cls.tabable.next) && item.hasClass(nextCls)) {
          return;
        }
        if ((prevCls = this.cls.tabable.prev) && item.hasClass(prevCls)) {
          return;
        }
        isActive = index === this.tabableActiveIndex();
        item.css('transition', 'none').toggleClass(activeCls, isActive).toggleClass(prevCls, index < this.tabableActiveIndex()).toggleClass(nextCls, index > this.tabableActiveIndex()).reflow().css('transition', '');
        return isActive && item.trigger(this.evt.tabable.activated);
      });
      this.tabableSetIndicatorsState();
      return this.tabableSetDirectionCtrlsState();
    },
    tabableSlide: function(index, direction) {
      var activateEvt, activated, activatedIndex, activeCls, deactivateEvt, directionCls, item, oppsite, oppsiteCls;
      if (!luda.isNumeric(index)) {
        return;
      }
      if (index === (activatedIndex = this.tabableActiveIndex())) {
        return;
      }
      if (index < 0 || index >= this.tabableTargets.length) {
        return;
      }
      item = this.tabableTargets.eq(index);
      activated = this.tabableTargets.eq(activatedIndex);
      activateEvt = item.trigger(this.evt.tabable.activate, null, true)[0];
      if (activateEvt.isDefaultPrevented()) {
        return;
      }
      deactivateEvt = activated.trigger(this.evt.tabable.deactivate, null, true)[0];
      if (deactivateEvt.isDefaultPrevented()) {
        return;
      }
      oppsite = direction === 'next' ? 'prev' : 'next';
      directionCls = this.cls.tabable[direction];
      oppsiteCls = this.cls.tabable[oppsite];
      activeCls = this.cls.tabable.active;
      item.css('transition', 'none').addClass(directionCls).removeClass(oppsiteCls).reflow().css('transition', '').addClass(activeCls).removeClass(directionCls);
      activated.addClass(oppsiteCls).removeClass(activeCls);
      this.tabableActivating = setTimeout(() => {
        delete this.tabableActivating;
        return item.trigger(this.evt.tabable.activated);
      }, item.transitionDuration());
      this.tabableDeactivateIndex = activatedIndex;
      this.tabableDeactivating = setTimeout(() => {
        delete this.tabableDeactivating;
        delete this.tabableDeactivateIndex;
        return activated.trigger(this.evt.tabable.deactivated);
      }, activated.transitionDuration());
      this.tabableSetIndicatorsState();
      this.tabableSetDirectionCtrlsState();
      return true;
    },
    tabableTransitioning: function() {
      return 'tabableActivating' in this || 'tabableDeactivating' in this;
    },
    tabableSetIndicatorsState: function() {
      return this.tabableIndicators.els.forEach((it, index) => {
        var activeCls, val;
        activeCls = this.cls.tabable.indicatorActive;
        val = index === this.tabableActiveIndex();
        return luda(it).toggleClass(activeCls, val);
      });
    },
    tabableSetDirectionCtrlsState: function() {
      var index, maxIndex, minIndex, nextCtrl, nextDis, prevCtrl, prevDis;
      prevCtrl = this.tabablePrevCtrl;
      nextCtrl = this.tabableNextCtrl;
      if (!(prevCtrl || nextCtrl)) {
        return;
      }
      if (this.tabableTargets.length <= 1) {
        prevDis = nextDis = '';
      } else if (this.tabableWrapable()) {
        prevDis = nextDis = null;
      } else {
        index = this.tabableActiveIndex();
        minIndex = 0;
        maxIndex = this.tabableTargets.length - 1;
        prevDis = index === minIndex ? '' : null;
        nextDis = index === maxIndex ? '' : null;
      }
      prevCtrl && prevCtrl.attr('disabled', prevDis);
      return nextCtrl && nextCtrl.attr('disabled', nextDis);
    },
    tabableActivateOnEvent: function(e) {
      var index, ref, ref1;
      if (this.tabableTransitioning()) {
        return;
      }
      index = (ref = e.detail) != null ? (ref1 = ref.tabable) != null ? ref1.activeIndex : void 0 : void 0;
      if (index == null) {
        index = this.tabableIndicators.els.indexOf(e.currentTarget);
      }
      return this.tabableActivate(index);
    },
    tabablePrevOnEvent: function(e) {
      if (!this.tabableTransitioning()) {
        return this.tabablePrev();
      }
    },
    tabableNextOnEvent: function(e) {
      if (!this.tabableTransitioning()) {
        return this.tabableNext();
      }
    },
    tabableDestroy: function() {
      var interruption;
      if ('tabableActivating' in this) {
        clearTimeout(this.tabableActivating);
        interruption = {
          activate: this.tabableActiveIndex()
        };
      }
      if ('tabableDeactivating' in this) {
        clearTimeout(this.tabableDeactivating);
        interruption || (interruption = {});
        interruption.deactivateIndex = this.tabableDeactivateIndex;
      }
      return this.root.data(this.data.tabable.interruption, interruption);
    },
    tabableCreate: function() {
      var activate, dataAttr, deactive, interruption;
      this.tabableLayout();
      dataAttr = this.data.tabable.interruption;
      if (!(interruption = this.root.data(dataAttr))) {
        return;
      }
      if ((activate = interruption.activated) != null) {
        this.tabableTargets.eq(activated).trigger(this.evt.tabable.activated);
      }
      if ((deactive = interruption.deactivated) != null) {
        this.tabableTargets.eq(deactivated).trigger(this.evt.tabable.deactivated);
      }
      return this.root.removeData(dataAttr);
    },
    tabableFind: function() {
      var conf, nextCtrl, prevCtrl;
      conf = {
        tabableTargets: this.selector.tabable.targets,
        tabableIndicators: this.selector.tabable.indicators
      };
      if (prevCtrl = this.selector.tabable.prevCtrl) {
        conf.tabablePrevCtrl = prevCtrl;
      }
      if (nextCtrl = this.selector.tabable.nextCtrl) {
        conf.tabableNextCtrl = nextCtrl;
      }
      return conf;
    },
    tabableWatch: function() {
      var attr, wrapAttr;
      attr = [];
      wrapAttr = this.data.tabable.wrap;
      wrapAttr && attr.push([wrapAttr, this.tabableSetDirectionControlState]);
      return {
        attr: attr,
        node: [[this.selector.tabable.targets, this.tabableLayout], [this.selector.tabable.indicators, this.tabableSetIndicatorsState]]
      };
    },
    tabableListen: function() {
      var listeners, nextCtrl, prevCtrl;
      listeners = [['click', this.selector.tabable.indicators, this.tabableActivateOnEvent]];
      if (prevCtrl = this.selector.tabable.prevCtrl) {
        listeners.push(['click', prevCtrl, this.tabablePrevOnEvent]);
      }
      if (nextCtrl = this.selector.tabable.nextCtrl) {
        listeners.push(['click', nextCtrl, this.tabableNextOnEvent]);
      }
      return listeners;
    }
  });

})));
