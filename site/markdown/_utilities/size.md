---
title: Size
description: Use size utilities to control an element's width and height responsively.
---

{% include variables.md %}

## Responsive Sizes

Size utility classes are extended with the
[screen width breakpoint postfixes]({{ width_breakpoints }}),
they can be used to control an element's size responsively.
Width classes are named using the format: `.w-{value}-{postfix}`,
and height classes are named using the format: `.h-{value}-{postfix}`.
The value can be one of `25`, `33`, `50`, `66`, `75`, `100` and `auto`.

### Widths

{% capture width %}
<div class="bc-dark">
  <p class="w-auto px-small d-inline-block va-top bc-primary c-light">.w-auto</p>
  <p class="w-25 px-small bc-danger c-light">.w-25</p>
  <p class="w-33 px-small bc-primary c-light">.w-33</p>
  <p class="w-50 px-small bc-danger c-light">.w-50</p>
  <p class="w-66 px-small bc-primary c-light">.w-66</p>
  <p class="w-75 px-small bc-danger c-light">.w-75</p>
  <p class="w-100 px-small bc-primary c-light">.w-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ width }}
</div>
``` html{{ width }}```

### Heights

{% capture height %}
<div class="d-flex bc-dark" style="height: 21rem">
  <p class="h-25 px-tiny bc-primary c-light">.h-25</p>
  <p class="h-33 px-tiny bc-danger c-light">.h-33</p>
  <p class="h-50 px-tiny bc-primary c-light">.h-50</p>
  <p class="h-66 px-tiny bc-danger c-light">.h-66</p>
  <p class="h-75 px-tiny bc-primary c-light">.h-75</p>
  <p class="h-100 px-tiny bc-danger c-light">.h-100</p>
  <p class="h-auto px-tiny bc-primary c-light">.h-auto</p>
</div>
{% endcapture %}
<div class="example">
  {{ height }}
</div>
``` html{{ height }}```

## Size Limitations

Size limitation utilities are not responsive,
they're used to limit the size of an element.

### Width Limitations

The `.max-w-100` class limits the maximum width of an element to `100%`.

The `.min-w-100` class limits the minimum width of an element to `100%`.

The `.min-w-100vw` class limits the minimum width of an element to `100vw`.

{% capture max_w_100 %}
<div class="bc-dark">
  <p style="width: 200%" class="max-w-100 px-small bc-primary c-light">.max-w-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ max_w_100 }}
</div>
``` html{{ max_w_100 }}```

{% capture min_w_100 %}
<div class="bc-dark">
  <p style="width: 20%" class="min-w-100 px-small bc-primary c-light">.min-w-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ min_w_100 }}
</div>
``` html{{ min_w_100 }}```

{% capture min_w_100vw %}
<div class="bc-dark">
  <p style="width: 20%" class="min-w-100vw px-small bc-primary c-light">.min-w-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ min_w_100vw }}
</div>
``` html{{ min_w_100vw }}```

### Height Limitations

The `.max-h-100` class limits the maximum height of an element to `100%`.

The `.min-h-100` class limits the minimum height of an element to `100%`.

The `.min-h-100vh` class limits the minimum height of an element to `100vh`.

{% capture max_h_100 %}
<div class="bc-dark" style="height: 6rem">
  <p style="height: 200%" class="max-h-100 px-small bc-primary c-light">.max-h-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ max_h_100 }}
</div>
``` html{{ max_h_100 }}```

{% capture min_h_100 %}
<div class="bc-dark" style="height: 6rem">
  <p class="min-h-100 px-small bc-primary c-light">.min-h-100</p>
</div>
{% endcapture %}
<div class="example">
  {{ min_h_100 }}
</div>
``` html{{ min_h_100 }}```

{% capture min_h_100vh %}
<div class="bc-dark">
  <p class="min-h-100vh px-small bc-primary c-light">.min-h-100vh</p>
</div>
{% endcapture %}
<div class="example">
  {{ min_h_100vh }}
</div>
``` html{{ min_h_100vh }}```