---
title: Tabulate
description: Enhance the behavior of the Tab key for a better interaction experience.
---

## Introduction

Radios can be focused through the arrow keys in native HTML,
many users don't know this. In Luda, we enhanced the behavior
of the `Tab` key for focusing radios more easily.

When a radio is focused, the next radio has the same `name`
can be focused when the `Tab` key pressed and the prev radio has
the same `name` can be focused when the `Tab` key
and the `Shift` key pressed together.
Let's see the below examples.

## Examples

Press the `Tab` key alone or with the `Shift` together to focus these radios.

{% capture tabulate %}
<div class="fm fm-radio">
  <label><input type="radio" name="tabulate_demo" value="one">One</label>
  <label><input type="radio" name="tabulate_demo" value="two">Two</label>
</div>
{% endcapture %}
<div class="example mt-none">
  {{ tabulate }}
</div>
``` html{{ tabulate }}```

## HTML Attributes

### data-tabulate-disabled

``` html
<html data-tabulate-disabled>...</html>
```

Add this attribute to the `<html>` tag to disable the enhancement to the `Tab` key.