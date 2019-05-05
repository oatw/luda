---
title: Shape
description: Use shape utilities to quickly change the shape of an element.
---

## Introduction

Shape utilities are classes for setting the value of the
[`border-radius`](https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius)
property. They are named using the format: `.{shape}-{direction}`.
Like some other utility classes,
we use the first letter of each direction for short.
All direction abbreviations are listed in the below table.

<div class="table table-border my-small">
  <table>
    <thead>
      <tr><th>Abbreviation</th><th>Direction</th></tr>
    </thead>
    <tbody>
      <tr><td>t</td><td>top</td></tr>
      <tr><td>r</td><td>right</td></tr>
      <tr><td>b</td><td>bottom</td></tr>
      <tr><td>l</td><td>left</td></tr>
    </tbody>
  </table>
</div>

## Rounded

Rounded shape utilities set a small `border-radius` value(2px by default) to elements.
Let's see the effects in the below gallery.

<div class="d-flex example mb-none">
  <div class="mr-small mb-small">
    <div class="p-medium rounded-t bc-primary"></div>
    <p class="p6 ta-center">.rounded-t</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium rounded-r bc-primary"></div>
    <p class="p6 ta-center">.rounded-r</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium rounded-b bc-primary"></div>
    <p class="p6 ta-center">.rounded-b</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium rounded-l bc-primary"></div>
    <p class="p6 ta-center">.rounded-l</p>
  </div>
  <div class="mb-small">
    <div class="p-medium rounded bc-primary"></div>
    <p class="p6 ta-center">.rounded</p>
  </div>
</div>

``` html
<div class="rounded-t"></div>
<div class="rounded-r"></div>
<div class="rounded-b"></div>
<div class="rounded-l"></div>
<div class="rounded"></div>
```

## Circle

Circle utilities add a very large `border-radius` to elements
to make them more rounded.
Let's preview the effects in the below gallery.

<div class="d-flex example mb-none">
  <div class="mr-small mb-small">
    <div class="p-medium circle-t bc-primary"></div>
    <p class="p6 ta-center">.circle-t</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium circle-r bc-primary"></div>
    <p class="p6 ta-center">.circle-r</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium circle-b bc-primary"></div>
    <p class="p6 ta-center">.circle-b</p>
  </div>
  <div class="mr-small mb-small">
    <div class="p-medium circle-l bc-primary"></div>
    <p class="p6 ta-center">.circle-l</p>
  </div>
  <div class="mb-small">
    <div class="p-medium circle bc-primary"></div>
    <p class="p6 ta-center">.circle</p>
  </div>
</div>

``` html
<div class="circle-t"></div>
<div class="circle-r"></div>
<div class="circle-b"></div>
<div class="circle-l"></div>
<div class="circle"></div>
```

## Sharp

Sharp utilities set the value of the `border-radius` property to `0`,
it's usually used to remove an element's border radius.

<div class="d-flex example mb-none">
  <div class="mr-small mb-small">
    <div style="border-radius: 10px" class="p-medium sharp-t bc-primary"></div>
    <p class="p6 ta-center">.sharp-t</p>
  </div>
  <div class="mr-small mb-small">
    <div style="border-radius: 10px" class="p-medium sharp-r bc-primary"></div>
    <p class="p6 ta-center">.sharp-r</p>
  </div>
  <div class="mr-small mb-small">
    <div style="border-radius: 10px" class="p-medium sharp-b bc-primary"></div>
    <p class="p6 ta-center">.sharp-b</p>
  </div>
  <div class="mr-small mb-small">
    <div style="border-radius: 10px" class="p-medium sharp-l bc-primary"></div>
    <p class="p6 ta-center">.sharp-l</p>
  </div>
  <div class="mb-small">
    <div style="border-radius: 10px" class="p-medium sharp bc-primary"></div>
    <p class="p6 ta-center">.sharp</p>
  </div>
</div>

``` html
<div style="border-radius: 10px" class="sharp-t"></div>
<div style="border-radius: 10px" class="sharp-r"></div>
<div style="border-radius: 10px" class="sharp-b"></div>
<div style="border-radius: 10px" class="sharp-l"></div>
<div style="border-radius: 10px" class="sharp"></div>
```

## Sass Variables

{% include doc-sass-variable-shape.md %}