---
title: Breadcrumb
description: Indicate to users their current location in a website.
---

## Usage

Add the `.breadcrumb` class to an `<ol>` tag,
then wrap `<a>` tags inside wrapped `<li>` tags.

<ol class="breadcrumb">
  <li><a href="#" data-turbolinks="false">Luda</a></li>
  <li><a href="#" data-turbolinks="false">Patterns</a></li>
  <li><a href="#" data-turbolinks="false">Breadcrumb</a></li>
</ol>
``` html
<ol class="breadcrumb">
  <li><a href="#">Luda</a></li>
  <li><a href="#">Patterns</a></li>
  <li><a href="#">Breadcrumb</a></li>
</ol>
```

## States and Colors

A breadcrumb item can be disabled by replace the `<a>` tag with a `<span>` tag
like the below example.

<ol class="breadcrumb">
  <li><a href="#" data-turbolinks="false">Luda</a></li>
  <li><a href="#" data-turbolinks="false">Patterns</a></li>
  <li><span>Breadcrumb</span></li>
</ol>
``` html
<ol class="breadcrumb">
  <li><a href="#">Luda</a></li>
  <li><a href="#">Patterns</a></li>
  <li><span>Breadcrumb</span></li>
</ol>
```

If you want to enhance part of a breadcrumb,
you can use color utility classes for highlighting.
{: .mt-small}

<ol class="breadcrumb">
  <li><a href="#" data-turbolinks="false">Luda</a></li>
  <li><a href="#" data-turbolinks="false">Patterns</a></li>
  <li><a class="c-primary" href="#" data-turbolinks="false">Breadcrumb</a></li>
</ol>
``` html
<ol class="breadcrumb">
  <li><a href="#">Luda</a></li>
  <li><a href="#">Patterns</a></li>
  <li><a class="c-primary" href="#">Breadcrumb</a></li>
</ol>
```

## Sass Variables

``` sass
$breadcrumb-padding-rem: $spacing-small-rem 0 !default
```

``` sass
$breadcrumb-color: $color-muted !default
```

``` sass
$breadcrumb-spliter: "/" !default
```

``` sass
$breadcrumb-spliter-padding-em: 0 strip-unit($spacing-tiny-rem) * 1em !default
```