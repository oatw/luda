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
    evt: {
      changed: 'luda:fmDropdown:changed'
    },
    splitor: '   '
  }).protect({
    initSimulator: function() {
      return this.simulator.data('auto', false).attr('readonly', '');
    },
    updateSimulatorValue: function() {
      var values;
      values = [];
      this.options.els.forEach((input, index) => {
        var label, value;
        if (!input.checked) {
          return;
        }
        label = this.labels.eq(index);
        value = label.data(this.data.label) || label.text();
        if (value && !values.includes(value)) {
          return values.push(value);
        }
      });
      return this.simulator.val(values.join(this.splitor));
    },
    updateValue: function() {
      var checked, oldVal;
      this.updateSimulatorValue();
      oldVal = this.selectedVal;
      checked = this.options.els.filter(function(input) {
        return input.checked;
      });
      this.selectedVal = checked.map(function(input) {
        return luda(input).val();
      });
      if (!oldVal || luda.arrayEqual(this.selectedVal, oldVal)) {
        return;
      }
      return this.root.trigger(this.evt.changed, {
        value: this.selectedVal,
        selected: checked
      });
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
      this.initSimulator();
      return this.updateValue();
    },
    watch: function() {
      return {
        node: [[this.selector.options, this.updateValue]],
        attr: [['checked', this.selector.options, this.updateValue], ['type', this.selector.options, this.updateValue]]
      };
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.updateValue);
      return [['change', this.selector.options, this.updateValue], ['keydown@enter', this.selector.simulator, this.triggerClick]];
    }
  });

})));
