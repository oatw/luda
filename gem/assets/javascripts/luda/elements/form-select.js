//= require ../kernel/index
//= require ../mixins/resetable
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../kernel/index.js'), require('../mixins/resetable.js')) :
  typeof define === 'function' && define.amd ? define(['../kernel/index.js', '../mixins/resetable.js'], factory) :
  (factory());
}(this, (function () { 'use strict';

  luda.component('fmSelect').protect({
    selector: {
      select: 'select',
      options: 'option',
      simulator: 'input'
    },
    data: {
      default: 'data-fm-select_default-selected',
      defaultMarked: 'data-fm-select_default-marked'
    },
    evt: {
      changed: 'luda:fmSelect:changed'
    }
  }).protect({
    placeholder: function() {
      return this.select.attr('placeholder');
    },
    multiple: function() {
      return this.select.prop('multiple');
    },
    options: function() {
      return Array.from(this.select.prop('options'));
    }
  }).protect({
    tryEmpty: function() {
      var selected;
      selected = this.options().some(function(o) {
        return luda(o).hasAttr('selected');
      });
      return !selected && this.select.prop('selectedIndex', -1);
    },
    markSelected: function(markDefault) {
      markDefault = markDefault === true;
      if (markDefault && this.root.hasData(this.data.defaultMarked)) {
        return;
      }
      if (markDefault) {
        this.root.data(this.data.defaultMarked, '');
      }
      return this.options().forEach((o) => {
        var option, val;
        option = luda(o);
        if (markDefault) {
          val = option.hasAttr('selected') ? '' : null;
          return option.data(this.data.default, val);
        } else {
          val = o.selected ? '' : null;
          return option.attr('selected', val);
        }
      });
    },
    toggleSimulator: function() {
      if (this.multiple()) {
        return this.simulator.remove();
      }
      if (this.simulator.length) {
        return;
      }
      return luda('<input>').prop('tabIndex', -1).attr('placeholder', this.placeholder()).insertAfter(this.select);
    },
    updateSimulatorValue: function() {
      var selected, val;
      if (this.multiple()) {
        return;
      }
      selected = this.options()[this.select.prop('selectedIndex')];
      val = selected ? luda(selected).text() : '';
      return this.simulator.val(val);
    },
    updateValue: function() {
      var oldVal, selected, val;
      this.updateSimulatorValue();
      oldVal = this.selectedVal;
      val = this.select.val();
      this.selectedVal = luda.isArray(val) ? val : [val];
      if (!oldVal || luda.arrayEqual(this.selectedVal, oldVal)) {
        return;
      }
      if (this.multiple()) {
        selected = this.options().filter(function(o) {
          return o.selected;
        });
      } else {
        selected = this.options()[this.select.prop('selectedIndex')];
      }
      return this.select.trigger(this.evt.changed, {
        value: val,
        selected: selected
      });
    },
    reset: function() {
      this.select.prop('selectedIndex', -1);
      this.options().forEach((o) => {
        return o.selected = luda(o).hasData(this.data.default);
      });
      return this.markSelected();
    }
  }).help({
    find: function() {
      return {
        select: this.selector.select,
        simulator: this.selector.simulator
      };
    },
    create: function() {
      this.tryEmpty();
      this.markSelected(true);
      this.toggleSimulator();
      return this.updateValue();
    },
    watch: function() {
      return {
        node: [[this.selector.options, this.tryEmpty, this.updateValue]],
        attr: [['selected', this.selector.options, this.tryEmpty, this.updateValue], ['multiple', this.selector.select, this.toggleSimulator, this.updateValue]]
      };
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.reset);
      return [['change', this.selector.select, this.markSelected]];
    }
  });

})));
