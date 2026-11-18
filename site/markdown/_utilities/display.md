---
title: Display
description: Use display utilities to control an element's display property responsively.
---

{% include variables.md %}

## Introduction

Display utilities are classes for setting the value of the `display` property.
The `display` property is widely used in front-end development,
if you're not familiar with it, please read
[this tutorial](https://developer.mozilla.org/en-US/docs/Web/CSS/display)
at first.

Display utility classes are extended with the
[screen width breakpoint postfixes]({{ width_breakpoints }}).
They are named using the format: `.d-{value}-{postfix}`.
The value can be one of `none`, `inline`, `inline-block`, `block`,
`inline-flex`, `flex`, `table`, `table-cell` and `table-row`.

There is also a `.d-none-print` class to hide elements when printing.

## Example

In the following example, we hide the `div` on small screens and large screens,
and show it only on medium-sized screens.

{% capture example %}
<div class="d-none d-block-m d-none-l p-medium bc-primary"></div>
{% endcapture %}
<div class="example d-none d-block-m d-none-l">
  {{ example }}
</div>
``` html{{ example }}```
{: .mt-small.mb-small-m}