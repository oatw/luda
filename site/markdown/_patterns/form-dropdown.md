---
title: Form Dropdown
description: Create beautiful dropdowns for selecting options in forms.
---

## Introduction

The form dropdown component is based on the dropdown component,
it's an alternative to the form select field.
When create a form dropdown, the `.fm-dropdown` class need be
added to the dropdown container.
Let's see how to create single select form dropdowns and multiple
select form dropdowns through the below examples.

## Single Select Form Dropdown

Wrap `<input type="radio">`s in the dropdown menu to simulate
a single select field.
Wrap a text field for showing the placeholder and the selected options.

{% capture single %}
<div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
  <div class="fm fm-select">
    <input placeholder="Single select form dropdown">
  </div>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <div class="btn-radio btn-hollow-primary">
          <input type="radio" name="single_fm_dropdown" value="one">
          <label>Item one</label>
        </div>
        <div class="btn-radio btn-hollow-primary">
          <input type="radio" name="single_fm_dropdown" value="two">
          <label>Item two</label>
        </div>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ single }}
</div>
``` html{{ single }}```

## Multiple Select Form Dropdown

Wrap `<input type="checkbox">`s in the dropdown menu to simulate
a multiple select field.
Wrap a text field for showing the placeholder and the selected options.

The `data-dropdown-toggle-disabled` attribute should be added to the
`.dropdown-menu` to prevent the menu from being closed when menu
items clicked.

{% capture multiple %}
<div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
  <div class="fm fm-select">
    <input placeholder="Multiple select form dropdown">
  </div>
  <div class="dropdown-menu">
    <div class="dropdown-items" data-dropdown-toggle-disabled>
      <div class="btns-y">
        <div class="btn-check btn-hollow-primary">
          <input type="checkbox" name="multiple_fm_dropdown" value="one">
          <label>Item One</label>
        </div>
        <div class="btn-check btn-hollow-primary">
          <input type="checkbox" name="multiple_fm_dropdown" value="two">
          <label>Item Two</label>
        </div>
      </div>
    </div>
  </div>
</div>
{% endcapture %}

<div class="example">
  {{ multiple }}
</div>
``` html{{ multiple }}```

## Customize Option Labels

The form dropdown component uses the inner texts
of wrapped radio's labels and checkboxes' labels
for display, except when the `data-fm-dropdown-label` attribute is
setted on the radios or the checkboxes.

In the below example, we set the `data-fm-dropdown-label` attribute
on the radios.
When a radio is selected, the value of its `data-fm-dropdown-label`
attribute will show in the wrapped text field.

<!-- markdownlint-disable -->
{% capture customized_option_text %}
<div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
  <div class="fm fm-select">
    <input placeholder="Form dropdown with customized value">
  </div>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        <div class="btn-radio btn-hollow-primary btn-ico-left">
          <input data-fm-dropdown-label="You've selected item one." checked type="radio" name="custom_fm_dropdown" value="one">
          <label>Item one<i class="ico material-icons">face</i></label>
        </div>
        <div class="btn-radio btn-hollow-primary btn-ico-left">
          <input data-fm-dropdown-label="You've selected item two." type="radio" name="custom_fm_dropdown" value="two">
          <label>Item two<i class="ico material-icons">face</i></label>
        </div>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ customized_option_text }}
</div>
``` html{{ customized_option_text }}```
<!-- markdownlint-enable -->