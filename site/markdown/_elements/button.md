---
title: Button
description: Buttons may be the most widely used elements in web applications.
             Let's have a look at how to create buttons with different styles,
             functions and states in Luda.
---

## Button Styles

A button can be created by adding the `.btn` class and
the button style classes to a `<button>` tag.
Let's preview the button styles in the below examples.

### Solid Buttons

Add the `.btn-*` style classes to create solid buttons.

{% capture solid_button %}
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-dark">Dark</button>
<button class="btn btn-light">Light</button>
<button class="btn btn-danger">Danger</button>
{% endcapture %}
<div class="button-example">
  {{ solid_button }}  
</div>
``` html{{ solid_button }}```

### Hollow Buttons

A hollow button shows its background when being hovered or clicked.
Add the `.btn-hollow-*` style classes to create hollow buttons.

{% capture hollow_button %}
<button class="btn btn-hollow-primary">Primary</button>
<button class="btn btn-hollow-secondary">Secondary</button>
<button class="btn btn-hollow-dark">Dark</button>
<button class="btn btn-hollow-light">Light</button>
<button class="btn btn-hollow-danger">Danger</button>
{% endcapture %}
<div class="button-example">
  {{ hollow_button }}
</div>
``` html{{ hollow_button }}```

### Text Buttons

Text buttons has the same sizes as solid buttons and hollow buttons.
They have no backgrounds and borders. To create text buttons,
add the `.btn-text-*` style classes.

{% capture text_button %}
<button class="btn btn-text-primary">Primary</button>
<button class="btn btn-text-secondary">Secondary</button>
<button class="btn btn-text-dark">Dark</button>
<button class="btn btn-text-light">Light</button>
<button class="btn btn-text-danger">Danger</button>
{% endcapture %}
<div class="button-example">
  {{ text_button }}
</div>
``` html{{ text_button }}```

## Button Tags

The `.btn` class and the button style classes can also be added
to other elements to make them looks like buttons.

<div class="button-example">
  <a data-turbolinks="false" href="#" class="btn btn-primary">Link</a>
  <input type="submit" value="Submit" class="btn btn-hollow-primary">
  <input type="reset" value="Reset" class="btn btn-primary">
  <input type="button" value="Button" class="btn btn-hollow-primary">  
</div>
``` html
<a href="#" class="btn btn-primary">Link</a>
<input type="submit" value="Submit" class="btn btn-hollow-primary">
<input type="reset" value="Reset" class="btn btn-primary">
<input type="button" value="Button" class="btn btn-hollow-primary">
```

## Functional Buttons

Luda offers some functional buttons,
let's have a look at what they can do.

### Checkbox Buttons

Checkbox buttons looks like buttons but
behave the same as normal checkboxes.

A checkbox button is very simple to create, add the `.btn-check` class
and the button style classes to a container,
then wrap a `<input type="checkbox">` and a `<label>` inside.

{% capture checkbox_button %}
<div class="btn-check btn-hollow-primary">
  <input type="checkbox" name="favriout_films" value="kill_bill">
  <label>Kill Bill</label>
</div>
<div class="btn-check btn-hollow-primary">
  <input type="checkbox" name="favriout_films" value="django">
  <label>Django</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ checkbox_button }}  
</div>
``` html{{ checkbox_button }}```

### Radio Buttons

Radio buttons looks like buttons but
behave the same as normal radios.

A radio button is very simple to create, add the `.btn-radio` class
and the button style classes to a container,
then wrap a `<input type="radio">` and a `<label>` inside.

{% capture radio_button %}
<div class="btn-radio btn-hollow-primary">
  <input type="radio" name="decision" value="yes">
  <label>Yes, I agree.</label>
</div>
<div class="btn-radio btn-hollow-danger">
  <input type="radio" name="decision" value="no">
  <label>No, I disagree.</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ radio_button }}  
</div>
``` html{{ radio_button }}```

### File Buttons

File buttons are used to pick up files.
It's easy to create, almost the same as creating checkbox buttons and radio buttons.
Let's go straight to the below examples.

