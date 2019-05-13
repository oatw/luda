---
title: Form Icon
description: An icon can be wrapped in the left or right of a form element.
---

## Icon in the Left

To wrap an icon in the left of a form element,
add the `.fm-ico-left` class to the `.fm` container,
then wrap an icon element inside.

{% capture left %}
<div class="fm fm-text fm-ico-left fm-small">
  <input name="example1" placeholder="Search anything...">
  <i class="ico ico-search"></i>
</div>
<div class="fm fm-text fm-ico-left">
  <input name="example2" placeholder="Search anything...">
  <i class="ico ico-search"></i>
</div>
<div class="fm fm-text fm-ico-left fm-large">
  <input name="example3" placeholder="Search anything...">
  <i class="ico ico-search"></i>
</div>
{% endcapture %}
<div class="form-example">
  {{ left }}
</div>
``` html{{ left }}```

## Icon in the Right

To wrap an icon in the right of a form element,
add the `.fm-ico-right` class to the `.fm` container,
then wrap an icon element inside.

{% capture right %}
<div class="fm fm-select fm-ico-right fm-small">
  <select name="example4" placeholder="E.g., Gamil">
    <option value="gmail">Gmail</option>
    <option value="hotmail">Hotmail</option>
  </select>
  <i class="ico material-icons">mail</i>
</div>
<div class="fm fm-select fm-ico-right">
  <select name="example5" placeholder="E.g., Gamil">
    <option value="gmail">Gmail</option>
    <option value="hotmail">Hotmail</option>
  </select>
  <i class="ico material-icons">mail</i>
</div>
<div class="fm fm-select fm-ico-right fm-large">
  <select name="example6" placeholder="E.g., Gamil">
    <option value="gmail">Gmail</option>
    <option value="hotmail">Hotmail</option>
  </select>
  <i class="ico material-icons">mail</i>
</div>
{% endcapture%}
<div class="form-example">
  {{ right }}
</div>
``` html{{ right }}```

## Sass Variables

``` sass
$form-element-icon-size-em: null !default
```

``` sass
$form-element-icon-color: lighten($color-muted, 10%) !default
```

``` sass
$form-element-icon-color-on-error: $form-element-border-color-on-error !default
```

``` sass
$form-element-icon-color-on-focus: $form-element-border-color-on-focus !default
```