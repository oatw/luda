---
title: Alignment
description: Use alignment utilities to change the vertical alignment of elements.
---

## Introduction

Alignment utilities are classes for setting the value of the `vertical-align` property.
The `vertical-align` property sets vertical alignment of an inline
or table-cell box, if you're not familiar with this property, please read
[this tutorial](https://developer.mozilla.org/en-US/docs/Web/CSS/vertical-align)
at first.

Availiable classes include: `.va-top`, `.va-middle`, `.va-bottom`, `.va-baseline`,
`.va-text-top` and `.va-text-bottom`.

Let's see how they affect the alignment of elements in the below example.

## Example

{% capture alignment %}
<span class="va-top">top</span>
<span class="va-middle">middle</span>
<span class="va-bottom">bottom</span>
<span class="va-baseline">baseline</span>
<span calss="va-text-top">text-top</span>
<span calss="va-text-bottom">text-bottom</span>
{% endcapture %}
<div class="example baseline">
  <p class="p3 d-inline-block">Here are some texts aligned at:</p>
  {{ alignment }}
</div>
``` html{{ alignment }}```