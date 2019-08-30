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
    }
  }).protect({
    tryEmpty: function() {
      var select, selected;
      select = this.select.els[0];
      selected = Array.from(select.options).some(function(o) {
        return luda(o).hasAttr('selected');
      });
      return !selected && (select.selectedIndex = -1);
    },
    markSelected: function(markDefault) {
      markDefault = markDefault === true;
      if (markDefault && this.root.hasData(this.data.defaultMarked)) {
        return;
      }
      if (markDefault) {
        this.root.data(this.data.defaultMarked, '');
      }
      return Array.from(this.select.els[0].options).forEach((o) => {
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
    initSimulator: function() {
      var simulator;
      if (this.select.els[0].multiple) {
        return this.simulator.remove();
      }
      if (this.simulator.length) {
        return;
      }
      simulator = luda('<input>');
      simulator.els[0].tabIndex = -1;
      simulator.insertAfter(this.select);
      this.updatePlaceholder();
      return this.updateValue();
    },
    updatePlaceholder: function() {
      if (this.select.els[0].multiple) {
        return;
      }
      return this.simulator.attr('placeholder', this.select.attr('placeholder'));
    },
    updateValue: function() {
      var select, selected, val;
      select = this.select.els[0];
      if (select.multiple) {
        return;
      }
      selected = select.options[select.selectedIndex];
      val = selected ? luda(selected).text() : '';
      return this.simulator.attr('value', val);
    },
    reset: function() {
      this.select.els[0].selectedIndex = -1;
      Array.from(this.select.els[0].options).forEach((o) => {
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
      return this.initSimulator();
    },
    watch: function() {
      return {
        dom: [[this.selector.options, this.tryEmpty, this.updateValue]],
        attr: [['selected', this.selector.options, this.updateValue], ['multiple', this.selector.select, this.initSimulator]]
      };
    },
    listen: function() {
      luda.mixin('resetable').get('listen').call(this, this.reset);
      return [['change', this.selector.select, this.markSelected]];
    }
  });

})));
