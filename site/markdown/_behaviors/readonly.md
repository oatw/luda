---
title: Readonly
description: Prevent form elements from responding to user actions.
---

## Introduction

The native `readonly` attribute makes form elements not editable.
But still focusable, and what's worse, some browsers even show an editable text cursor.

The `readonly` attribute is enhanced in Luda.
A form element has the `readonly` attribute is not focusable nor editable.
Let's see the below examples.

## Examples

Use the `readonly` attribute to prevent the text field from being edited.

{% capture readonly %}
<div class="fm fm-text" readonly>
  <input readonly placeholder="E.g., a readonly text field">
</div>
{% endcapture %}
<div class="example">
  {{ readonly }}
</div>
``` html{{ readonly }}```

## Dynamic Control

In Luda, we use the `[readonly]` selector to detect readonly elements.
If you want to remove the readonly state dynamically in Javascript,
just remove the `readonly` attribute.

``` javascript
luda('#my-readonly-element').removeAttr('readonly')
```

## Sass Variables

``` sass
$opacity-disabled: $opacity-muted !default
```