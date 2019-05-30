/*! 
   * Luda 0.2.0 | https://oatw.github.io/luda
   * Copyright 2019 Oatw | https://oatw.blog
   * MIT license | http://opensource.org/licenses/MIT
   */
(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  (factory());
}(this, (function () { 'use strict';

  var ENV;

  ENV = (function() {
    if (typeof document !== 'undefined') {
      if (typeof window !== 'undefined') {
        return window;
      }
      if (typeof global !== 'undefined') {
        return global;
      }
    }
    throw new Error('Unsupported runtime environment.');
  })();

  if (typeof ENV.luda !== 'function') {
    ENV.luda = function(installer) {
      var installed, name, property;
      if (!installer) {
        throw new Error('Installer cannot be detected.');
      }
      if (!['object', 'function'].includes(typeof installer)) {
        throw new Error('Installer must be object, array or function.');
      }
      if (installer.hasOwnProperty('_SCOPE')) {
        if (typeof installer._SCOPE !== 'string') {
          throw new Error('_SCOPE must be string');
        }
        return ENV.luda._install(installer._SCOPE, installer);
      }
      if (installer instanceof Array || typeof installer === 'function') {
        throw new Error('Unscoped installer must be object.');
      }
      installed = {};
      for (name in installer) {
        property = installer[name];
        installed[name] = ENV.luda._install(name, property);
      }
      return installed;
    };
    ENV.luda._install = function(namespace, installer) {
      var installedInstaller, installedName, ref;
      if (ENV.luda[namespace]) {
        console.warn(`Namespace ${namespace} is ocupied, sikp installation.`);
        return ENV.luda[namespace];
      }
      ref = ENV.luda;
      for (installedName in ref) {
        installedInstaller = ref[installedName];
        if (installer === installedInstaller) {
          console.warn(`Installer is installed with name ${installedName}, skip installation.`);
          return ENV.luda[installedName];
        }
      }
      if (installer._install) {
        if (typeof installer._install === 'function') {
          return ENV.luda[namespace] = installer._install();
        }
        return ENV.luda[namespace] = installer._install;
      }
      return ENV.luda[namespace] = installer;
    };
  }

})));
