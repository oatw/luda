---
title: Modular Import
description: Luda is modular, you can import the components which you need in asset management tools.
order: 6
---
<!-- markdownlint-disable -->
## In Node.js Powered Apps

Sass Entries In Node.js

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

Javascript Entries In Node.js
{: .mt-medium}

``` javascript
// Kernel engine
import 'luda/src/js/kernel/index'
// Behaviors
import 'luda/src/js/behaviors/disabled'
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

## In Ruby on Rails Apps

Sass Entries in Ruby on Rails

``` sass
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Theme functions, variables and mixins are required.
@import luda/default/functions
@import luda/default/variables
@import luda/default/mixins
// Browser styles normalization based on sanitize.css(https://github.com/csstools/sanitize.css)
@import luda/default/base
// Theme Behaviors
@import luda/default/behaviors/disabled
@import luda/default/behaviors/readonly
@import luda/default/behaviors/focus
@import luda/default/behaviors/toggle
//Theme Elements
@import luda/default/elements/badge
@import luda/default/elements/baseline
@import luda/default/elements/button
@import luda/default/elements/container
@import luda/default/elements/form
@import luda/default/elements/grid
@import luda/default/elements/icon
@import luda/default/elements/media
@import luda/default/elements/overlay
@import luda/default/elements/progress
@import luda/default/elements/scrollbar
@import luda/default/elements/table
@import luda/default/elements/turbolinks-progress-bar
@import luda/default/elements/typography
//Theme Patterns
@import luda/default/patterns/alert
@import luda/default/patterns/article
@import luda/default/patterns/avatar
@import luda/default/patterns/breadcrumb
@import luda/default/patterns/button-group
@import luda/default/patterns/button-icon
@import luda/default/patterns/carousel
@import luda/default/patterns/dropdown
@import luda/default/patterns/form-dropdown
@import luda/default/patterns/form-group
@import luda/default/patterns/form-icon
@import luda/default/patterns/modal
@import luda/default/patterns/navigation
@import luda/default/patterns/search-bar
@import luda/default/patterns/tab
//Theme Utilities
@import luda/default/utilities/alignment
@import luda/default/utilities/background
@import luda/default/utilities/border
@import luda/default/utilities/color
@import luda/default/utilities/display
@import luda/default/utilities/flex
@import luda/default/utilities/float
@import luda/default/utilities/opacity
@import luda/default/utilities/overflow
@import luda/default/utilities/position
@import luda/default/utilities/shadow
@import luda/default/utilities/shape
@import luda/default/utilities/size
@import luda/default/utilities/spacing
@import luda/default/utilities/text
@import luda/default/utilities/visibility
@import luda/default/utilities/z-index
```
{: .mt-small}

JavaScript Entries in Ruby on Rails
{: .mt-medium}

``` javascript
// Kernel engine
//= require luda/kernel/index
// Behaviors
//= require luda/behaviors/disabled
//= require luda/behaviors/enter
//= require luda/behaviors/focus
//= require luda/behaviors/readonly
//= require luda/behaviors/tabulate
//= require luda/behaviors/toggle
// Elements
//= require luda/elements/form-file
//= require luda/elements/form-select
// patterns
//= require luda/patterns/carousel
//= require luda/patterns/dropdown
//= require luda/patterns/form-dropdown
//= require luda/patterns/tab
```
{: .mt-small}

## In Hanami Apps

Sass modular imports in Hanami are the same as in Ruby on Rails.
Hanami team is considering add Webpack support in v2,
but before that you have to manually handle Javascript dependencies
if thirdparty assets management gems not installed.
That can be painful for large project.

If you want to import Luda JavaScript modularly before Hanami v2,
You'd better install a thirdparty asset management tool.
Otherwise, you'll have to dive into Luda's source code
to figure out Javascript dependencies.