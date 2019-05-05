---
title: Badge
description: Badge is designed to show short text in notifications.
---

## Badge Styles

### Badge

Badge is simple to create,
just add the `.badge` class to an inline element.
Let's see the below examples.

{% capture badge %}
<p>
  You have new messages <span class="badge">8</span>
</p>
{% endcapture %}
{{ badge }}
``` html{{ badge }}```

### Align to Baseline

If you want a badge aligned to text baseline,
replace the `.badge` class with the `.badge-baseline` class.

{% capture badge_baseline %}
<button class="btn btn-hollow-primary">
  Messages <span class="badge-baseline">22</span>
</button>
{% endcapture %}
<div class="button-example">
  {{ badge_baseline }}
</div>
``` html{{ badge_baseline }}```

### Colors and Backgrounds

Change the color and background of the badge
with color utilities and background utilities.

{% capture badge_color_and_background %}
<button class="btn btn-dark">
  Messages <span class="badge-baseline c-dark bc-light">99+</span>
</button>
{% endcapture %}
<div class="button-example">
  {{ badge_color_and_background }}
</div>
``` html{{ badge_color_and_background }}```

## Sass Variables

### Size

``` sass
$badge-offset-top-em: -0.4em !default
```

``` sass
$badge-offset-left-em: 0.4em !default
```

``` sass
$badge-height-em: 1.2em !default
```

``` sass
$badge-padding-em: 0.4em !default
```

### Others

``` sass
$badge-background: $background-color-primary !default
```

``` sass
$badge-color: $color-inverse-emphasis !default
```