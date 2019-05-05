---
title: Modal
description: Show a custom dialog for users to confirm operations.
---

## Usage

A modal is simple to create, add the `.modal` class to a container,
then wrap contents inside.

{% capture modal %}
<div class="modal">
  <h4>Confirm Your Operation</h4>
  <p>
    Do you really want to delete this article?
    This operation is permanent, think twice.
  </p>
  <div class="btns-x btns-margin mt-small">
    <button class="btn btn-primary">Yes, delete it!</button>
    <button class="btn btn-secondary">No, give up.</button>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ modal }}
</div>
``` html{{ modal }}```

## Dynamic Control

We can combine the modal component with the overlay component
and the toggle behavior to make the modal more powerful.
Let's see the below example.

{% capture modal_toggle %}
<button class="btn btn-danger" data-toggle-for="delete_confirmation">
  Delete this article
</button>
<div class="overlay" data-toggle-target="delete_confirmation" data-toggle>
  <div class="overlay-body">
    <div class="modal" data-toggle-disabled>
      <h4>Are You Serious?</h4>
      <p>This operation is permanent, password must be entered to confirm.</p>
      <div class="fm fm-text">
        <input type="password" placeholder="Enter password">
      </div>
      <div class="btns-x btns-margin mt-medium" data-toggle>
        <button class="btn btn-primary">Yes, delete it!</button>
        <button class="btn btn-secondary">No, give up.</button>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ modal_toggle }}
</div>
``` html{{ modal_toggle }}```

## Sass Variables

### Size

``` sass
$modal-padding-rem: $spacing-medium-rem !default
```

``` sass
$modal-in-overlay-max-width-rem: 46.153846rem !default
```

``` sass
$modal-in-overlay-min-width-rem: 24.615384rem !default
```

### Others

``` sass
$modal-background: $background-color-muted !default
```

``` sass
$modal-border-radius: $border-radius-main !default
```

``` sass
$modal-box-shadow: null !default
```