---
title: Float
description: Use float utilities to control elements' float properties responsively.
---

## Introduction

Float utilities are classes for setting the value of the
[`float`](https://developer.mozilla.org/en-US/docs/Web/CSS/float) property,
they are responsive and named using the format:
`.f-{value}-{postfix}`. The value can be one of `left`, `right` and `none`.
To clear float, use the `.clear` class.

## Examples

{% capture float %}
<div class="clear bc-dark">
  <p class="f-left f-right-l px-medium bc-primary c-light">.f-left.f-right-l</p>
  <p class="f-right f-left-l px-medium bc-primary c-light">.f-right.f-left-l</p>
</div>
{% endcapture %}
<div class="example">
  {{ float }}
</div>
``` html{{ float }}```