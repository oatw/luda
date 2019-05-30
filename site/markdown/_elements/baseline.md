---
title: Baseline
description: Use baseline gird to keep a harmonious vertical rhythm.
---

## Introduction

The height of baseline grid is decided by `$baseline-height-px` in Luda.
The vertical sizes of most components in Luda are
set at integer multiples of calculated baseline height `rem`s,
except for elements without a certain height, like images.

If you want perfect baseline alignment in layouts
which contain elements without a certain height, you need
manually set these elements' vertical sizes
at integer multiples of baseline height `rem`s.
There're two recommended ways to get baseline height,
use the sass function `baseline($count: 1)` or the CSS variable
`var(--baseline)`.

For calculation convinence, the font size of `<html>` is set
at the value of `$baseline-height-px`, except when the value of
`$baseline-height-px` is less than `12px`(minimal font size in
most browsers). If you don't need set the value of `$baseline-height-px`
to a value less than `12px`, you can use `1rem` instead of
`baseline($count: 1)` and `var(--baseline)`.

You can add the `.baseline` class to the elements' container
to show the baselines, this helps you to check the layouts.
Let's see the below examples.

<!-- markdownlint-disable -->
## Examples

{% capture baseline %}
<div class="baseline">
  <!-- Set the height of this div at 3 times of baseline height. -->
  <div class="bc-primary mb-small" style="height: calc(var(--baseline) * 3)"></div>
  <p>
    Once upon time a girl named Cinderella lived with her stepmother and two stepsisters.
    Poor Cinderella had to work hard all day long so the others could rest.
    It was she who had to wake up each morning when it was still dark
    and cold to start the fire. It was she who cooked the meals.
    It was she who kept the fire going. The poor girl could not stay clean,
    from all the ashes and cinders by the fire...</p>
  <button class="btn btn-primary mt-small">I Like This</button>
</div>
{% endcapture %}
{{ baseline }}
``` html{{ baseline }}```
<!-- markdownlint-enable -->

## Sass Functions

``` text
baseline($count: 1)
```

Get baseline height in `rem`s by passing in a number.

## CSS Variables

``` css
var(--baseline)
```

One baseline height in `rem`.