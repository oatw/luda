---
title: Z-index
description: Use z-index utilities to change the layer orders of elements.
---

## Introduction

Z-index utilities are classes for setting the value of the
[`z-index`](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index) property.
They are named using the format `zi-{value}`.
We use meaningful value words in the class names,
all value words are listed in the below table.

<div class="table table-border">
  <table>
    <thead>
      <tr><th>Word</th><th>Value</th></tr>
    </thead>
    <tbody>
      <tr><td>low</td><td>-1</td></tr>
      <tr><td>normal</td><td>0</td></tr>
      <tr><td>high</td><td>1</td></tr>
      <tr><td>higher</td><td>2</td></tr>
      <tr><td>much-higher</td><td>3</td></tr>
      <tr><td>highest</td><td>4</td></tr>
    </tbody>
  </table>
</div>

## Examples

``` html
<div class="zi-low"></div>
<div class="zi-normal"></div>
<div class="zi-high"></div>
<div class="zi-higher"></div>
<div class="zi-much-higher"></div>
<div class="zi-highest"></div>
```

## Sass Variables

{% include doc-sass-variable-z-index.md %}