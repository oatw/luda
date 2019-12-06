---
title: Form
description: Form elements are essential when collecting data from users.
             Luda makes it easy to create and control beautiful form elements.
---

## Input Elements

In Luda, style classes are not added to `<input>` tags directly,
we add them to containers instead.
It's more flexible to control and extend input element styles in this way.
An input element is wrapped in a container which has the `.fm` class,
we can combine different input style classes to create various kinds of
input elements.

### Text Field and Text Area

Add the `.fm-text` class to the `.fm` container to
create a text filed or a text area.

{% capture text_field %}
<!-- Wrap an <input> -->
<div class="fm fm-text">
  <input name="form_example1" placeholder="E.g., A text field">
</div>
<!-- Wrap a <textarea> -->
<div class="fm fm-text">
  <textarea name="form_example2" placeholder="E.g., A text area"></textarea>
</div>
{% endcapture %}
<div class="form-example">
  {{ text_field }}
</div>
``` html{{ text_field }}```

### Search Field

Add the `.fm-search` class to the `.fm` container
to create a search filed, an `<input>` tag suppots
typing texts should be wrapped inside.

{% capture search_field %}
<div class="fm fm-search">
  <input type="search" name="form_example3" placeholder="Search anything">
</div>
{% endcapture %}
<div class="form-example">
  {{ search_field }}
</div>
``` html{{ search_field }}```

### Select Field

Add the `.fm-select` class to the `.fm` container
to create a select field, a `<select>` tag should be wrapped inside.
Default selected `<options>` can be set by adding the `selected` attribute.

{% capture select_field %}
<!-- A select field -->
<div class="fm fm-select">
  <select name="form_example4" placeholder="E.g., Male">
    <option value="male">Male</option>
    <option value="female">Female</option>
  </select>
</div>
<!-- A multiple select filed with a default selected option -->
<div class="fm fm-select">
  <select multiple name="form_example5">
    <option value="en" selected>English</option>
    <option value="zh">Chinese</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ select_field }}
</div>
``` html{{ select_field }}```

#### Select Options in Javascript

``` javascript
// @example Select a specific option of a single select field
// by passing in the option's value.
luda('#my-select select').val('value')
// @example Select specific options of a multiple select field
// by passing in an array which contains the options' values.
luda('#my-select select').val(['valueOne', 'valueTwo'])
// @example Select no options.
luda('#my-select select').val(null)
```

#### Listen Selected Changes

```javascript
// @example Do something after a single select fileld selected
// option chagned.
luda(document).on('luda:fmSelect:changed', '#my-select', function(event, data){
  console.log(data.value) // The selected value.
  console.log(data.selected) // The selected option element.
})
// @example Do something after a multiple select filed selected
// options chagned.
luda(document).on('luda:fmSelect:changed', '#my-select', function(event, data){
  console.log(data.value) // The selected values in an array.
  console.log(data.selected) // The selected option elements in an array.
})
```

### File Picker

Add the `.fm-file` class to the `.fm` container to create a file picker,
an `<input type="file">` tag should be wrapped inside.
The value attribute of the wrapped `<input>` can be used to set a default value.

{% capture file_picker %}
<!-- A file picker -->
<div class="fm fm-file">
  <input type="file" name="form_example6" placeholder="E.g., my_resume.pdf">
</div>
<!-- A file picker can pick up multiple files with a default initial value -->
<div class="fm fm-file">
  <input type="file" multiple name="form_example7" value="luda.min.js">
</div>
{% endcapture %}
<div class="form-example">
  {{ file_picker }}
</div>
``` html{{ file_picker }}```

#### Reset in Javascript

``` javascript
// @example Reset a file picker.
luda('#my-file [type=file]').val(null)
```

#### Listen File Changes

```javascript
// @example Do something after a single file fileld file changed.
luda(document).on('luda:fmFile:changed', '#my-file', function(event, file){
  console.log(file) // The selected file.
})
// @example Do something after a multiple file filed files changed.
luda(document).on('luda:fmFile:changed', '#my-file', function(event, files){
  console.log(files) // The selected files in an array.
})
```

### Checkbox

Add the `.fm-check` class to the `.fm` container to create checkboxes,
one or more `<input type="checkbox">` tags can be wrapped inside.

{% capture checkboxes %}
<div class="fm fm-check">
  <label><input type="checkbox" name="form_example8" value="1">Checkbox one</label>
  <label><input type="checkbox" name="form_example8" value="2">Checkbox two</label>
</div>
{% endcapture %}
<div class="form-example">
  {{ checkboxes}}
</div>
``` html{{ checkboxes }}```

### Radio

Add the `.fm-radio` class to the `.fm` container to create radios.
Just like creating checkboxes, one or more `<input type="radio">`
tags can be wrapped inside.

