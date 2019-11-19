---
title: Dropdown
description: Create different kinds of toggleable dropdown menus
             with the dropdown component.
---

## Introduction

The dropdown component in Luda includes two parts, a trigger and a menu.
It can be created with these classes: `.dropdown-{type}`, `.dropdown-menu`
and `.dropdown-items`.

The dropdown component can be controlled with the `Tab` key, the `Enter` key,
the `Esc` key, and the arrow keys.

Let's have a look at how to create different type
dropdowns through the below examples.

## Absolute Dropdown

An absolute dropdown should be wrapped in a container which has the
`.dropdown-absolute` class.

{% capture absolute_dropdown %}
<div class="dropdown-absolute">
  <button class="btn btn-primary btn-ico-right"> <!-- The trigger -->
    Dropdown <i class="ico ico-down"></i>
  </button>
  <div class="dropdown-menu"> <!-- The menu -->
    <div class="dropdown-items">
      <div class="btns-y"> <!-- Use a button group as the dropdown items -->
        <button class="btn btn-hollow-primary">One</button>
        <button class="btn btn-hollow-primary">Two</button>
        <button class="btn btn-hollow-primary">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ absolute_dropdown }}
</div>
``` html{{ absolute_dropdown }}```

### Style Modifiers

#### .dropdown-top{% include modifier.md %}

Add the `.dropdown-top` class to an absolute dropdown to
align its menu on the top of its trigger.

{% capture top %}
<div class="dropdown-absolute dropdown-top">
  <button class="btn btn-primary btn-ico-right">
    Dropdown <i class="ico ico-up"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-primary">One</button>
        <button class="btn btn-primary">Two</button>
        <button class="btn btn-primary">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ top }}
</div>
``` html{{ top }}```

#### .dropdown-right{% include modifier.md %}

Add the `.dropdown-right` class to an absolute dropdown to
align its menu on the right of its trigger.

{% capture right %}
<div class="dropdown-absolute dropdown-right">
  <button class="btn btn-primary btn-ico-right">
    Dropdown <i class="ico ico-right"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-primary">One</button>
        <button class="btn btn-primary">Two</button>
        <button class="btn btn-primary">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ right }}
</div>
``` html{{ right }}```

#### .dropdown-left{% include modifier.md %}

Add the `.dropdown-left` class to an absolute dropdown to
align its menu on the left of its trigger.

{% capture left %}
<div class="dropdown-absolute dropdown-left">
  <button class="btn btn-primary btn-ico-left">
    Dropdown <i class="ico ico-left"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-primary">One</button>
        <button class="btn btn-primary">Two</button>
        <button class="btn btn-primary">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example d-flex jc-end">
  {{ left }}
</div>
``` html{{ left }}```

#### .dropdown-align-right{% include modifier.md %}

Add the `.dropdown-align-right` class to an absolute dropdown to
align its menu to the right edge of its trigger.

{% capture align_right %}
<div class="dropdown-absolute dropdown-align-right">
  <button class="btn btn-primary btn-ico-right">
    Dropdown <i class="ico ico-down"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-primary">One</button>
        <button class="btn btn-primary">Two</button>
        <button class="btn btn-primary">A long long line</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ align_right }}
</div>
``` html{{ align_right }}```

## Static Dropdown

A static dropdown is in the normal document flow, it should be wrapped
in a container which has the `.dropdown-static` class.

{% capture static_dropdown %}
<div class="dropdown-static">
  <button class="btn btn-text-dark btn-ico-right">
    Dropdown <i class="ico ico-down"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-text-dark">One</button>
        <button class="btn btn-text-dark">Two</button>
        <button class="btn btn-text-dark">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ static_dropdown }}
</div>
``` html{{ static_dropdown }}```

## Nested Dropdowns

### Nested Absolute Dropdowns

Absolute dropdowns can be nested.
Let's see the below example for detail.

<!-- markdownlint-disable -->
{% capture nested_absolute_dropdown %}
<div class="dropdown-absolute">
  <button class="btn btn-primary">Drink something?</button>
  <div class="dropdown-menu">
    <!-- The of-visible utility prevents the root dropdown from scrolling. -->
    <div class="dropdown-items of-visible">
      <div class="dropdown-absolute dropdown-right">
        <!-- The bd-b-none utility and the sharp-b utility remove the trigger's border and border radius of the bottom.  -->
        <button class="btn btn-primary btn-ico-right bd-b-none sharp-b">Juice <i class="ico ico-right"></i></button>
        <div class="dropdown-menu">
          <div class="dropdown-items">
            <div class="btns-y">
              <button class="btn btn-dark">Apple</button>
              <button class="btn btn-dark">Orange</button>
              <button class="btn btn-dark">Banana</button>
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary bd-t-none bd-b-none sharp">Whiskey, please.</button>
      <button class="btn btn-primary bd-t-none sharp-t">No, thanks.</button>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ nested_absolute_dropdown }}
</div>
``` html{{ nested_absolute_dropdown }}```
<!-- markdownlint-enable -->

### Nested Static Dropdowns

Static dropdowns can also be nested, we can use nested static dropdowns
to create a menu tree. Let's see the below example for detail.

