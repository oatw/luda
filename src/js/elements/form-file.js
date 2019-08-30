(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/resetable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/resetable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('fmFile').protect({
    selector: {
      root: '.fm-file',
      file: 'input[type=file]',
      simulator: 'input:not([type=file])'
    },
    data: {
      initValue: 'data-fm-file_value'
    },
    splitor: '  '
  }).protect({
    insertSimulator: function() {
      var simulator;
      if (this.simulator.length) {
        return;
      }
      simulator = luda('<input>');
      simulator.els[0].tabIndex = -1;
      return simulator.insertAfter(this.file);
    },
    updatePlaceholder: function() {
      var placeholder;
      if (!(placeholder = this.file.attr('placeholder'))) {
        return;
      }
      return this.simulator.attr('placeholder', placeholder);
    },
    updateValue: function() {
      var value, values;
      values = Array.from(this.file.els[0].files).map(function(f) {
        return f.name;
      });
      value = values.join(this.splitor) || this.file.attr('value') || '';
      return this.simulator.attr('value', value);
    },
    tryReset: function(target, oldVal) {
      if (this.file.attr('value') !== '') {
        return;
      }
      this.file.els[0].value = '';
      return this.file.attr('value', oldVal);
    }
  }).help({
    find: function() {
      return {
        file: this.selector.file,
        simulator: this.selector.simulator
      };
    },
    watch: function() {
      return {
        attr: [['value', this.selector.file, this.tryReset, this.updateValue]]
      };
    },
    create: function() {
      this.insertSimulator();
      this.updatePlaceholder();
      return this.updateValue();
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.updateValue);
      return [['change', this.selector.file, this.updateValue]];
    }
  });

})));
