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
  <input placeholder="Enter some text">
</div>
<!-- Wrap a <textarea> -->
<div class="fm fm-text">
  <textarea placeholder="Enter more text"></textarea>
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
  <input type="search" placeholder="Search anything...">
</div>
{% endcapture %}
<div class="form-example">
  {{ search_field }}
</div>
``` html{{ search_field }}```

### Select Field

Add the `.fm-select` class to the `.fm` container
to create a select field, a `<select>` tag should be wrapped inside.
Default selected `<options>` can be set by
seting the value of their `selected` attributes to `selected`.

{% capture select_field %}
<!-- A select field -->
<div class="fm fm-select">
  <select placeholder="Select a word">
    <option value="hello">Hello!</option>
    <option value="goodbye">Goodbye!</option>
  </select>
</div>
<!-- A multiple select filed with a default selected option -->
<div class="fm fm-select">
  <select multiple placeholder="Select words">
    <option value="hello" selected="selected">Hello!</option>
    <option value="goodbye">Goodbye!</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ select_field }}
</div>
``` html{{ select_field }}```

#### Select Options in Javascript

``` javascript
luda.fmSelect.select(document.querySelector('#my-fm-select'), 0)
```

Select a specific option of a single select field
by passing in the option's index number.

``` javascript
luda.fmSelect.select(document.querySelector('#my-multiple-fm-select'), [0, 1])
```

Select specific options of a multiple select field
by passing in an array which contains the options' index numbers.

### File Picker

Add the `.fm-file` class to the `.fm` container to create a file picker,
an `<input type="file">` tag should be wrapped inside.
The value attribute of the wrapped `<input>` can be used to set a default value.

{% capture file_picker %}
<!-- A file picker -->
<div class="fm fm-file">
  <input type="file" placeholder="Add a file">
</div>
<!-- A file picker can pick up multiple files with a default initial value -->
<div class="fm fm-file">
  <input type="file" multiple value="luda.min.css" placeholder="Add files">
</div>
{% endcapture %}
<div class="form-example">
  {{ file_picker }}
</div>
``` html{{ file_picker }}```

#### Reset in Javascript

``` javascript
luda.fmFile.reset(document.querySelector('#my-fm-file'))
```

Reset a file picker.

### Checkbox

Add the `.fm-check` class to the `.fm` container to create checkboxes,
one or more `<input type="checkbox">` tags can be wrapped inside.

{% capture checkboxes %}
<!-- A checkbox without a label -->
<div class="fm fm-check">
  <input type="checkbox">
</div>
<!-- Checkboxes with labels -->
<div class="fm fm-check">
  <label><input type="checkbox">Checkbox one</label>
  <label><input type="checkbox">Checkbox two</label>
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
<!-- A radio without a label -->
<div class="fm fm-radio">
  <input type="radio" name="radio_example">
</div>
<!-- Radios with labels -->
<div class="fm fm-radio">
  <label><input type="radio" name="radio_example" value="one">Radio one</label>
  <label><input type="radio" name="radio_example" value="two">Radio two</label>
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

The `data-readonly` attribute pervents input elements
from responding to user actions.
To make an input element readonly, add the `data-readonly` attribute
to itself and its `.fm` container.

{% capture readonly %}
<!-- A readonly text field -->
<div class="fm fm-text" data-readonly>
  <input data-readonly value="A readonly text field">
</div>
<!-- A readonly checkbox -->
<div class="fm fm-check" data-readonly>
  <label><input data-readonly checked type="checkbox">A readonly checkbox</label>
</div>
<!-- A readonly select field -->
<div class="fm fm-select" data-readonly>
  <select data-readonly placeholder="Select a word">
    <option selected="selected" value="hello">A readonly select with Hello selected</option>
    <option value="goodbye">Goodbye!</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ readonly }}
</div>
``` html{{ readonly }}```

### Disabled

An input element which has the `disabled` attribute cannot respond to
user actions nor submitted.
To disable an input element, add the `disabled` attribute to itself
and its `.fm` container.

{% capture disabled %}
<!-- A disabled search field -->
<div class="fm fm-search" disabled>
  <input disabled value="This search field is disabled">
</div>
<!-- A disabled radio -->
<div class="fm fm-radio" disabled>
  <label><input disabled type="radio">This radio is disabled</label>
</div>
<!-- A disabled file picker -->
<div class="fm fm-file" disabled>
  <input disabled type="file" value="This file picker is disabled">
</div>
{% endcapture %}
<div class="form-example">
  {{ disabled }}
</div>
``` html{{ disabled }}```

## Input Element Modifiers

The size of input elements can be changed by adding size modifier classes.

### Small{% include modifier.md %}

If you want a smaller input element, add the `.fm-small` class to its `.fm` container.

{% capture small %}
<!-- A small checkbox -->
<div class="fm fm-check fm-small">
  <label><input type="checkbox">A small form checkbox</label>
</div>
<!-- A small range slider -->
<div class="fm fm-range fm-small">
  <input type="range">
</div>
<!-- A small search field -->
<div class="fm fm-search fm-small">
  <input placeholder="A small form search">
</div>
<!-- A small textarea -->
<div class="fm fm-text fm-small">
  <textarea placeholder="A small from textarea"></textarea>
</div>
{% endcapture %}
<div class="form-example">
  {{ small }}
</div>
``` html{{ small }}```

### Large{% include modifier.md %}

The size of an input element can be larger by
adding the `.fm-large` class to its `.fm` container.

{% capture large %}
<!-- A large radio -->
<div class="fm fm-radio fm-large">
  <label><input type="radio">A large form radio</label>
