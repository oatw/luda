---
title: Button Group
description: Button group is designed to group buttons have similiar functions together.
---

## Horizontal Button Group

Add the `.btns-x` class to a container, then wrap buttons inside
to create a horizontal button group.

{% capture button_group_x %}
<div class="btns-x">
  <button class="btn btn-primary">One</button>
  <button class="btn btn-primary">Two</button>
  <button class="btn btn-primary">Three</button>
</div>
<div class="btns-x">
  <div class="btn-check btn-hollow-primary">
    <input type="checkbox">
    <label>Check</label>
  </div>
  <div class="btn-radio btn-hollow-primary">
    <input type="radio">
    <label>Radio</label>
  </div>
  <div class="btn-file btn-hollow-primary">
    <input type="file">
    <label>File</label>
  </div>
</div>
{% endcapture%}
<div class="button-example">
  {{ button_group_x}}  
</div>
``` html{{ button_group_x }}```

## Vertical Button Group

Add the `.btns-y` class to a container, then wrap buttons inside
to create a vertical button group.

{% capture button_group_y %}
<div class="btns-y">
  <button class="btn btn-ico-left btn-hollow-secondary">One <i class="ico ico-plus"></i></button>
  <button class="btn btn-ico-left btn-hollow-secondary">Two <i class="ico ico-cross"></i></button>
  <button class="btn btn-ico-left btn-hollow-secondary">Three <i class="ico ico-search"></i></button>
  <button class="btn btn-ico-left btn-hollow-secondary">Four <i class="ico ico-menu"></i></button>
</div>
<div class="btns-y">
  <button class="btn btn-ico btn-primary"><i class="ico ico-up"></i></button>
  <button class="btn btn-ico btn-primary"><i class="ico ico-right"></i></button>
  <button class="btn btn-ico btn-primary"><i class="ico ico-down"></i></button>
  <button class="btn btn-ico btn-primary"><i class="ico ico-left"></i></button>
</div>
{% endcapture%}
<div class="button-example">
  {{ button_group_y }}
</div>
``` html{{ button_group_y }}```

## Style Modifiers

### Fluid{% include modifier.md %}

A fluid button group takes all the availiable horizontal space.
To make a fluid button group, add the `.btns-fluid` class to the
`.btns-x` container or the `.btns-y` container.

{% capture button_group_fluid %}
<div class="btns-x btns-fluid">
  <button class="btn btn-ico-top btn-primary">Add <i class="ico ico-plus"></i></button>
  <button class="btn btn-ico-top btn-primary">Search <i class="ico ico-search"></i></button>
  <button class="btn btn-ico-top btn-primary">Delete <i class="ico ico-cross"></i></button>
</div>
<div class="btns-y btns-fluid">
  <button class="btn btn-ico-left btn-hollow-secondary">Add <i class="ico ico-plus"></i></button>
  <button class="btn btn-ico-left btn-hollow-secondary">Search <i class="ico ico-search"></i></button>
  <button class="btn btn-ico-left btn-hollow-secondary">Delete <i class="ico ico-cross"></i></button>
</div>
{% endcapture %}
<div class="button-example">
  {{ button_group_fluid }}
</div>
``` html{{ button_group_fluid }}```

### Margin{% include modifier.md %}

If you want to split buttons in a button group, you can use the `.btns-margin` class.
This modifier adds margins at the right and bottom of wrapped buttons.

{% capture button_group_margin %}
<div class="btns-y btns-margin">
  <button class="btn btn-hollow-primary">One</button>
  <button class="btn btn-hollow-primary">Two</button>
  <button class="btn btn-hollow-primary">Three</button>
</div>
<div class="btns-x btns-margin">
  <button class="btn btn-hollow-secondary">1</button>
  <button class="btn btn-hollow-secondary" disabled>...</button>
  <button class="btn btn-dark">5</button>
  <button class="btn btn-hollow-secondary" disabled>...</button>
  <button class="btn btn-hollow-secondary">9</button>
</div>
{% endcapture %}
<div class="button-example">
  {{ button_group_margin }}
</div>
``` html{{ button_group_margin }}```

## Sass Variables

``` sass
$button-group-box-shadow: null !default
```

``` sass
$button-group-buttons-margin-rem: 0 $spacing-small-rem $spacing-small-rem 0 !default
```

Default margins of buttons wrapped in button groups
which have the `.btns-margin` class.