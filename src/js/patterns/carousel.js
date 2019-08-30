(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/tabable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/tabable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('carousel').protect({
    cls: {
      tabable: {
        active: 'carousel-item-active',
        indicatorActive: 'btn-active',
        prev: 'carousel-item-prev',
        next: 'carousel-item-next'
      }
    },
    data: {
      interval: 'carousel-interval',
      tabable: {
        interruption: 'data-carousel_interruption',
        wrap: 'data-carousel-wrap'
      }
    },
    default: {
      interval: 5000,
      tabable: {
        activeIndex: 0,
        wrap: true
      }
    },
    evt: {
      tabable: {
        activate: 'luda:carousel:activate',
        activated: 'luda:carousel:activated',
        deactivate: 'luda:carousel:deactivate',
        deactivated: 'luda:carousel:deactivated'
      }
    },
    selector: {
      tabable: {
        targets: '.carousel-item',
        indicators: '.carousel-indicators .btn',
        prevCtrl: '.carousel-prev',
        nextCtrl: '.carousel-next'
      }
    }
  }).include(luda.mixin('tabable').alias({
    activate: 'tabableActivate',
    next: 'tabableNext',
    prev: 'tabablePrev'
  })).include({
    pause: function() {
      if (!('intervaling' in this)) {
        return;
      }
      clearTimeout(this.intervaling);
      delete this.intervaling;
      this.nextInterval -= Date.now() - this.playAt;
      if (this.nextInterval <= 10) {
        this.nextInterval = void 0;
      }
      return this.pauseIndex = this.tabableActiveIndex();
    },
    play: function() {
      var handler;
      if ('intervaling' in this) {
        return;
      }
      if (!this.interval()) {
        return;
      }
      this.playAt = Date.now();
      if (this.pauseIndex !== this.tabableActiveIndex()) {
        this.nextInterval = this.interval();
      }
      handler = () => {
        this.tabableNext();
        this.playAt = Date.now();
        this.nextInterval = this.interval();
        return this.intervaling = setTimeout(handler, this.interval());
      };
      return this.intervaling = setTimeout(handler, this.nextInterval);
    }
  }).protect(luda.mixin('tabable').all()).protect({
    interval: function() {
      var duration;
      duration = this.root.data(this.data.interval);
      if (duration === false) {
        return false;
      }
      return Math.abs(parseInt(duration, 10)) || this.default.interval;
    },
    touchendPlay: function() {
      return setTimeout(() => {
        return this.play();
      });
    }
  }).help({
    find: function() {
      return this.tabableFind();
    },
    create: function() {
      this.tabableCreate();
      return this.play();
    },
    destroy: function() {
      this.pause();
      return this.tabableDestroy();
    },
    watch: function() {
      var watches;
      watches = this.tabableWatch();
      watches.attr.push([this.data.interval, this.pause, this.play]);
      return watches;
    },
    listen: function() {
      return this.tabableListen().concat([['swipeleft', this.tabableNextOnEvent], ['swiperight', this.tabablePrevOnEvent], ['touchstart mouseover', this.pause], ['mouseout', this.play], ['touchend', this.touchendPlay]]);
    }
  });

})));
