---
title: Breadcrumb
description: Indicate to users their current location in a website.
---

## Usage

Add the `.breadcrumb` class to an `<ol>` tag,
then wrap `<a>` tags inside wrapped `<li>` tags.

<ol class="breadcrumb m-none">
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
{: .mt-none}

## States and Colors

A breadcrumb item can be disabled by replace the `<a>` tag with a `<span>` tag
like the below example.

<ol class="breadcrumb m-none">
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
{: .mt-none}

If you want to enhance part of a breadcrumb,
you can use color utility classes for highlighting.
{: .mt-medium}

<ol class="breadcrumb m-none">
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
{: .mt-none}

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
$breadcrumb-spliter-padding-em: 0 1em !default
```