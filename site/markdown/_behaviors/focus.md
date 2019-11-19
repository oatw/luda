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

## Link Examples

This link will show an outline only when it's focused through keyboard.
{: .mb-none}

<p class="example my-none">
  <a href="#" data-turbolinks="false">Focus me by pressing the tab key.</a>
</p>
``` html
<a href="#">Focus this link</a>
```
{: .mt-small}

## Button Examples

This button will show an outline only when it's focused through keyboard.

{% capture button_focus %}
<button class="btn btn-primary">Focus me through keyboard</button>
{% endcapture %}
<div class="example">
  {{ button_focus }}
</div>
``` html{{ button_focus }}```

## Form Examples

The border color of this text field will be changed
no matter how the text field is focused.

{% capture form_focus %}
<div class="fm fm-text">
  <input placeholder="E.g., focus behavior in a text field">
</div>
{% endcapture %}
<div class="example">
  {{ form_focus }}
</div>
``` html{{ form_focus }}```

## HTML Attributes

### data-focus="false"

``` html
<!-- @example
Add data-focus="false" to the <html> tag to disable
the enhancement to browser's native focus behavior.
-->
<html data-focus="false">...</html>
```

## Javascript Methods

### luda(selector).focus(addClass, preventScroll)

``` bash
@param {LudaSelector} selector
@param {boolean} [addClass=true]
@param {boolean} [preventScroll=false]
@returns {LudaInstance}
```

``` javascript
// @example Focus a target by passing in a selector.
luda('#my-focusable').focus()
```

### luda(selector).blur()

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

``` javascript
// @example Blur a target by passing in a selector.
luda('#my-focusable').blur()
```