{% capture file_button %}
<div class="btn-file btn-primary">
  <input type="file">
  <label>Upload a file</label>
</div>
<div class="btn-file btn-hollow-primary">
  <input multiple type="file">
  <label>Upload files</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ file_button }}  
</div>
``` html{{ file_button }}```

## Button States

Button states can be controled through state classes and attributes.

### Active

The `.btn-active` class is used to show the active state of a button
or a functional button, you can see the effect in the below examples.

{% capture active_button %}
<!-- An active button -->
<button class="btn btn-hollow-primary btn-active">Button</button>
<!-- An active checkbox button -->
<div class="btn-check btn-hollow-primary btn-active">
  <input type="check">
  <label>Checkbox button</label>
</div>
<!-- An active radio button -->
<div class="btn-radio btn-hollow-primary btn-active">
  <input type="radio">
  <label>Radio button</label>
</div>
<!-- An active file button -->
<div class="btn-file btn-hollow-primary btn-active">
  <input type="file">
  <label>File button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ active_button }}  
</div>
``` html{{ active_button }}```

### Disabled

The `disabled` attribute can be used to
disable a button or a functional button.
Disabled buttons and functional buttons cannot
be focused nor respond to user actions.

If you want to disable a function button, don't forget to add
the `disabled` attribute to the nested `<input>`.
{: .c-danger}

{% capture disabled_button %}
<!-- A disabled button -->
<button class="btn btn-hollow-primary" disabled>Button</button>
<!-- A disabled checkbox button -->
<div class="btn-check btn-hollow-primary" disabled>
  <input disabled type="checkbox">
  <label>Checkbox button</label>
</div>
<!-- A disabled radio button -->
<div class="btn-radio btn-hollow-primary" disabled>
  <input disabled type="radio">
  <label>Radio button</label>
</div>
<!-- A disabled file button -->
<div class="btn-file btn-hollow-primary" disabled>
  <input disabled type="file">
  <label>File button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ disabled_button }}
</div>
``` html{{ disabled_button }}```

### Readonly

A readonly functional button cannot be focused,
it doesn't respond to user actions.
But sill can be submitted if included in a `<form>`.

If you want to make a readonly functional button,
add the `data-readonly` attribute to it and the nested `<input>`.
{: .c-danger}

{% capture readonly_button %}
<!-- A readonly checkbox button -->
<div class="btn-check btn-hollow-primary" data-readonly>
  <input type="checkbox" data-readonly>
  <label>Checkbox button</label>
</div>
<!-- A readonly radio button -->
<div class="btn-radio btn-hollow-primary" data-readonly>
  <input type="radio" data-readonly>
  <label>Radio button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ readonly_button }}
</div>
``` html{{ readonly_button }}```

### Checked

The checked state is only available in checkbox buttons and radio buttons.
To set the checked state, just add the `checked` attribute to
the nested `<input>` elements.

{% capture checked_button %}
<!-- A checked checkbox button -->
<div class="btn-check btn-hollow-primary">
  <input checked type="checkbox">
  <label>Checkbox button</label>
</div>
<!-- A checked radio button -->
<div class="btn-radio btn-hollow-primary">
  <input checked type="radio">
  <label>Radio button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ checked_button }}
</div>
``` html{{ checked_button }}```

## Size Modifiers

If you want to change the size of a button, you can use size modifier classes.

### Small{% include modifier.md %}

The `.btn-small` class makes a button smaller.

{% capture small_button %}
<!-- A small button -->
<button class="btn btn-primary btn-small">Solid button</button>
<!-- A small hollow button -->
<button class="btn btn-hollow-primary btn-small">Hollow button</button>
<!-- A small text button -->
<button class="btn btn-text-primary btn-small">Text button</button>
<!-- A small checkbox button -->
<div class="btn-check btn-hollow-primary btn-small">
  <input type="checkbox">
  <label>Checkbox button</label>
</div>
<!-- A small radio button -->
<div class="btn-radio btn-hollow-primary btn-small">
  <input type="radio">
  <label>Radio button</label>
