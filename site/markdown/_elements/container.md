---
title: Container
description: A easy way to add paddings around content
             and make content aligned in the horizontal center.
---

## Introduction

The container is just a `<div>` has surrounding paddings
and a max width limit.
It will be positioned in the horizontal center when
available horizontal space is larger than the max width limit.

{% capture container %}
<div class="container bc-primary">
  <p class="bc-dark c-light ta-center">A paragraph wrapped in a container.</p>
</div>
{% endcapture %}
<div class="example">
  {{ container }}
</div>
``` html{{ container }}```

## Sass Variables

``` sass
$container-max-width-rem: px-to-rem(1366px) !default
```

``` sass
$container-padding-rem: $spacing-medium-rem $spacing-small-rem !default
```