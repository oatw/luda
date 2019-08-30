---
title: Disabled
description: Prevent form elements from responding to user actions and being submitted.
---

## Introduction

The native `disabled` attribute can be added to form elements for form control.
A disabled element cannot be focused and doesn't respond to user actions.
If a form element is disabled, it will not be submitted.

In Luda, we enhanced the `disabled` attribute, it can be added to any elements to
prevent responding to user actions.
Please see the examples below for clarification.

## Disabled Buttons

Use the `disabled` attribute to disable a button.

{% capture disabled_button %}
<button class="btn btn-primary" disabled>A disabled button</button>
{% endcapture %}
<div class="example">
  {{ disabled_button }}
</div>
``` html{{ disabled_button }}```

## Diabled Forms

Use the `disabled` attribute to disable a form element.

{% capture disabled_form %}
<div class="fm fm-text" disabled>
  <input disabled placeholder="E.g., a disabled text field">
</div>
{% endcapture %}
<div class="example">
  {{ disabled_form }}  
</div>
``` html{{disabled_form}}```

## Other Examples

Use the `disabled` attribute to disable a link.
{: .mb-none}

{% capture link %}
<a href="#" disabled>A disabled link</a>
{% endcapture %}
<p class="example my-none">
  {{ link }}
</p>
``` html{{ link }}```
{: .mt-small}

## Dynamic Control

In Luda, we use the `[disabled]` selector to detect disabled elements.
If you want to remove the disabled state dynamically in Javascript,
just remove the `disabled` attribute.

``` javascript
luda('#my-disabled-element').removeAttr('disabled')
```

## Sass Variables

``` sass
$opacity-disabled: $opacity-muted !default
```