<!-- markdownlint-disable -->
{% capture nested_static_dropdown %}
<div class="dropdown-static">
  <button class="btn btn-text-dark">Any thing to eat?</button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="dropdown-static">
        <button class="btn btn-text-dark btn-ico-right">Fruit <i class="ico ico-down"></i></button>
        <div class="dropdown-menu">
          <div class="dropdown-items">
            <div class="btns-y">
              <button class="btn btn-text-dark">Apple</button>
              <button class="btn btn-text-dark">Orange</button>
              <button class="btn btn-text-dark">Banana</button>
            </div>
          </div>
        </div>
      </div>
      <div class="dropdown-static">
        <button class="btn btn-text-dark btn-ico-right">Meat <i class="ico ico-down"></i></button>
        <div class="dropdown-menu">
          <div class="dropdown-items">
            <div class="btns-y">
              <button class="btn btn-text-dark">Chicken</button>
              <button class="btn btn-text-dark">Pig</button>
              <button class="btn btn-text-dark">Duck</button>
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-text-dark">No, Thanks.</button>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ nested_static_dropdown }}
</div>
``` html{{ nested_static_dropdown }}```
<!-- markdownlint-enable -->

## Responsive Dropdown

The `.dropdown-fixed` class is designed for mobile devices.
It helps to show a dropdown menu with a cover on the document viewport.
The `.dropdown-absolute-m` class is designed to combine with
the `.dropdown-fixed` class to create a responsive dropdown.

The combination of these two classes means a fixed dropdown
is prefered on small screens, and an absolute dropdown is prefered
on middle size screens and large screens.
Let's see the below example for detail.

<!-- markdownlint-disable -->
{% capture responsive_dropdown %}
<div class="dropdown-fixed dropdown-absolute-m">
  <button class="btn btn-primary btn-ico-right">
    I'm responsive <i class="ico ico-down"></i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <button class="btn btn-primary">One</button>
        <button class="btn btn-primary">Two</button>
        <button class="btn btn-primary">Three</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ responsive_dropdown }}
</div>
``` html{{ responsive_dropdown }}```
<!-- markdownlint-enable -->

## HTML Attributes

### data-dropdown-standalone

``` html
<!-- @example
Prevent a dropdown from being toggled unless
the click event is triggered on itself or its descendant elements.
-->
<div class="dropdown-absolute" data-dropdown-standalone>...</div>
```

### data-dropdownable

``` html
<!-- @example
Prevent a dropdown from being toggled when
the click event is triggered on a specific element
or the specific element's descendant elements.
-->
<div class="dropdown-items" data-dropdownable="false">...</div>
<!-- @example
Recover the ability of toggling the dropdown
for a specific element and the element's descendant elements.
-->
<div class="dropdown-items" data-dropdownable="false">
  <div class="btns-y">
    <button data-dropdownable class="btn btn-primary">Do something</button>
    <button class="btn btn-primary">Close</button>
  </div>
</div>
```

## Javascript Methods

### luda.dropdown(selector).activate()

```bash
@param {LudaSelector} selector
@returns {LudaComponentProxy}
```

``` javascript
// @example Open a dropdown.
luda.dropdown('#my-dropdown').activate()
```

### luda.dropdown(selector).deactivate()

```bash
@param {LudaSelector} selector
@returns {LudaComponentProxy}
```

``` javascript
// @example Close a dropdown.
luda.dropdown('#my-dropdown').deactivate()
```

### luda.dropdown(selector).toggle(force)

```bash
@param {LudaSelector} selector
@param {boolean} [force]
@returns {LudaComponentProxy}
```

``` javascript
// @example Open or Close a dropdown depending on its state
// by passing in a selector.
luda.dropdown('#my-dropdown').toggle()
// @example Forcely open a dropdown.
luda.dropdown('#my-dropdown').toggle(true)
// @example Forcely close a dropdown.
luda.dropdown('#my-dropdown').toggle(false)
```

## DOM Events

### luda:dropdown:activate

``` javascript
// @example This event will be triggered before
// the .dropdown-active class added to a dropdown.
luda(document).on('luda:dropdown:activate', '#my-dropdown', function(event){
  let myDropdown = this, myDropdownMenu = event.target
  // Prevent the dropdown from being activated if necessary.
  event.preventDefault()
})
```

### luda:dropdown:activated

``` javascript
// @example This event will be triggered after
// the .dropdown-active class added to a dropdown and
// CSS transition finished.
luda(document).on('luda:dropdown:activated', '#my-dropdown', function(event){
  let myDropdown = this, myDropdownMenu = event.target
})
```

### luda:dropdown:deactivate

``` javascript
// @example This event will be triggered before
// the .dropdown-active class removed from a dropdown.
luda(document).on('luda:dropdown:deactivate', '#my-dropdown', function(event){
  let myDropdown = this, myDropdownMenu = event.target
  // Prevent the dropdown from being deactivated if necessary.
  event.preventDefault()
})
```

### luda:dropdown:deactivated

``` javascript
// @example This event will be triggered after
// the .dropdown-active class removed from a dropdown and
// CSS transition finished.
luda(document).on('luda:dropdown:deactivated', '#my-dropdown', function(event){
  let myDropdown = this, myDropdownMenu = event.target
})
```

## Sass Variables

### Size

``` sass
$dropdown-width-breakpoint: m !default
```

Default breakpoint of the `.dropdown-absolute-{postfix}` class.

``` sass
$dropdown-static-menu-margin-left-rem: $spacing-small-rem !default
```

``` sass
$dropdown-absolute-max-height-rem: baseline(50) !default
```

``` sass
$dropdown-absolute-activated-gap-rem: $spacing-tiny-rem !default
```

### Others

``` sass
$dropdown-absolute-border-radius: $border-radius-main !default
```

``` sass
$dropdown-absolute-fixed-background: $background-color-main !default
```

``` sass
$dropdown-absolute-box-shadow: $box-shadow-normal !default
```