{% capture radios %}
<div class="fm fm-radio">
  <label><input type="radio" name="form_example9" value="1">Radio one</label>
  <label><input type="radio" name="form_example9" value="2">Radio two</label>
</div>
{% endcapture %}
<div class="form-example">
  {{ radios }}
</div>
``` html{{ radios }}```

### Range Slider

Add the `.fm-range` class to the `.fm` container to create a range slider,
an `<input type="range">` tag should be wrapped inside.

{% capture range_slider %}
<div class="fm fm-range">
  <input type="range">
</div>
{% endcapture %}
{{ range_slider }}
``` html{{ range_slider }}```

## Input States

The state of an input element can be controlled by
adding state attributes.

### Readonly

The `readonly` attribute pervents input elements
from responding to user actions.
To make an input element readonly, add the `readonly` attribute
to itself and its `.fm` container.

<!-- markdownlint-disable -->
{% capture readonly %}
<!-- A readonly text field -->
<div class="fm fm-text" readonly>
  <input readonly name="example11" value="I'm readonly">
</div>
<!-- A readonly checkbox -->
<div class="fm fm-check" readonly>
  <label><input readonly checked type="checkbox" name="example12" value="example">A readonly checkbox</label>
</div>
<!-- A readonly select field -->
<div class="fm fm-select" readonly>
  <select readonly name="example13">
    <option selected="selected" value="male">Male</option>
    <option value="female">Female</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ readonly }}
</div>
``` html{{ readonly }}```
<!-- markdownlint-enable -->

### Disabled

An input element which has the `disabled` attribute cannot respond to
user actions nor submitted.
To disable an input element, add the `disabled` attribute to itself
and its `.fm` container.

<!-- markdownlint-disable -->
{% capture disabled %}
<!-- A disabled search field -->
<div class="fm fm-search" disabled>
  <input disabled name="example14" value="I'm disabled">
</div>
<!-- A disabled radio -->
<div class="fm fm-radio" disabled>
  <label><input disabled type="radio" name="example15" value="example">This radio is disabled</label>
</div>
<!-- A disabled file picker -->
<div class="fm fm-file" disabled>
  <input disabled type="file" name="example16" value="This file picker is disabled">
</div>
{% endcapture %}
<div class="form-example">
  {{ disabled }}
</div>
``` html{{ disabled }}```
<!-- markdownlint-enable -->

## Input Element Modifiers

The size of input elements can be changed by adding size modifier classes.

### .fm-small{% include modifier.md %}

If you want a smaller input element, add the `.fm-small` class to its `.fm` container.

<!-- markdownlint-disable -->
{% capture small %}
<!-- A small checkbox -->
<div class="fm fm-check fm-small">
  <label><input type="checkbox" name="example17" value="example">A small form checkbox</label>
</div>
<!-- A small range slider -->
<div class="fm fm-range fm-small">
  <input type="range">
</div>
<!-- A small search field -->
<div class="fm fm-search fm-small">
  <input name="example18" placeholder="Search anything...">
</div>
<!-- A small textarea -->
<div class="fm fm-text fm-small">
  <textarea name="example19" placeholder="E.g., Once upon a time..."></textarea>
</div>
{% endcapture %}
<div class="form-example">
  {{ small }}
</div>
``` html{{ small }}```
<!-- markdonwlint-enable -->

### .fm-large{% include modifier.md %}

The size of an input element can be larger by
adding the `.fm-large` class to its `.fm` container.

{% capture large %}
<!-- A large radio -->
<div class="fm fm-radio fm-large">
  <label><input type="radio" name="example20" value="example">A large form radio</label>
</div>
<!-- A large file picker -->
<div class="fm fm-file fm-large">
  <input type="file" name="example21" placeholder="E.g., my_resume.pdf">
</div>
<!-- A large text filed -->
<div class="fm fm-text fm-large">
  <input name="example22" placeholder="E.g., Once upon a time...">
</div>
<!-- A large select field -->
<div class="fm fm-select fm-large">
  <select multiple name="example23">
    <option value="en">English</option>
    <option value="zh">Chinese</option>
    <option value="ja">Japanese</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ large }}
</div>
``` html{{ large }}```

### .fm-inline{% include modifier.md %}

Luda form elements takes all available space in the horizontal by default.
If you want to change this behavior, you can add the `.fm-inline` to their
`.fm` containers.

{% capture inline %}
<!-- An inline search field -->
<div class="fm fm-search fm-inline">
  <input type="search" name="example24" placeholder="Search anything...">
</div>
<!-- An inline file picker -->
<div class="fm fm-file fm-inline">
  <input type="file" name="example25" placeholder="E.g., my_resume.pdf">
