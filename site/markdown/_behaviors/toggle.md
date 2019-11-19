---
title: Toggle
description: Quickly show or hide elements without writting any Javascript code. 
---

## Introduction

It's a very common situation to show or hide an element dynamically
in front-end development. Toggle behavior helps you to do this
without having to write Javascript codes.
Let's see the below examples for clarification.

## Examples

{% capture toggle %}
<button class="btn btn-primary" data-toggle-for="toggle_example">Click to toggle</button>
<div class="bc-dark p-small" data-toggle-target="toggle_example">
  <p class="c-light">Hello Luda!</p>
</div>
{% endcapture %}
<div class="example">
  {{ toggle }}
</div>
``` html{{ toggle }}```

In this example, we use the `data-toggle-target` attribute to define a target,
and use the `data-toggle-for` attribute to define a trigger.
The values of these two attributes must be the same.

Let's see another example.

{% capture toggle_inside %}
<button class="btn btn-primary" data-toggle-for="toggle_example2">Click to toggle</button>
<div class="bc-dark p-small" data-toggle-target="toggle_example2" data-toggleable>
  <button class="btn btn-primary">Click to hide</button>
  <button class="btn btn-light" data-toggleable="false">Toggle behavior disabled</button>
</div>
{% endcapture %}
<div class="example">
  {{ toggle_inside }}
</div>
``` html{{ toggle_inside }}```

In this example, we add the attribute `data-toggleable` to the target element
to make it an anonymous trigger for itself.
We use the attribute `data-toggleable="false"` to partially disable the behavior
in the target, so when the disabled area clicked, the target will not be hided.

## HTML Attributes

### data-toggle-target

``` html
<!-- @example
Define a target.
-->
<div data-toggle-target="demo"></div>
```

### data-toggle-for

``` html
<!-- @example
Define a trigger, the value must be the same as
the value of its target's data-toggle-target attribute.
-->
<div data-toggle-for="demo"></div>
```

### data-toggleable

``` html
<!-- @example
Define an anonymous trigger wrapped
in the target or make the target an anonymous trigger fot itself.
-->
<div data-toggle-for="demo" data-toggleable></div>
```

### data-toggleable="false"

``` html
<!-- @example
Disable the behavior partially in an anonymous trigger.
-->
<div data-toggle-for="demo" data-toggleable>
  <div data-toggleable="false"></div>
</div>
```

### data-toggle-auto-deactivate

``` html
<!-- @example
Make a target automatically deactivated after activated.
The default value is 3000, which means the target will be deactivated
automatically after 3000 milliseconds whenever it's activated.
-->
<div data-toggle-target="demo" data-toggle-auto-deactivate="4000">...</div>
```

## Javascript Methods

### luda.toggle(selector).activate()

```bash
@param {LudaSelector} selector
@returns {LudaComponentProxy}
```

``` javascript
// @example Activate a target by passing in a selector.
luda.toggle('#my-toggle').activate()
```

### luda.toggle(selector).deactivate()

```bash
@param {LudaSelector} selector
@returns {LudaComponentProxy}
```

``` javascript
// @example Deactivate a target by passing in a selector.
luda.toggle('#my-toggle').deactivate()
```

### luda.toggle(selector).toggle(force)

```bash
@param {LudaSelector} selector
@param {boolean} [force]
@returns {LudaComponentProxy}
```

``` javascript
// @example Activate or deactivate a target depending on its state
// by passing in a selector.
luda.toggle('#my-toggle').toggle()
// @example Forcely activate a target.
luda.toggle('#my-toggle').toggle(true)
// @example Forcely deactivate a target.
luda.toggle('#my-toggle').toggle(false)
```

## Dom Events

### luda:toggle:activate

``` javascript
// @example This event will be triggered before
// the .toggle-active class added to the target.
luda(document).on('luda:toggle:activate', '#my-toggle', function(event){
  let myToggle = this
  // Prevent the target from being activated if necessary.
  event.preventDefault()
})
```

### luda:toggle:activated

``` javascript
// @example This event be triggered after
// the .toggle-active class added to the target and
// CSS transition finished.
luda(document).on('luda:toggle:activated', '#my-toggle', function(event){
  let myToggle = this
})
```

### luda:toggle:deactivate

``` javascript
// @example This event will be triggered before
// the .toggle-active class removed from the target.
luda(document).on('luda:toggle:deactivate', '#my-toggle', function(event){
  let myToggle = this
  // Prevent the target from being deactivated if necessary.
  event.preventDefault()
})
```

### luda:toggle:deactivated

``` javascript
// @example This event will be triggered after
// the .toggle-active class removed from the target and
// CSS transition finished.
luda(document).on('luda:toggle:deactivated', '#my-toggle', function(event){
  let myToggle = this
})
```