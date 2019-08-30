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
<div data-toggle-target="demo"></div>
```

Define a target.

### data-toggle-for

``` html
<div data-toggle-for="demo"></div>
```

Define a trigger,
the value must be the same as the value of its target's `data-toggle-target` attribute.

### data-toggleable

``` html
<div data-toggle-for="demo" data-toggleable></div>
```

Define an anonymous trigger wrapped
in the target or make the target an anonymous trigger fot itself.

### data-toggleable="false"

``` html
<div data-toggle-for="demo" data-toggleable>
  <div data-toggleable="false"></div>
</div>
```

Disable the behavior partially in an anonymous trigger.

### data-toggle-auto-deactivate

``` html
<div data-toggle-target="demo" data-toggle-auto-deactivate="4000">...</div>
```

Make a target automatically deactivated after activated.
The default value is `3000`, which means the target will be deactivated
automatically after 3000 milliseconds whenever it's activated.

## Javascript Methods

### luda.toggle(selector).activate()

``` javascript
luda.toggle('#my-toggle').activate()
```

Activate a target by passing in a selector.

### luda.toggle(selector).deactivate()

``` javascript
luda.toggle('#my-toggle').deactivate()
```

Deactivate a target by passing in a selector.

### luda.toggle(selector).toggle()

``` javascript
luda.toggle('#my-toggle').toggle()
```

Activate or deactivate a target depending on its state
by passing in a selector.

``` javascript
luda.toggle('#my-toggle').toggle(true)
```

Activate a target by passing true.

``` javascript
luda.toggle('#my-toggle').toggle(false)
```

Deactivate a target by passing true.

## Dom Events

### luda:toggle:activate

``` javascript
luda(document).on('luda:toggle:activate', '#my-toggle', function(event){
  let myToggle = this
  event.preventDefault() // Prevent the target from being activated if necessary.
})
```

Will be triggered before the `.toggle-active` class added to the target.

### luda:toggle:activated

``` javascript
luda(document).on('luda:toggle:activated', '#my-toggle', function(event){
  let myToggle = this
})
```

Will be triggered after the `.toggle-active` class added to the target
and CSS transition finished.

### luda:toggle:deactivate

``` javascript
luda(document).on('luda:toggle:deactivate', '#my-toggle', function(event){
  let myToggle = this
  event.preventDefault() // Prevent the target from being deactivated if necessary.
})
```

Will be triggered before the `.toggle-active` class removed from the target.

### luda:toggle:deactivated

``` javascript
luda(document).on('luda:toggle:deactivated', '#my-toggle', function(event){
  let myToggle = this
})
```

Will be triggered after the `.toggle-active` class removed from the target
and CSS transition finished.