---
title: Installation
description: Luda can be easily installed through multiple ways.
order: 2
---

## Install Pre-built JavaScript and CSS

### Step 1: Download Pre-built Files

<!-- markdownlint-disable -->
[Download v{{site.luda.version}}](https://github.com/oatw/luda/raw/v{{site.luda.version}}/release/dist/luda-{{site.luda.version}}.zip){: .btn .btn-primary}
<!-- markdownlint-enable -->

### Step 2: Include Them in Your Template

<!-- markdownlint-disable -->
``` html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Hi Luda!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <!-- Use default theme for example. The CSS of each theme is built seperately, don't include multiple themes toghther. -->
    <link rel="stylesheet" href="https://unpkg.com/luda@{{site.luda.version}}/dist/css/luda-default.min.css">
  </head>
  <body>
    <h1>Hi Luda!</h1>
    <script src="https://unpkg.com/luda@{{site.luda.version}}/dist/js/luda.min.js"></script>
  </body>
</html>
```
<!-- markdownlint-enable -->

You can start with this template and modify it to your needs.

## Install in Node.js Powered Apps

### Step 1: Download With Yarn or Npm

<!-- markdownlint-disable -->
Yarn

``` bash
$ yarn add luda@{{site.luda.version}}
```
{: .mt-none}

Npm
{: .mt-small}

``` bash
$ npm install luda@{{site.luda.version}} --save
```
{: .mt-none}
<!-- markdownlint-enable -->

### Step 2: Choose a Theme and Import It

``` sass
// In your sass or scss entry file
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Import default theme for example. Don't include multiple themes toghther.
@import 'path_to_node_modules/luda/src/sass/default/index'
```

### Step 3: Import Luda's JavaScript

``` javascript
// In your Javascript entry file
import 'luda'
```

## Install in Ruby on Rails Apps

### Step 1: Download With Bundler or Gem

Bundler is the recommand way to install Luda in Ruby on Rails Apps.

Add luda gem to your Gemfile first:

<!-- markdownlint-disable -->
``` ruby
gem 'luda', '{{site.luda.version}}'
```
{: .mt-none}

then run bundle in command line.
{: .mt-small}

``` bash
$ bundle
```
{: .mt-none}

You can also download Luda with gem.
{: .mt-small}

``` bash
$ gem install luda -v {{site.luda.version}}
```
{: .mt-none}
<!-- markdownlint-enable -->

### Step 2: Choose a Theme and Import It in application.sa(c)ss

``` sass
// In application.sass or application.scss
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Import default theme for example. Don't include multiple themes toghther.
@import luda/default
```

If `application.css` exists in your project,
rename it to `.sass` or `.scss` extension.
And don't use `require` statement to import files, use `@import` instead.
{: .c-danger}

### Step 3: Import JavaScript in application.js

``` javascript
// In application.js
//= require luda
```

## Install in Other Ruby Apps

If your project is based on [Sprokets](https://github.com/rails/sprockets)
or [Hanami](https://hanamirb.org),
Luda assets will be added to load path automatically,
you just need require the assets in your project.
Otherwise, you need manually register Luda assets, you can check
[Luda gem source code](https://github.com/oatw/luda/tree/v{{site.luda.version}}/gem)
and your framework documentation to do that.