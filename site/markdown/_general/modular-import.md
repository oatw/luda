---
title: Modular Import
description: Luda is modular, you can import the components which you need in asset management tools.
order: 6
---
<!-- markdownlint-disable -->
## In Node.js Powered Apps

Component Sass Entries

``` sass
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Theme functions, variables and mixins are required.
@import 'path_to_node_modules/luda/src/sass/default/functions'
@import 'path_to_node_modules/luda/src/sass/default/variables'
@import 'path_to_node_modules/luda/src/sass/default/mixins'
// Browser styles normalization based on sanitize.css(https://github.com/csstools/sanitize.css)
@import 'path_to_node_modules/luda/src/sass/default/base'
// Theme Behaviors
@import 'path_to_node_modules/luda/src/sass/default/behaviors/disabled'
@import 'path_to_node_modules/luda/src/sass/default/behaviors/focus'
@import 'path_to_node_modules/luda/src/sass/default/behaviors/toggle'
@import 'path_to_node_modules/luda/src/sass/default/behaviors/readonly'
// Theme Elements
@import 'path_to_node_modules/luda/src/sass/default/elements/badge'
@import 'path_to_node_modules/luda/src/sass/default/elements/baseline'
@import 'path_to_node_modules/luda/src/sass/default/elements/button'
@import 'path_to_node_modules/luda/src/sass/default/elements/container'
@import 'path_to_node_modules/luda/src/sass/default/elements/form'
@import 'path_to_node_modules/luda/src/sass/default/elements/grid'
@import 'path_to_node_modules/luda/src/sass/default/elements/icon'
@import 'path_to_node_modules/luda/src/sass/default/elements/media'
@import 'path_to_node_modules/luda/src/sass/default/elements/overlay'
@import 'path_to_node_modules/luda/src/sass/default/elements/progress'
@import 'path_to_node_modules/luda/src/sass/default/elements/scrollbar'
@import 'path_to_node_modules/luda/src/sass/default/elements/table'
@import 'path_to_node_modules/luda/src/sass/default/elements/turbolinks-progress-bar'
@import 'path_to_node_modules/luda/src/sass/default/elements/typography'
// Theme Patterns
@import 'path_to_node_modules/luda/src/sass/default/patterns/alert'
@import 'path_to_node_modules/luda/src/sass/default/patterns/article'
@import 'path_to_node_modules/luda/src/sass/default/patterns/avatar'
@import 'path_to_node_modules/luda/src/sass/default/patterns/button-group'
@import 'path_to_node_modules/luda/src/sass/default/patterns/button-icon'
@import 'path_to_node_modules/luda/src/sass/default/patterns/breadcrumb'
@import 'path_to_node_modules/luda/src/sass/default/patterns/carousel'
@import 'path_to_node_modules/luda/src/sass/default/patterns/dropdown'
@import 'path_to_node_modules/luda/src/sass/default/patterns/form-dropdown'
@import 'path_to_node_modules/luda/src/sass/default/patterns/form-group'
@import 'path_to_node_modules/luda/src/sass/default/patterns/form-icon'
@import 'path_to_node_modules/luda/src/sass/default/patterns/modal'
@import 'path_to_node_modules/luda/src/sass/default/patterns/navigation'
@import 'path_to_node_modules/luda/src/sass/default/patterns/search-bar'
@import 'path_to_node_modules/luda/src/sass/default/patterns/tab'
// Theme Utilities
@import 'path_to_node_modules/luda/src/sass/default/utilities/alignment'
@import 'path_to_node_modules/luda/src/sass/default/utilities/background'
@import 'path_to_node_modules/luda/src/sass/default/utilities/border'
@import 'path_to_node_modules/luda/src/sass/default/utilities/color'
@import 'path_to_node_modules/luda/src/sass/default/utilities/display'
@import 'path_to_node_modules/luda/src/sass/default/utilities/flex'
@import 'path_to_node_modules/luda/src/sass/default/utilities/float'
@import 'path_to_node_modules/luda/src/sass/default/utilities/opacity'
@import 'path_to_node_modules/luda/src/sass/default/utilities/overflow'
@import 'path_to_node_modules/luda/src/sass/default/utilities/position'
@import 'path_to_node_modules/luda/src/sass/default/utilities/shadow'
@import 'path_to_node_modules/luda/src/sass/default/utilities/size'
@import 'path_to_node_modules/luda/src/sass/default/utilities/spacing'
@import 'path_to_node_modules/luda/src/sass/default/utilities/text'
@import 'path_to_node_modules/luda/src/sass/default/utilities/visibility'
@import 'path_to_node_modules/luda/src/sass/default/utilities/z-index'
```
{: .mt-none}

Component Javascript Entries
{: .mt-medium}

``` javascript
// Optional Kernel functions
import 'luda/src/js/kernel'
// Behaviors
import 'luda/src/js/behaviors/enter'
import 'luda/src/js/behaviors/focus'
import 'luda/src/js/behaviors/readonly'
import 'luda/src/js/behaviors/tabulate'
import 'luda/src/js/behaviors/toggle'
// Elements
import 'luda/src/js/elements/form-file'
import 'luda/src/js/elements/form-select'
// Patterns
import 'luda/src/js/patterns/carousel'
import 'luda/src/js/patterns/dropdown'
import 'luda/src/js/patterns/form-dropdown'
import 'luda/src/js/patterns/tab'
```
{: .mt-small}

## In Ruby on Rails and Other Ruby Apps

Luda doesn't support importing modules for Sprockets any more since version 0.3.0.
If you want to import Luda components separately in Rails or other Ruby applications,
please use Webpacker. It's similar to
[importing Luda components separately in Node.js applications.](#in-nodejs-powered-apps)