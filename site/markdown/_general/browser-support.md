---
title: Browser Support
order: 5
description: Luda supports most modern browsers, for browsers not supported,
             you can use Luda degeradation script as a fallback.
---

## Supported Browsers

<!-- markdownlint-disable -->
<div class="d-flex fw-wrap mb-none">
  <div class="mr-small ta-center">
    <img width="48" height="48" src="{{ '/assets/img/chrome.svg' | relative_url }}" alt="chrome">
    <p class="p7">latest versions</p>
  </div>
  <div class="mr-small ta-center">
    <img width="48" height="48" src="{{ '/assets/img/firefox.svg' | relative_url }}" alt="firefox">
    <p class="p7">latest versions</p>
  </div>
  <div class="mr-small ta-center">
    <img width="48" height="48" src="{{ '/assets/img/safari.svg' | relative_url }}" alt="safari">
    <p class="p7">latest versions</p>
  </div>
  <div class="mr-small ta-center">
    <img width="48" height="48" src="{{ '/assets/img/opera.svg' | relative_url }}" alt="opera">
    <p class="p7">latest versions</p>
  </div>
  <div class="mr-small ta-center">
    <img width="48" height="48" src="{{ '/assets/img/edge.svg' | relative_url }}" alt="edge">
    <p class="p7">latest versions</p>
  </div>
</div>
<!-- markdownlint-enable -->

Luda targets all recent versions of above modern browsers
and doesn't include unnecessary polyfills nor browser prefixers.
For old version browsers, Luda degradation script can be used
to redirect to a degradation page.
If old version browsers are still your main targets,
you can add extra polyfills and prefixers by yourself
with tools like [Babel](https://babeljs.io/)
and [Autoprefixer](https://github.com/postcss/autoprefixer).

## The Degeradation Script

Luda degeradation script is a tiny Javascript file which
can detect if the APIs used in Luda are supported in browsers.
If any API not supported, the degeradation script will try to
redirect to a degradation url. The url can be defined by adding
the `data-degradation-url` attribute to the `<html>` tag
or the `<script>` tag which includes the degradation script.
If this attribute is not defined, the content of body will be
replaced by _"Please visit this site with a modern browser."_.

The degeradation script is simple to use,
include the script before any other scripts in your template
and set a degradation url like below.

``` html
<script data-degradation-url="your_degradation_url" src="https://unpkg.com/luda@{{site.luda.version}}/dist/js/luda-degradation.min.js"></script>
```

If you use assets bundlers to import the degeradation script,
make sure it's bundled as a standalone file.
{: .c-danger}

<!-- markdownlint-disable -->
Import in Node.js Apps

``` javascript
import 'luda/src/js/degeradation'
```
{: .mt-small}

Import in Ruby on Rails Apps
{: .mt-medium}

``` javascript
//= require luda-degeradation
```
{: .mt-small}

Import in Hanami Apps
{: .mt-medium}

``` erb
<% javascript 'luda-degeradation' %>
```
{: .mt-small}