</div>
<!-- A small file button -->
<div class="btn-file btn-hollow-primary btn-small">
  <input type="file">
  <label>File button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ small_button }}
</div>
``` html{{ small_button }}```

### Large{% include modifier.md %}

Oppsitely, the `.btn-large` class makes a button larger.

{% capture large_button %}
<!-- A large button -->
<button class="btn btn-primary btn-large">Solid button</button>
<!-- A large hollow button -->
<button class="btn btn-hollow-primary btn-large">Hollow button</button>
<!-- A large text button -->
<button class="btn btn-text-primary btn-large">Text button</button>
<!-- A large checkbox button -->
<div class="btn-check btn-hollow-primary btn-large">
  <input type="checkbox">
  <label>Checkbox button</label>
</div>
<!-- A large radio button -->
<div class="btn-radio btn-hollow-primary btn-large">
  <input type="radio">
  <label>Radio button</label>
</div>
<!-- A large file button -->
<div class="btn-file btn-hollow-primary btn-large">
  <input type="file">
  <label>File button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ large_button }}
</div>
``` html{{ large_button }}```

### Fluid{% include modifier.md %}

If you want a button takes all the availiable horizontal space
in its container, you can add the `.btn-fluid` class to it.
The `.btn-fluid` class can be mixed with other size modifier classes.

{% capture fluid_button %}
<!-- A fluid button -->
<button class="btn btn-primary btn-fluid">Solid button</button>
<!-- A fluid hollow button -->
<button class="btn btn-hollow-primary btn-fluid">Hollow button</button>
<!-- A fluid text button -->
<button class="btn btn-text-primary btn-fluid">Text button</button>
<!-- A fluid checkbox button -->
<div class="btn-check btn-hollow-primary btn-fluid">
  <input type="checkbox">
  <label>Checkbox button</label>
</div>
<!-- A fluid radio button -->
<div class="btn-radio btn-hollow-primary btn-fluid">
  <input type="radio">
  <label>Radio button</label>
</div>
<!-- A fluid file button -->
<div class="btn-file btn-primary btn-fluid">
  <input type="file">
  <label>File button</label>
</div>
{% endcapture %}
<div class="button-example">
  {{ fluid_button }}  
</div>
``` html{{ fluid_button }}```

<!-- markdownlint-disable -->
## Sass Mixins

``` sass
+button-solid($name: null, $color: null, $hover-color: null, $active-color: null, $background: null, $hover-background: null, $active-background: null, $border-color: null, $hover-border-color: null, $active-border-color: null, $box-shadow: null, $hover-box-shadow: null, $active-box-shadow: null)
```

This mixin can be used to create more solid style classes for buttons.

``` sass
+button-hollow($name: null, $color: null, $hover-color: null, $active-color: null, $hover-background: null, $active-background: null, $border-color: null, $hover-border-color: null, $active-border-color: null, $box-shadow: null, $hover-box-shadow: null, $active-box-shadow: null)
```

This mixin can be used to create more hollow style classes for buttons.

``` sass
+button-text($name: null, $color: null, $hover-color: null, $active-color: null, $text-shadow: null, $hover-text-shadow: null, $active-text-shadow: null)
```

This mixin can be used to create more text style classes for buttons.

## Sass Variables

### Size

``` sass
$button-height-rem: 3rem !default
```

``` sass
$button-small-height-rem: 2rem !default
```

``` sass
$button-large-height-rem: 4rem !default
```

``` sass
$button-helvertical-padding-em: strip-unit($spacing-small-rem) * 1em !default
```

### Typography

``` sass
$button-typography-size-level: 5 !default
```

``` sass
$button-small-typography-size-level: 6 !default
```

``` sass
$button-large-typography-size-level: 4 !default
```

### Border

``` sass
$button-border-width: $line-width-main !default
```

``` sass
$button-border-style: solid !default
```

``` sass
$button-border-radius: $border-radius-main !default
```

### Primary Solid Button

``` sass
$button-primary-color: $color-inverse-main !default
```

``` sass
$button-primary-hover-color: null !default
```

``` sass
$button-primary-active-color: null !default
```

``` sass
$button-primary-background: $background-color-primary !default
```

