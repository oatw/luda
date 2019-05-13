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
  <p class="mb-small">
    Do you really want to delete this article?
    This operation is permanent, think twice.
  </p>
  <button class="btn btn-primary mr-small">Yes, delete it!</button>
  <button class="btn btn-secondary">No, give up.</button>
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

<!-- markdownlint-disable -->
{% capture modal_toggle %}
<button class="btn btn-danger" data-toggle-for="delete_confirmation">
  Delete this article
</button>
<div class="overlay" data-toggle-target="delete_confirmation" data-toggle>
  <div class="overlay-body">
    <div class="modal" data-toggle-disabled>
      <h4>Are You Serious?</h4>
      <div class="fm-group mb-medium">
        <label class="fm-label" for="pwd">This operation is permanent, password must be entered to confirm.</label>
        <div class="fm fm-text">
          <input type="password" id="pwd" name="pwd" placeholder="E.g., Mypassword@12345">
        </div>        
      </div>
      <button class="btn btn-primary mr-small" data-toggle>Yes, delete it!</button>
      <button class="btn btn-secondary" data-toggle>No, give up.</button>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ modal_toggle }}
</div>
``` html{{ modal_toggle }}```
<!-- markdownlint-enable -->

## Sass Variables

### Size

``` sass
$modal-padding-rem: $spacing-medium-rem !default
```

``` sass
$modal-in-overlay-max-width-rem: px-to-rem(640px) !default
```

``` sass
$modal-in-overlay-min-width-rem: px-to-rem(320px) !default
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