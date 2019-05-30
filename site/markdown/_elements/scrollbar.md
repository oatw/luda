---
title: Scrollbar
description: Scrollbar styles are rewritten in CSS for a better appearance.
---

## Introduction

The scrollbar styles are written in pure CSS in Luda,
the customized styles only shows for screens larger than the `m` width breakpoint.
The styles only work for Webkit browsers and Edge browsers
since Firefox doesn't support customizing scrollbar appearances in CSS.

## Examples

In the below example, customized scrollbar styles shows
on middle size screens and large screens.

<div style="height:10rem" class="example bc-dark of-auto">
  <div style="width:100vw;height:20rem"></div>
</div>

## Sass Variables

``` sass
$scrollbar-width-breakpoint: m !default
```

Default start breakpoint to show customized scrollbar styles.

``` sass
$scrollbar-breakpoint-vertical-width-rem: $spacing-tiny-rem !default
```

Default vertical scrollbar width for webkit browsers.

<!-- markdownlint-disable -->
``` sass
$scrollbar-breakpoint-horizontal-height-rem: $scrollbar-breakpoint-vertical-width-rem !default
```

Default horizontal scrollbar height for webkit browsers.

``` sass
$scrollbar-thumb-background: rgba(lighten($color-muted, 10%), $opacity-more-muted) !default
```
<!-- markdownlint-enable -->

Default scrollbar thumb background for webkit browsers.

``` sass
$scrollbar-thumb-border-radius: $scrollbar-breakpoint-vertical-width-rem !default
```

Default scrollbar thumb border radius for webkit browsers.

``` sass
$scrollbar-edge-overflow-style: -ms-autohiding-scrollbar !default
```

Default scrollbar overflow style for Edge browsers.