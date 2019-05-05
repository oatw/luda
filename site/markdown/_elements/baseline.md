---
title: Baseline
description: Use baseline gird to keep a harmonious vertical rhythm.
---

## Introduction

The height of baseline grid is set at `1rem` in Luda.
The vertical sizes of most components in Luda are
set at integer multiples of `1rem`,
except for elements without a certain height, like images.

If you want perfect baseline alignment in layouts
which contain elements without a certain height, you need
manually set these elements' vertical sizes
at integer multiples of `1rem`.

You can add the `.baseline` class to the elements' container
to show the baselines, this helps you to check the layouts.

Let's see the below examples.

<!-- markdownlint-disable -->
## Example
{: .mb-small}

{% capture baseline %}
<div class="baseline">
  <!-- Set the height of this div at 3rem. -->
  <div class="bc-primary mb-small" style="height: 3rem"></div>
  <p>
    Once upon time a girl named Cinderella lived with her stepmother and two stepsisters.
    Poor Cinderella had to work hard all day long so the others could rest.
    It was she who had to wake up each morning when it was still dark
    and cold to start the fire. It was she who cooked the meals.
    It was she who kept the fire going. The poor girl could not stay clean,
    from all the ashes and cinders by the fire...</p>
  <button class="btn btn-primary my-small">I Like This</button>
</div>
{% endcapture %}
{{ baseline }}
``` html{{ baseline }}```
<!-- markdownlint-enable -->