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
<div class="bc-dark p-small" data-toggle-target="toggle_example2" data-toggle>
  <button class="btn btn-primary">Click to hide</button>
  <button class="btn btn-light" data-toggle-disabled>Toggle behavior disabled</button>
</div>
{% endcapture %}
<div class="example">
  {{ toggle_inside }}
</div>
``` html{{ toggle_inside }}```

In this example, we add the attribute `data-toggle` to the target element
to make it an anonymous trigger for itself.
We use the attribute `data-toggle-disabled` to partially disable the behavior
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

### data-toggle

``` html
<div data-toggle-for="demo" data-toggle></div>
```

Define an anonymous trigger wrapped
in the target or make the target an anonymous trigger fot itself.

### data-toggle-disabled

``` html
<div data-toggle-for="demo" data-toggle>
  <div data-toggle-disabled></div>
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

### luda.toggle.activate(name | element)

``` javascript
luda.toggle.activate('demo')
```

Activate a target by passing in the value of
its `data-toggle-target` attribute.

``` javascript
luda.toggle.activate(document.querySelector('[data-toggle-target="demo"]'))
```

Activate a target by passing in the Element instance.

### luda.toggle.deactivate(name | element)

``` javascript
luda.toggle.deactivate('demo')
```

Deactivate a target by passing in the value of
its `data-toggle-target` attribute.

``` javascript
luda.toggle.deactivate(document.querySelector('[data-toggle-target="demo"]'))
```

Deactivate a target by passing the the Element instance.

### luda.toggle.toggle(name | element)

``` javascript
luda.toggle.toggle('demo')
```

Activate or deactivate a target depending on its state
by passing in the value of its `data-toggle-target` attribute.

``` javascript
luda.toggle.toggle(document.querySelector('[data-toggle-target="demo"]'))
```

Activate or deactivate a target depending on its state
by passing in the Element instance.

## Dom Events

### luda:toggle:activate

``` javascript
luda.on('luda:toggle:activate', '#myTarget', function(event){
  let $myTarget = this
  event.preventDefault() // Prevent the target from being activated if necessary.
})
```

Will be triggered before the `.toggle-active` class added to the target.

### luda:toggle:activated

``` javascript
luda.on('luda:toggle:activated', '#myTarget', function(event){
  let $myTarget = this
})
```

Will be triggered after the `.toggle-active` class added to the target
and CSS transition finished.

### luda:toggle:deactivate

``` javascript
luda.on('luda:toggle:deactivate', '#myTarget', function(event){
  let $myTarget = this
  event.preventDefault() // Prevent the target from being deactivated if necessary.
})
```

Will be triggered before the `.toggle-active` class removed from the target.

### luda:toggle:deactivated

``` javascript
luda.on('luda:toggle:deactivated', '#myTarget', function(event){
  let $myTarget = this
})
```

Will be triggered after the `.toggle-active` class removed from the target
and CSS transition finished.