``` sass
$button-primary-hover-background: darken($background-color-primary, 2%) !default
```

``` sass
$button-primary-active-background: darken($background-color-primary, 4%) !default
```

``` sass
$button-primary-border-color: null !default
```

``` sass
$button-primary-hover-border-color: null !default
```

``` sass
$button-primary-active-border-color: null !default
```

``` sass
$button-primary-box-shadow: null !default
```

``` sass
$button-primary-hover-box-shadow: null !default
```

``` sass
$button-primary-active-box-shadow: null !default
```

### Secondary Solid Button

``` sass
$button-secondary-color: $color-main !default
```

``` sass
$button-secondary-hover-color: null !default
```

``` sass
$button-secondary-active-color: null !default
```

``` sass
$button-secondary-background: $background-color-secondary !default
```

``` sass
$button-secondary-hover-background: darken($background-color-secondary, 2%) !default
```

``` sass
$button-secondary-active-background: darken($background-color-secondary, 4%) !default
```

``` sass
$button-secondary-border-color: null !default
```

``` sass
$button-secondary-hover-border-color: null !default
```

``` sass
$button-secondary-active-border-color: null !default
```

``` sass
$button-secondary-box-shadow: null !default
```

``` sass
$button-secondary-hover-box-shadow: null !default
```

``` sass
$button-secondary-active-box-shadow: null !default
```

### Danger Solid Button

``` sass
$button-danger-color: $color-inverse-main !default
```

``` sass
$button-danger-hover-color: null !default
```

``` sass
$button-danger-active-color: null !default
```

``` sass
$button-danger-background: $background-color-danger !default
```

``` sass
$button-danger-hover-background: darken($background-color-danger, 2%) !default
```

``` sass
$button-danger-active-background: darken($background-color-danger, 4%) !default
```

``` sass
$button-danger-border-color: null !default
```

``` sass
$button-danger-hover-border-color: null !default
```

``` sass
$button-danger-active-border-color: null !default
```

``` sass
$button-danger-box-shadow: null !default
```

``` sass
$button-danger-hover-box-shadow: null !default
```

``` sass
$button-danger-active-box-shadow: null !default
```

### Dark Solid Button

``` sass
$button-dark-color: $color-inverse-main !default
```

``` sass
$button-dark-hover-color: null !default
```

``` sass
$button-dark-active-color: null !default
```

``` sass
$button-dark-background: $background-color-dark !default
```

``` sass
$button-dark-hover-background: darken($background-color-dark, 2%) !default
```

``` sass
$button-dark-active-background: darken($background-color-dark, 4%) !default
```

``` sass
$button-dark-border-color: null !default
```

``` sass
$button-dark-hover-border-color: null !default
```

``` sass
$button-dark-active-border-color: null !default
```

``` sass
$button-dark-box-shadow: null !default
```

``` sass
$button-dark-hover-box-shadow: null !default
```

``` sass
$button-dark-active-box-shadow: null !default
```

### Light Solid Button

``` sass
$button-light-color: $color-dark !default
```

``` sass
$button-light-hover-color: null !default
```

``` sass
$button-light-active-color: null !default
```

``` sass
$button-light-background: $background-color-light !default
```

``` sass
$button-light-hover-background: darken($background-color-light, 2%) !default
```

``` sass
$button-light-active-background: darken($background-color-light, 4%) !default
```

``` sass
$button-light-border-color: null !default
```

``` sass
$button-light-hover-border-color: null !default
```

``` sass
$button-light-active-border-color: null !default
```

``` sass
$button-light-box-shadow: null !default
```

``` sass
$button-light-hover-box-shadow: null !default
```

``` sass
$button-light-active-box-shadow: null !default
```

### Primary Hollow Button

``` sass
$button-hollow-primary-color: $color-primary !default
```

``` sass
$button-hollow-primary-hover-color: existing($button-primary-hover-color, $button-primary-color) !default
```

``` sass
$button-hollow-primary-active-color: existing($button-primary-active-color, $button-hollow-primary-hover-color) !default
```

