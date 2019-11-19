---
title: Installation
description: Luda can be easily installed through multiple ways.
order: 2
---
<!-- markdownlint-disable -->
## Install Pre-built JavaScript and CSS

Step 1: Download Pre-built Files
{: .fw-medium}

[Download v{{site.luda.version}}](https://github.com/oatw/luda/raw/v{{site.luda.version}}/release/dist/luda-{{site.luda.version}}.zip){: .btn .btn-primary}
{: .m-none .p-none}

Step 2: Include Them in Your Template
{: .mt-medium .fw-medium}

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
{: .mt-small}

You can start with this template and modify it to your needs.

## Install in Node.js Powered Apps

Step 1: Download With Yarn or Npm
{: .mb-none .fw-medium}

Yarn
{: .my-none}

``` bash
$ yarn add luda@{{site.luda.version}}
```
{: .mt-none}

Npm
{: .mb-none}

``` bash
$ npm install luda@{{site.luda.version}} --save
```
{: .mt-none}

Step 2: Choose a Theme and Import It
{: .mt-medium .fw-medium}

``` sass
// In your sass or scss entry file
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Import default theme for example. Don't include multiple themes toghther.
@import 'path_to_node_modules/luda/src/sass/default/index'
```
{: .mt-small}

Step 3: Import Luda's JavaScript
{: .mt-medium .fw-medium}

``` javascript
// In your Javascript entry file
import 'luda'
```
{: .mt-small}

## Install in Ruby on Rails Apps

[Webpacker](https://github.com/rails/webpacker) is an exciting feature since
[Rails 6](https://weblog.rubyonrails.org/2019/8/15/Rails-6-0-final-release/),
it's a more advanced way to manage front-end assets in Rails. So if you want to
install Luda in Rails applications, Webpacker is the recommanded way. And the
installation process is similar to
[installing Luda in Node.js powered applications.](#install-in-nodejs-powered-apps)
If you stick to Sprockets, you can follow the belowing steps to install Luda.

Step 1: Download With Bundler
{: .mb-none .fw-medium}

Add luda gem to your Gemfile first:
{: .m-none}

``` ruby
gem 'luda', '{{site.luda.version}}'
```
{: .mt-none .mb-small}

then run bundle in command line.
{: .m-none}

``` bash
$ bundle
```
{: .mt-none}

Step 2: Choose a Theme and Import It in application.sa(c)ss
{: .mt-medium .fw-medium}

``` sass
// In application.sass or application.scss
// Import your custom variable overrides.
@import path_to_your_sass_variables
// Import default theme for example. Don't include multiple themes toghther.
@import luda/default
```
{: .mt-small}

If `application.css` exists in your project,
rename it to `.sass` or `.scss` extension.
And don't use `require` statement to import files, use `@import` instead.
{: .c-danger}

Step 3: Import JavaScript in application.js
{: .fw-medium}

``` javascript
// In application.js
//= require luda
```
{: .mt-small}

## Install in Other Ruby Apps

If your project is based on [Sprokets](https://github.com/rails/sprockets)
or [Hanami](https://hanamirb.org),
Luda assets will be added to load path automatically,
you just need require the assets in your project.
Otherwise, you need manually register Luda assets, you can check
[Luda gem source code](https://github.com/oatw/luda/tree/v{{site.luda.version}}/gem)
and your framework documentation to do that.