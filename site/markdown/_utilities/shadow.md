---
title: Shadow
description: Use shadow utilities to add shadows to an element to enhance its layer effect.
---

## Introduction

Shadow utilities are classes for setting the value of the
[`box-shadow`](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow) property.
They are usually used to add layer effects to elements.

There're three built-in shadow classes: `.sd-low`, `.sd-normal` and `.sd-high`.
You can preview their effects in the below example.

If you want to remove the shadow effects of an element,
add the `.sd-none` class to it.

## Examples

{% capture shadow %}
<p class="sd-low px-medium mb-medium">.sd-low</p>
<p class="sd-normal px-medium mb-medium">.sd-normal</p>
<p class="sd-high px-medium mb-medium">.sd-high</p>
<p class="sd-none px-medium" style="box-shadow: 10px 10px 10px rgba(0,0,0,0.5)">.sd-none</p>
{% endcapture %}

<div class="example">
  {{ shadow }}
</div>
``` html{{ shadow }}```

## Sass Variables

{% include doc-sass-variable-shadow.md %}