---
title: Button Icon
description: Wrap icons in buttons to create beautiful icon buttons.
---

## Icon in the Left

To create an icon button with an icon in the left,
add the class `.btn-ico-left` to a button element,
then wrap an icon inside.

{% capture icon_on_the_left %}
<button class="btn btn-primary btn-ico-left btn-small">
  Search <i class="ico ico-search"></i>
</button>
<button class="btn btn-primary btn-ico-left">
  Search <i class="ico ico-search"></i>
</button>
<button class="btn btn-primary btn-ico-left btn-large">
  Search <i class="ico ico-search"></i>
</button>
{% endcapture %}

<div class="button-example">
  {{ icon_on_the_left }}
</div>
``` html{{ icon_on_the_left }}```

## Icon in the Right

To create an icon button with an icon in the right,
add the `.btn-ico-right` class to a button element,
then wrap an icon inside.

{% capture icon_on_the_right %}
<div class="btn-check btn-hollow-primary btn-ico-right btn-small">
  <input type="checkbox">
  <label>Check <i class="ico material-icons">check</i></label>
</div>
<div class="btn-check btn-hollow-primary btn-ico-right">
  <input type="checkbox">
  <label>Check <i class="ico material-icons">check</i></label>
</div>
<div class="btn-check btn-hollow-primary btn-ico-right btn-large">
  <input type="checkbox">
  <label>Check <i class="ico material-icons">check</i></label>
</div>
{% endcapture %}

<div class="button-example">
  {{ icon_on_the_right }}
</div>
``` html{{ icon_on_the_right }}```

## Icon in the Top

To create an icon button with an icon in the top,
add the `.btn-ico-top` class to a button element,
then wrap an icon inside.

{% capture icon_on_the_top %}
<button class="btn btn-primary btn-ico-top btn-small">
  Delete <i class="ico ico-cross"></i>
</button>
<button class="btn btn-primary btn-ico-top">
  Delete <i class="ico ico-cross"></i>
</button>
<button class="btn btn-primary btn-ico-top btn-large">
  Delete <i class="ico ico-cross"></i>
</button>
{% endcapture %}

<div class="button-example">
  {{ icon_on_the_top }}
</div>
``` html{{ icon_on_the_top }}```

## Icon Only

If you just want an icon button without any texts,
you can add the class `.btn-ico` to a button element,
then wrap only an icon inside.

{% capture icon_only %}
<div class="btn-file btn-primary btn-ico btn-small">
  <input type="file">
  <label><i class="ico material-icons">cloud_upload</i></label>
</div>
<div class="btn-file btn-primary btn-ico">
  <input type="file">
  <label><i class="ico material-icons">cloud_upload</i></label>
</div>
<div class="btn-file btn-primary btn-ico btn-large">
  <input type="file">
  <label><i class="ico material-icons">cloud_upload</i></label>
</div>
{% endcapture %}

<div class="button-example">
  {{ icon_only }}
</div>
``` html{{ icon_only }}```

## Sass Variables

``` sass
$button-icon-size-em: 1.286em !default
```

``` sass
$button-icon-top-size-em: 1.5em !default
```

``` sass
$button-icon-left-margin-em: 0 0.4em 0 0 !default
```

``` sass
$button-icon-right-margin-em: 0 0 0 0.4em !default
```

``` sass
$button-icon-top-margin-em: 0 0 0.15em 0 !default
```

``` sass
$button-icon-top-height-rem: 4rem !default
```

``` sass
$button-icon-top-large-height-rem: 5rem !default
```

``` sass
$button-icon-top-small-height-rem: 3rem !default
```