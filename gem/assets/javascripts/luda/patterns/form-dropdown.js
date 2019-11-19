//= require ../kernel/index
//= require ../mixins/resetable
//= require ./dropdown
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/resetable.js'), require('./dropdown.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/resetable.js', './dropdown.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('fmDropdown').protect({
    selector: {
      options: '.dropdown-items .btn-radio input, .dropdown-items .btn-check input',
      labels: '.dropdown-items .btn-radio label, .dropdown-items .btn-check label',
      simulator: '.fm input'
    },
    data: {
      label: 'fm-dropdown-label'
    },
    splitor: '   '
  }).protect({
    disableSimulator: function() {
      return this.simulator.data('auto', false).attr('readonly', '');
    },
    updateValue: function() {
      var values;
      values = [];
      this.options.els.forEach((input, index) => {
        var label, value;
        if (!input.checked) {
          return;
        }
        label = luda(this.labels.els[index]);
        value = label.data(this.data.label) || label.text();
        if (value && !values.includes(value)) {
          return values.push(value);
        }
      });
      return this.simulator.attr('value', values.join(this.splitor));
    },
    triggerClick: function() {
      return this.simulator.trigger('click');
    }
  }).help({
    find: function() {
      return {
        options: this.selector.options,
        labels: this.selector.labels,
        simulator: this.selector.simulator
      };
    },
    create: function() {
      this.disableSimulator();
      return this.updateValue();
    },
    watch: function() {
      return {
        dom: [[this.selector.options, this.updateValue]],
        attr: [['checked', this.selector.options, this.updateValue]]
      };
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.updateValue);
      return [['change', this.selector.options, this.updateValue], ['keydown@enter', this.selector.simulator, this.triggerClick]];
    }
  });

})));
