---
title: Enter
description: Enhance the behavior of the enter key for a better interaction experience.
---

## Introduction

In native HTML, the `click` event is triggered on limited elements
when the `Enter` key pressed. In Luda, checkboxes, radios and elements
have a none negative `tabindex` attribute are enhanced.
The `click` event will be triggered on them when they're focused
and the `Enter` key pressed. In some situations,
this helps to improve interaction experience.
Let's see the below examples for clarification.

## Checkbox Examples

States of these two checkboxes will be changed,
when focused and the `Enter` key pressed.

{% capture checkbox %}
<div class="fm fm-check">
  <label>
    <input type="checkbox" name="example1" value="1"> One
  </label>
  <label>
    <input type="checkbox" name="example1" value="2"> Two
  </label>
</div>
{% endcapture %}
<div class="example mt-none">
  {{ checkbox }}
</div>
``` html{{ checkbox }}```

## Radio Examples

Focus these radios by pressing the `Tab` key, then press the `Enter` key
to see what will happen.

{% capture radio %}
<div class="fm fm-radio">
  <label>
    <input type="radio" name="example2" value="1"> One
  </label>
  <label>
    <input type="radio" name="example2" value="2"> Two
  </label>
</div>
{% endcapture %}
<div class="example mt-none">
  {{ radio }}
</div>
``` html{{ radio }}```

## Tabindex Examples

<!-- markdownlint-disable -->
{% capture tabindex %}
<div class="bc-primary p-small my-small c-light" tabindex="0" onclick="alert('clicked')">
  Focus this div by pressing the Tab key, then press the Enter key to see what will happen.
</div>
{% endcapture %}
<div class="example mt-medium">
  {{ tabindex }}
</div>
``` html{{ tabindex }}```
<!-- markdownlint-enable -->

## HTML Attributes

### data-enter-disabled

``` html
<html data-enter-disabled>...</html>
```

Add this attribute to the `<html>` tag to disable the
enhancement to the `Enter` key.