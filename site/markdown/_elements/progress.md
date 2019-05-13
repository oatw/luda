---
title: Progress
description: Progress is designed to show in-progress data.
---

## Usage

A progress bar is offen used to show in-progress data
like loading progress. They can be created by wrapping `.progress-bar`s
inside a `.progress` container.

In the below example, a single progress bar is wrapped in a `.progress`
container, its width is controlled with the size utility class `.w-25`.

{% capture usage %}
<div class="progress">
  <div class="progress-bar w-25">25%</div>
</div>
{% endcapture %}
<div class="example">
  {{ usage }}
</div>
``` html{{ usage }}```
{: .mt-small}

## Background

The background of a progress bar can be changed by
using the background utilities.

{% capture backgrounds %}
<div class="progress">
  <div class="progress-bar w-25">25%</div>
  <div class="progress-bar w-33 bc-danger">33%</div>
  <div class="progress-bar w-33 bc-dark">33%</div>
</div>
{% endcapture %}
<div class="example">
  {{ backgrounds }}
</div>
``` html{{ backgrounds }}```

## Height

In the below example, the height of the progress bar is changed
by adding an inline style to its `.progress` container.
Of course, you'd better change the height in stylesheets in real projects.

{% capture height %}
<div class="progress" style="height:1rem">
  <div class="progress-bar w-25"></div>
  <div class="progress-bar bc-danger w-50"></div>
</div>
{% endcapture %}
<div class="example">
  {{ height }}
</div>
``` html{{ height }}```

## Sass Variables

### Size

``` sass
$progress-height-rem: baseline(2) !default
```

``` sass
$progress-bar-min-width-em: 3em !default
```

``` sass
$progress-bar-padding: 0 $spacing-tiny-rem !default
```

### Others

``` sass
$progress-bar-typography-size-level: 7 !default
```

The value must be an integer between 5 and 8.

``` sass
$progress-bar-color: $color-inverse-main !default
```

``` sass
$progress-border-radius: $border-radius-main !default
```

``` sass
$progress-background: $background-color-muted !default
```

``` sass
$progress-bar-background: $background-color-primary !default
```