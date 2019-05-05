(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('./behaviors/enter.js'), require('./behaviors/focus.js'), require('./behaviors/readonly.js'), require('./behaviors/tabulate.js'), require('./behaviors/toggle.js'), require('./elements/form-file.js'), require('./elements/form-select.js'), require('./patterns/carousel.js'), require('./patterns/dropdown.js'), require('./patterns/form-dropdown.js'), require('./patterns/tab.js')) :
	typeof define === 'function' && define.amd ? define(['./behaviors/enter.js', './behaviors/focus.js', './behaviors/readonly.js', './behaviors/tabulate.js', './behaviors/toggle.js', './elements/form-file.js', './elements/form-select.js', './patterns/carousel.js', './patterns/dropdown.js', './patterns/form-dropdown.js', './patterns/tab.js'], factory) :
	(factory());
}(this, (function () { 'use strict';



})));
