---
title: Focus
description: Get a better focus effect in all browsers.
---

## Introduction

The native focus behavior of browsers are wired and different.
For better focus effect control, we use the `.focus` class
instead of the `:focus` selector in Luda.

Except form elements, the `.focus` class will be added
to a focusable element only when it's focused through keyboard.
For a form element, the `.focus` class will be added no matter how it's focused.

## Examples

### Link

This link will show an outline only when it's focused through keyboard.

<p class="example mt-none">
  <a href="#" data-turbolinks="false">Focus me by pressing the tab key.</a>
</p>
``` html
<a href="#">Focus this link</a>
```

### Button

This button will show an outline only when it's focused through keyboard.

{% capture button_focus %}
<button class="btn btn-primary">Focus me through keyboard</button>
{% endcapture %}
<div class="example">
  {{ button_focus }}
</div>
``` html{{ button_focus }}```

### Form

The border color of this text field will be changed
no matter how the text field is focused.

{% capture form_focus %}
<div class="fm fm-text">
  <input placeholder="A text filed">
</div>
{% endcapture %}
<div class="example">
  {{ form_focus }}
</div>
``` html{{ form_focus }}```

## HTML Attributes

### data-focus-disabled

``` html
<html data-focus-disabled>...</html>
```

Add this attribute to the `<html>` tag to disable the enhancement
to browser's native focus behavior.