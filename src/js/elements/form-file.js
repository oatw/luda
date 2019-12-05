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
    evt: {
      changed: 'luda:fmFile:changed'
    },
    splitor: '  '
  }).protect({
    placeholder: function() {
      return this.file.attr('placeholder');
    },
    value: function() {
      return this.file.attr('value');
    },
    multiple: function() {
      return this.file.prop('multiple');
    }
  }).protect({
    files: function() {
      return Array.from(this.file.prop('files'));
    },
    insertSimulator: function() {
      if (this.simulator.length) {
        return;
      }
      return luda('<input>').prop('tabIndex', -1).attr('placeholder', this.placeholder()).insertAfter(this.file);
    },
    updateSimulatorValue: function() {
      var value, values;
      values = this.files().map(function(f) {
        return f.name;
      });
      value = values.join(this.splitor) || this.value() || '';
      return this.simulator.attr('value', value);
    },
    updateValue: function() {
      var oldFile, val;
      this.updateSimulatorValue();
      oldFile = this.selectedFile;
      this.selectedFile = this.files();
      if (!oldFile || luda.arrayEqual(this.selectedFile, oldFile)) {
        return;
      }
      val = this.multiple() ? this.selectedFile : this.selectedFile[0];
      return this.file.trigger(this.evt.changed, val);
    },
    tryReset: function(target, oldVal) {
      if (this.value() !== '') {
        return;
      }
      return this.file.prop('value', '').attr('value', oldVal);
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
      return this.updateValue();
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.updateValue);
      return [['change', this.selector.file, this.updateValue]];
    }
  });

})));
