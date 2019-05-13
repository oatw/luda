---
title: Position
description: Use position utilities to control elements' positions in different containers.
---

## Introduction

Position utilities are classes for setting the
[`position`](https://developer.mozilla.org/en-US/docs/Web/CSS/position) of an element.
You can use the `.rel`, `.abs`, `.fix`, `.sti`, `.sta` classes
to set the value of an element's position property to
`relative`, `absolute`, `fixed`, `sticky` and `static`.

``` html
<div class="rel"></div>
<div class="abs"></div>
<div class="fix"></div>
<div class="sti"></div>
<div class="sta"></div>
```

## Align to Edges

There're some additonal classes for quickly align an element
to the edges of its ancestor or the document viewport.
They are named using the formats:
`.abs-{position}`, `.fix-{position}`, `.sti-{position}`.
We use the first letter of each position word for short,
all position abbreviations are listed in the below table.

<div class="table table-border">
  <table>
    <thead>
      <tr><th>Abbreviation</th><th>Position</th></tr>
    </thead>
    <tbody>
      <tr><td>t</td><td>top</td></tr>
      <tr><td>r</td><td>right</td></tr>
      <tr><td>b</td><td>bottom</td></tr>
      <tr><td>l</td><td>left</td></tr>
    </tbody>
  </table>
</div>

### Examples

{% capture position %}
<div class="rel bc-dark" style="height: 9rem">
  <p class="abs-t abs-l px-small bc-primary c-light">.abs-t.abs-l</p>
  <p class="abs-b abs-r px-small bc-primary c-light">.abs-b.abs-r</p>
  <!-- Use margin utilities to add some spacing. -->
  <p class="abs-t abs-r mt-small mr-small px-small bc-danger c-light">.abs-t.abs-r</p>
  <p class="abs-b abs-l ml-small mb-small px-small bc-danger c-light">.abs-b.abs-l</p>
</div>
{% endcapture %}
<div class="example">
  {{ position }}
</div>
``` html{{ position }}```