</div>
<!-- An inline checkbox -->
<div class="fm fm-check fm-inline">
  <label><input type="checkbox" name="example26" value="example">An inline checbox</label>
</div>
{% endcapture %}
<div class="form-example mb-none">
  {{ inline }}
</div>
``` html{{ inline }}```
{: .mt-small}

## Input Helpers

Luda provides form hint and error text helpers for
showing hints and errors of input elements.

### Hint Texts

Add the `data-hint` attribute to the `.fm` container to show hint texts.
The value of this attribute shows at the bottom of the `.fm` container.

{% capture hint %}
<!-- Show hint texts for the text field -->
<div class="fm fm-text" data-hint="Your email will be a secret.">
  <input type="email" name="example27" placeholder="E.g., oatwoatw@gmail.com">
</div>
<!-- Show hint texts for the radios -->
<div class="fm fm-radio" data-hint="Your gender also will be a secret.">
  <label><input type="radio" name="example28" value="male">Male</label>
  <label><input type="radio" name="example28" value="female">Female</label>
</div>
{% endcapture %}
<div class="form-example">
  {{ hint }}
</div>
``` html{{ hint }}```

### Error Texts

Add the `data-error` attribute to the `.fm` container to show error texts.
The value of this attribute shows at the bottom of the `.fm` container.

A `.fm` container has both `data-error` attribute and `data-hint` attribute
only shows the error texts.
{: .c-danger}

{% capture error %}
<!-- Show error texts for the text field -->
<div class="fm fm-text" data-error="Email cannot be blank!">
  <input type="email" name="example29" placeholder="E.g., oatwoatw@gmail.com">
</div>
<!-- Show error texts for the radios -->
<div class="fm fm-radio" data-error="Please choose your gender!">
  <label><input type="radio" name="example30" value="male">Male</label>
  <label><input type="radio" name="example30" value="female">Female</label>
</div>
{% endcapture %}
<div class="form-example">
  {{ error }}
</div>
``` html{{ error }}```

## Form Label

The label element represents a caption for an item in a form.

### Example

Add the `.fm-label` class to a `<label>` tag
to create a caption for the text field.
{: .mb-none}

{% capture form_label %}
<label class="fm-label" for="example31">Fullname</label>
<div class="fm fm-text">
  <input id="example31" name="example31" placeholder="E.g., James Bond">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ form_label }}
</div>
``` html{{ form_label }}```

### Form Label Modifiers

You can change a label's size and show the "Required" texts
by using label modifier classes.

#### .fm-label-required{% include modifier.md %}

Add the `.fm-label-required` class to show the "Required" text.
{: .mb-none}

{% capture required_form_label %}
<label class="fm-label fm-label-required" for="example32">Fullname</label>
<div class="fm fm-text">
  <input id="example32" name="example32" placeholder="E.g., James Bond">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ required_form_label }}
</div>
``` html{{ required_form_label }}```

#### .fm-label-small{% include modifier.md %}

Add the `.fm-label-small` class to make the label smaller.
{: .mb-none}

{% capture small_form_label %}
<label class="fm-label fm-label-small" for="example33">Fullname</label>
<div class="fm fm-text fm-small">
  <input id="example33" name="example33" placeholder="E.g., James Bond">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ small_form_label }}
</div>
``` html{{ small_form_label }}```

#### .fm-label-large{% include modifier.md %}

Add the `.fm-label-large` class to to make the label larger.
{: .mb-none}

{% capture large_form_label %}
<label class="fm-label fm-label-large" for="example34">Fullname</label>
<div class="fm fm-text fm-large">
  <input id="example34" name="example34" placeholder="E.g., James Bond">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ large_form_label }}
</div>
``` html{{ large_form_label }}```

## Sass Variables

### Size

``` sass
$form-element-inline-width-rem: baseline(22) !default
```

``` sass
$form-element-small-inline-width-rem: baseline(18) !default
```

``` sass
$form-element-large-inline-width-rem: baseline(26) !default
```

``` sass
$form-element-height-rem: baseline(3) !default
```

``` sass
$form-element-small-height-rem: baseline(2) !default
```

``` sass
$form-element-large-height-rem: baseline(4) !default
```

``` sass
$form-element-multiple-rows-height-rem: $form-element-height-rem * 3 !default
```

Default height of multiple select field and textarea.

<!-- markdownlint-disable -->
``` sass
$form-element-multiple-rows-small-height-rem: $form-element-small-height-rem * 3 !default
```

``` sass
$form-element-multiple-rows-large-height-rem: $form-element-large-height-rem * 3 !default
```