</div>
<!-- A large file picker -->
<div class="fm fm-file fm-large">
  <input type="file" placeholder="A large form file">
</div>
<!-- A large text filed -->
<div class="fm fm-text fm-large">
  <input placeholder="A large form text">
</div>
<!-- A large select field -->
<div class="fm fm-select fm-large">
  <select multiple placeholder="A large multiple select">
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
</div>
{% endcapture %}
<div class="form-example">
  {{ large }}
</div>
``` html{{ large }}```

### Inline{% include modifier.md %}

Luda form elements takes all available space in the horizontal by default.
If you want to change this behavior, you can add the `.fm-inline` to their
`.fm` containers.

{% capture inline %}
<!-- An inline search field -->
<div class="fm fm-search fm-inline">
  <input placeholder="An inline form search">
</div>
<!-- An inline file picker -->
<div class="fm fm-file fm-inline">
  <input type="file" placeholder="An inline form file">
</div>
<!-- An inline checkbox -->
<div class="fm fm-check fm-inline">
  <label><input type="checkbox">An inline checbox</label>
</div>
{% endcapture %}
<div class="form-example">
  {{ inline }}
</div>
``` html{{ inline }}```

## Input Helpers

Luda provides form hint and error text helpers for
showing hints and errors of input elements.

### Hint Texts

Add the `data-hint` attribute to the `.fm` container to show hint texts.
The value of this attribute shows at the bottom of the `.fm` container.

{% capture hint %}
<!-- Show hint texts for the text field -->
<div class="fm fm-text" data-hint="Your email will be a secret.">
  <input type="email" placeholder="Please enter your email">
</div>
<!-- Show hint texts for the radios -->
<div class="fm fm-radio" data-hint="Your gender also will be a secret.">
  <label><input type="radio" value="male">Male</label>
  <label><input type="radio" value="female">Female</label>
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
  <input type="email" placeholder="Please enter your email">
</div>
<!-- Show error texts for the radios -->
<div class="fm fm-radio" data-error="Please choose your gender!">
  <label><input type="radio" value="male">Male</label>
  <label><input type="radio" value="female">Female</label>
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

{% capture form_label %}
<label class="fm-label">Fullname</label>
<div class="fm fm-text">
  <input placeholder="Please enter your fullname">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ form_label }}
</div>
``` html{{ form_label }}```

### Form Label Modifiers

You can change a label's size and show the "Required" texts
by using label modifier classes.

#### Required{% include modifier.md %}

Add the `.fm-label-required` class to show the "Required" text.

{% capture required_form_label %}
<label class="fm-label fm-label-required">Fullname</label>
<div class="fm fm-text">
  <input placeholder="Please enter your fullname">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ required_form_label }}
</div>
``` html{{ required_form_label }}```

#### Small Label{% include modifier.md %}

Add the `.fm-label-small` class to make the label smaller.

{% capture small_form_label %}
<label class="fm-label fm-label-small">Fullname</label>
<div class="fm fm-text fm-small">
  <input placeholder="Please enter your fullname">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ small_form_label }}
</div>
``` html{{ small_form_label }}```

#### Large Label{% include modifier.md %}

Add the `.fm-label-large` class to to make the label larger.

{% capture large_form_label %}
<label class="fm-label fm-label-large">Fullname</label>
<div class="fm fm-text fm-large">
  <input placeholder="Please enter your fullname">
</div>
{% endcapture %}
<div class="form-example mt-none">
  {{ large_form_label }}
</div>
``` html{{ large_form_label }}```

## Sass Variables

### Size

``` sass
$form-element-inline-width-rem: 18rem !default
```

``` sass
$form-element-small-inline-width-rem: 14rem !default
```

``` sass
$form-element-large-inline-width-rem: 22rem !default
```

``` sass
$form-element-horizontal-padding-em: strip-unit($spacing-small-rem) * 1em !default
```

``` sass
$form-element-height-rem: 3rem !default
```

``` sass
$form-element-small-height-rem: 2rem !default
```

``` sass
$form-element-large-height-rem: 4rem !default
```

``` sass
$form-element-multiple-rows-height-rem: 9rem !default
```

Default height of multiple select field and textarea.

``` sass
$form-element-multiple-rows-small-height-rem: 6rem !default
```

``` sass
$form-element-multiple-rows-large-height-rem: 12rem !default
```

``` sass
$form-element-checkfield-size-em: 1.4em !default
```

Default size of checkboxes and radios.

``` sass
$form-element-track-height-em: 0.4em !default
```

``` sass
$form-element-thumb-height-em: 1.4em !default
```

``` sass
$form-element-thumb-width-em: 1.4em !default
```

### Typography

``` sass
$form-element-typography-size-level: 5 !default
```

``` sass
$form-element-small-typography-size-level: 6 !default
```

``` sass
$form-element-large-typography-size-level: 4 !default
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
$form-element-border-color: $line-color-main !default
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
$form-element-icon-size-em: 1.286em !default
```

``` sass
$form-element-icon-color: $form-element-border-color !default
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
$form-helper-typography-size-level: 6 !default
```

``` sass
$form-helper-small-typography-size-level: null !default
```

``` sass
$form-helper-large-typography-size-level: 5 !default
```

``` sass
$form-hint-color: $color-muted !default
```

``` sass
$form-error-color: $color-danger !default
```

### Label

``` sass
$form-label-typography-size-level: 5 !default
```

``` sass
$form-label-small-typography-size-level: 6 !default
```

``` sass
$form-label-large-typography-size-level: 4 !default
```

``` sass
$form-label-color: $color-emphasis !default
```

``` sass
$form-label-required-content: " | Required" !default
```

``` sass
$form-label-required-color: $color-danger !default
```