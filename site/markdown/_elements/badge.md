---
title: Badge
description: Badge is designed to show short text in notifications.
---

## Examples

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
{: .mt-small}

{% capture badge_baseline %}
<button class="btn btn-hollow-primary">
  Messages <span class="badge">22</span>
</button>
{% endcapture %}
<div class="button-example">
  {{ badge_baseline }}
</div>
``` html{{ badge_baseline }}```

## Colors and Backgrounds

Change the color and background of the badge
with color utilities and background utilities.

{% capture badge_color_and_background %}
<button class="btn btn-dark">
  Messages <span class="badge c-dark bc-light">99+</span>
</button>
{% endcapture %}
<div class="button-example">
  {{ badge_color_and_background }}
</div>
``` html{{ badge_color_and_background }}```

## Sass Variables

### Size

``` sass
$badge-margin-left-em: 0.5em !default
```

``` sass
$badge-horizontal-padding-em: 0.4em !default
```

### Others

``` sass
$badge-background: $background-color-primary !default
```

``` sass
$badge-color: $color-inverse-emphasis !default
```