``` sass
$button-hollow-primary-hover-background: existing($button-primary-hover-background, $button-primary-background) !default
```

``` sass
$button-hollow-primary-active-background: existing($button-primary-active-background, $button-hollow-primary-hover-background) !default
```

``` sass
$button-hollow-primary-border-color: null !default
```

``` sass
$button-hollow-primary-hover-border-color: existing($button-primary-hover-border-color, $button-primary-border-color, transparent) !default
```

``` sass
$button-hollow-primary-active-border-color: existing($button-primary-active-border-color, $button-hollow-primary-hover-border-color) !default
```

``` sass
$button-hollow-primary-box-shadow: $button-primary-box-shadow !default
```

``` sass
$button-hollow-primary-hover-box-shadow: $button-primary-hover-box-shadow !default
```

``` sass
$button-hollow-primary-active-box-shadow: $button-primary-active-box-shadow !default
```

### Secondary Hollow Button

``` sass
$button-hollow-secondary-color: $color-main !default
```

``` sass
$button-hollow-secondary-hover-color: existing($button-secondary-hover-color, $button-secondary-color) !default
```

``` sass
$button-hollow-secondary-active-color: existing($button-secondary-active-color, $button-hollow-secondary-hover-color) !default
```

``` sass
$button-hollow-secondary-hover-background: existing($button-secondary-hover-background, $button-secondary-background) !default
```

``` sass
$button-hollow-secondary-active-background: existing($button-secondary-active-background, $button-hollow-secondary-hover-background) !default
```

``` sass
$button-hollow-secondary-border-color: $line-color-secondary !default
```

``` sass
$button-hollow-secondary-hover-border-color: existing($button-secondary-hover-border-color, $button-secondary-border-color, transparent) !default
```

``` sass
$button-hollow-secondary-active-border-color: existing($button-secondary-active-border-color, $button-hollow-secondary-hover-border-color) !default
```

``` sass
$button-hollow-secondary-box-shadow: $button-secondary-box-shadow !default
```

``` sass
$button-hollow-secondary-hover-box-shadow: $button-secondary-hover-box-shadow !default
```

``` sass
$button-hollow-secondary-active-box-shadow: $button-secondary-active-box-shadow !default
```

### Danger Hollow Button

``` sass
$button-hollow-danger-color: $color-danger !default
```

``` sass
$button-hollow-danger-hover-color: existing($button-danger-hover-color, $button-danger-color) !default
```

``` sass
$button-hollow-danger-active-color: existing($button-danger-active-color, $button-hollow-danger-hover-color) !default
```

``` sass
$button-hollow-danger-hover-background: existing($button-danger-hover-background, $button-danger-background) !default
```

``` sass
$button-hollow-danger-active-background: existing($button-danger-active-background, $button-hollow-danger-hover-background) !default
```

``` sass
$button-hollow-danger-border-color: null !default
```

``` sass
$button-hollow-danger-hover-border-color: existing($button-danger-hover-border-color, $button-danger-border-color, transparent) !default
```

``` sass
$button-hollow-danger-active-border-color: existing($button-danger-active-border-color, $button-hollow-danger-hover-border-color) !default
```

``` sass
$button-hollow-danger-box-shadow: $button-danger-box-shadow !default
```

``` sass
$button-hollow-danger-hover-box-shadow: $button-danger-hover-box-shadow !default
```

``` sass
$button-hollow-danger-active-box-shadow: $button-danger-active-box-shadow !default
```

### Dark Hollow Button

``` sass
$button-hollow-dark-color: $color-dark !default
```

``` sass
$button-hollow-dark-hover-color: existing($button-dark-hover-color, $button-dark-color) !default
```

``` sass
$button-hollow-dark-active-color: existing($button-dark-active-color, $button-hollow-dark-hover-color) !default
```

``` sass
$button-hollow-dark-hover-background: existing($button-dark-hover-background, $button-dark-background) !default
```

``` sass
$button-hollow-dark-active-background: existing($button-dark-active-background, $button-hollow-dark-hover-background) !default
```

``` sass
$button-hollow-dark-border-color: null !default
```

