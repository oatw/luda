---
title: Disabled
description: Prevent form elements from responding to user actions and being submitted.
---

## Introduction

The `disabled` attribute can be added to buttons or form elements for form control.
A disabled element cannot be focused and doesn't respond to user actions.
If a form element is disabled, it will not be submitted.

In Luda, we add an opacity rule to disabled elements.
Please see the examples below for clarification.

## Examples

### Button

{% capture disabled_button %}
<button class="btn btn-primary" disabled>A disabled button</button>
{% endcapture %}
<div class="example">
  {{ disabled_button }}
</div>
``` html{{ disabled_button }}```

Use the `disabled` attribute to disable a button.

### Form

{% capture disabled_form %}
<div class="fm fm-text" disabled>
  <input disabled placeholder="A disabled text field">
</div>
{% endcapture %}
<div class="example">
  {{ disabled_form }}  
</div>
``` html{{disabled_form}}```

Use the `disabled` attribute to disable a form element.

## Sass Variables

``` sass
$opacity-disabled: $opacity-muted !default
```