``` sass
$form-element-horizontal-padding-em: rem-to-em(harmony-spacing($grid-gutter-width-rem / 2, $form-element-border-width), $form-element-typography-size-level) !default
```
<!-- markdownlint-enable -->

``` sass
$form-element-checkfield-size-em: 1.25em !default
```

Default size of checkboxes and radios.

``` sass
$form-element-track-height-em: 0.25em !default
```

``` sass
$form-element-thumb-width-em: 1.25em !default
```

``` sass
$form-element-thumb-height-em: $form-element-thumb-width-em !default
```

### Typography

``` sass
$form-element-typography-size-level: 6 !default
```

``` sass
$form-element-small-typography-size-level: 7 !default
```

``` sass
$form-element-large-typography-size-level: 5 !default
```

### Border

``` sass
$form-element-border-width: $line-width-main !default
```

``` sass
$form-element-border-style: solid !default
```

``` sass
$form-element-border-radius: $border-radius-main !default
```

``` sass
$form-element-border-color: $line-color-muted !default
```

``` sass
$form-element-border-color-on-error: $line-color-danger !default
```

``` sass
$form-element-border-color-on-focus: $line-color-primary !default
```

``` sass
$form-element-track-border-radius: $border-radius-main !default
```

``` sass
$form-element-thumb-border-radius: 100% !default
```

``` sass
$form-element-thumb-border-color: transparent !default
```

``` sass
$form-element-thumb-border-color-on-error: $form-element-border-color-on-error !default
```

``` sass
$form-element-thumb-border-color-on-focus: null !default
```

### Color

``` sass
$form-element-color: $color-main !default
```

``` sass
$form-element-color-on-error: null !default
```

``` sass
$form-element-color-on-focus: null !default
```

``` sass
$form-placeholder-color: $color-muted !default
```

``` sass
$form-placeholder-color-on-error: null !default
```

``` sass
$form-placeholder-color-on-focus: null !default
```

### Background

``` sass
$form-element-background: $background-color-main !default
```

``` sass
$form-element-background-on-focus: null !default
```

``` sass
$form-element-background-on-error: null !default
```

``` sass
$form-element-track-background: darken($background-color-muted, 4%) !default !default
```

``` sass
$form-element-track-background-on-focus: null !default
```

``` sass
$form-element-track-background-on-error: null !default
```

``` sass
$form-element-thumb-background: $form-element-track-background !default
```

``` sass
$form-element-thumb-background-on-error: null !default
```

``` sass
$form-element-thumb-background-on-focus: $background-color-primary !default
```

### Shadow

``` sass
$form-element-box-shadow: null !default
```

``` sass
$form-element-box-shadow-on-focus: null !default
```

``` sass
$form-element-box-shadow-on-error: null !default
```

### Icon

``` sass
$form-element-icon-size-em: null !default
```

``` sass
$form-element-icon-color: lighten($color-muted, 10%) !default
```

``` sass
$form-element-icon-color-on-error: $form-element-border-color-on-error !default
```

``` sass
$form-element-icon-color-on-focus: $form-element-border-color-on-focus !default
```

``` sass
$form-element-search-icon: '<svg viewBox="..."><path fill="#fill"...</svg>' !default
```

The `#fill` texts will be automatically replaced by color values,
you don't need set it.

``` sass
$form-element-select-icon: '<svg viewBox="..."><path fill="#fill"...</svg>' !default
```

The `#fill` texts will be automatically replaced by color values,
you don't need set it.

``` sass
$form-element-add-icon: '<svg viewBox="..."><path fill="#fill"...</svg>' !default
```

The `#fill` texts will be automatically replaced by color values,
you don't need set it.

``` sass
$form-element-checked-icon: '<svg viewBox="..."><path fill="#fill"...</svg>' !default
```

The `#fill` texts will be automatically replaced by color values,
you don't need set it.

``` sass
$form-element-checked-icon-color: $form-element-color !default
```

``` sass
$form-element-checked-icon-color-on-error: null !default
```

``` sass
$form-element-checked-icon-color-on-focus: null !default
```

### Helper

``` sass
$form-helper-typography-size-level: 7 !default
```

``` sass
$form-helper-small-typography-size-level: null !default
```

``` sass
$form-helper-large-typography-size-level: 6 !default
```

``` sass
$form-hint-color: $color-muted !default
```

``` sass
$form-error-color: $color-danger !default
```

### Label

``` sass
$form-label-typography-size-level: 6 !default
```

``` sass
$form-label-small-typography-size-level: 7 !default
```

``` sass
$form-label-large-typography-size-level: 5 !default
```

``` sass
$form-label-color: null !default
```

``` sass
$form-label-required-content: " | Required" !default
```

``` sass
$form-label-required-color: $color-danger !default
```