``` sass
$button-hollow-dark-hover-border-color: existing($button-dark-hover-border-color, $button-dark-border-color, transparent) !default
```

``` sass
$button-hollow-dark-active-border-color: existing($button-dark-active-border-color, $button-hollow-dark-hover-border-color) !default
```

``` sass
$button-hollow-dark-box-shadow: $button-dark-box-shadow !default
```

``` sass
$button-hollow-dark-hover-box-shadow: $button-dark-hover-box-shadow !default
```

``` sass
$button-hollow-dark-active-box-shadow: $button-dark-active-box-shadow !default
```

### Light Hollow Button

``` sass
$button-hollow-light-color: $color-light !default
```

``` sass
$button-hollow-light-hover-color: existing($button-light-hover-color, $button-light-color) !default
```

``` sass
$button-hollow-light-active-color: existing($button-light-active-color, $button-hollow-light-hover-color) !default
```

``` sass
$button-hollow-light-hover-background: existing($button-light-hover-background, $button-light-background) !default
```

``` sass
$button-hollow-light-active-background: existing($button-light-active-background, $button-hollow-light-hover-background) !default
```

``` sass
$button-hollow-light-border-color: null !default
```

``` sass
$button-hollow-light-hover-border-color: existing($button-light-hover-border-color, $button-light-border-color, transparent) !default
```

``` sass
$button-hollow-light-active-border-color: existing($button-light-active-border-color, $button-hollow-light-hover-border-color) !default
```

``` sass
$button-hollow-light-box-shadow: $button-light-box-shadow !default
```

``` sass
$button-hollow-light-hover-box-shadow: $button-light-hover-box-shadow !default
```

``` sass
$button-hollow-light-active-box-shadow: $button-light-active-box-shadow !default
```

### Primary Text Button

``` sass
$button-text-primary-color: $color-primary !default
```

``` sass
$button-text-primary-hover-color: darken($color-primary, 10%) !default
```

``` sass
$button-text-primary-active-color: $button-text-primary-hover-color !default
```

``` sass
$button-text-primary-text-shadow: null !default
```

``` sass
$button-text-primary-hover-text-shadow: null !default
```

``` sass
$button-text-primary-active-text-shadow: null !default
```

### Secondary Text Button

``` sass
$button-text-secondary-color: $color-secondary !default
```

``` sass
$button-text-secondary-hover-color: darken($color-secondary, 10%) !default
```

``` sass
$button-text-secondary-active-color: $button-text-secondary-hover-color !default
```

``` sass
$button-text-secondary-text-shadow: null !default
```

``` sass
$button-text-secondary-hover-text-shadow: null !default
```

``` sass
$button-text-secondary-active-text-shadow: null !default
```

### Danger Text Button

``` sass
$button-text-danger-color: $color-danger !default
```

``` sass
$button-text-danger-hover-color: darken($color-danger, 5%) !default
```

``` sass
$button-text-danger-active-color: $button-text-danger-hover-color !default
```

``` sass
$button-text-danger-text-shadow: null !default
```

``` sass
$button-text-danger-hover-text-shadow: null !default
```

``` sass
$button-text-danger-active-text-shadow: null !default
```

### Dark Text Button

``` sass
$button-text-dark-color: lighten($color-dark, 10%) !default
```

``` sass
$button-text-dark-hover-color: $color-dark !default
```

``` sass
$button-text-dark-active-color: $button-text-dark-hover-color !default
```

``` sass
$button-text-dark-text-shadow: null !default
```

``` sass
$button-text-dark-hover-text-shadow: null !default
```

``` sass
$button-text-dark-active-text-shadow: null !default
```

### Light Text Button

``` sass
$button-text-light-color: rgba($color-light, $opacity-muted) !default
```

``` sass
$button-text-light-hover-color: $color-light !default
```

``` sass
$button-text-light-active-color: $button-text-light-hover-color !default
```

``` sass
$button-text-light-text-shadow: null !default
```

``` sass
$button-text-light-hover-text-shadow: null !default
```

``` sass
$button-text-light-active-text-shadow: null !default
```