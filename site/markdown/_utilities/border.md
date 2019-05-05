---
title: Border
description: Use border utilities to remove unnecessary borders of elements.
---

## Introduction

Many designers like to seperate elements by lines.
Maybe because of this, many UI frameworks provide visible border
and divider components.
A heavy use of dividers leads to visual noise and dense,
it makes interfaces crowded. It's not the modern way.

A better way to seperate elements is grouping and dividing elements
through spacing and contrast by considering
the functions and meanings of them.
In this way, your interfaces will be simple and clean.
So, there're no visible border utilities in Luda by default,
only utilities for removing unnecessary borders are provided in Luda.

Border utilities are named using the format `.bd-{direction}-none`.
If the `{direction}` part is not included, it means all directions.

## Examples

{% capture border %}
<div style="height: 3rem; border: solid 2px #000" class="bd-t-none mb-small bc-muted"></div>
<div style="height: 3rem; border: solid 2px #000" class="bd-r-none mb-small bc-muted"></div>
<div style="height: 3rem; border: solid 2px #000" class="bd-b-none mb-small bc-muted"></div>
<div style="height: 3rem; border: solid 2px #000" class="bd-l-none mb-small bc-muted"></div>
<div style="height: 3rem; border: solid 2px #000" class="bd-none mb-small bc-muted"></div>
{% endcapture %}
<div class="example">
  {{ border }}
</div>
``` html{{ border }}```