---
title: Overlay
description: Use the overlay classes to cover the document viewport and show dialogs.
---

## Usage

If you need show some contents with a cover on the document viewport,
you can use the `.overlay` class to create the cover,
and wrap the `.overlay-body` container which contains the contents
in the cover.
Let's see the below example.

<!-- markdownlint-disable -->
{% capture overlay %}
<!-- Create a trigger to activate the overlay -->
<button class="btn btn-primary" data-toggle-for="overlay">Click me to activate the overlay</button>
<!-- The cover on the document viewport -->
<div class="overlay" data-toggle-target="overlay" data-toggle>
  <!-- The content in the overlay -->
  <div class="overlay-body bc-light">
    Content
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ overlay }}
</div>
``` html{{ overlay }}```
<!-- markdownlint-enable -->

## Sass Variables

``` sass
$overlay-background: rgba($background-color-dark, $opacity-main) !default
```