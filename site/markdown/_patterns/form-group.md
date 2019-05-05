---
title: Form Group
description: Group form inputs and labels together, and combine with the
             grid to create complex form layouts.
---

## Basic Usage

Add the `.fm-group` to a container, then wrap a label and input elements
inside to create a form group.

{% capture form_group %}
<form>
  <div class="fm-group">
    <label class="fm-label">Full Name</label>
    <div class="fm fm-text">
      <input type="text" placeholder="Enter your full name">
    </div>
  </div>
  <div class="fm-group">
    <label class="fm-label">Address</label>
    <div class="fm fm-text">
      <input type="text" placeholder="Country">
    </div>
    <div class="fm fm-text">
      <input type="text" placeholder="City">
    </div>
  </div>
  <div class="fm-group">
    <label class="fm-label">Hobby</label>
    <div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
      <div class="fm fm-select">
        <input placeholder="Select your hobby">
      </div>
      <div class="dropdown-menu">
        <div class="dropdown-items">
          <div class="btns-y">
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" name="hobby" value="basketball">
              <label>Basketball</label>
            </div>
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" name="hobby" value="football">
              <label>Football</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="fm-group">
    <label class="fm-label">Languages</label>
    <div class="fm fm-check">
      <label><input type="checkbox">Chinese</label>
      <label><input type="checkbox">English</label>
      <label><input type="checkbox">Franch</label>
      <label><input type="checkbox">Japanese</label>
      <label><input type="checkbox">Italian</label>
      <label><input type="checkbox">Spanish</label>
      </div>
  </div>  
</form>
{% endcapture %}
<div class="example">
  {{ form_group }}
</div>
``` html{{ form_group }}```

## Form Groups in Grid

Form groups can be wrapped in a `.grid` container, the `.col-*` classes
can be added to `.fm-group`s to create a responsive form layout.

{% capture form_group_in_grid %}
<form class="grid">
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label">First Name</label>
    <div class="fm fm-text">
      <input type="text" placeholder="Enter your first name">
    </div>
  </div>
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label">Family Name</label>
    <div class="fm fm-text">
      <input placeholder="Enter your family name">
    </div>
  </div>
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label">Resume</label>
    <div class="fm fm-file">
      <input type="file" placeholder="Upload your resume">
    </div>
  </div>
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label">Country</label>
    <div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
      <div class="fm fm-select">
        <input placeholder="Select your country">
      </div>
      <div class="dropdown-menu">
        <div class="dropdown-items">
          <div class="btns-y">
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" name="country" value="america">
              <label>America</label>
            </div>
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" name="country" value="china">
              <label>China</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="fm-group col-12">
    <label class="fm-label">Languages</label>
    <div class="fm fm-check">
      <label><input type="checkbox">Chinese</label>
      <label><input type="checkbox">English</label>
      <label><input type="checkbox">Franch</label>
      <label><input type="checkbox">Japanese</label>
      <label><input type="checkbox">Italian</label>
      <label><input type="checkbox">Spanish</label>
    </div>
  </div>
</form>
{% endcapture %}
<div style="margin: 1rem -1rem">
  {{ form_group_in_grid }}
</div>
``` html{{ form_group_in_grid }}```

## Grids in Form Group

A form group can include `.grid`s to create responsive form layouts.
The `.fm-label-nowrap` class and the `.fm-label-wrap` class can be used
in form groups for better alignment effects.
Let's see the below example for clarification.

{% capture grid_in_form_group %}
<form>
  <div class="fm-group">
    <div class="grid">
      <!-- Use the .fm-label-wrap modifier to
      break the long texts in the label in two lines. -->
      <label class="fm-label fm-label-wrap col-auto">Your full name, please!</label>
      <div class="fm fm-text col-8 col-10-m">
        <input type="text" placeholder="Enter your full name">
      </div>
    </div>
  </div>
  <div class="fm-group">
    <div class="grid">
      <!-- Use the .fm-label-nowrap class to
      ensure the texts in the label show in a single line. -->
      <label class="fm-label fm-label-nowrap col-auto">Address</label>
      <div class="fm fm-text col-4 col-5-m">
        <input type="text" placeholder="Country">
      </div>
      <div class="fm fm-text col-4 col-5-m">
        <input type="text" placeholder="City">
      </div>
    </div>
  </div>
  <div class="fm-group">
    <div class="grid">
      <label class="fm-label fm-label-nowrap col-auto">Hobby</label>
      <div class="fm-dropdown dropdown-fixed dropdown-absolute-m col-8 col-10-m">
        <div class="fm fm-select">
          <input placeholder="Select your hobby">
        </div>
        <div class="dropdown-menu">
          <div class="dropdown-items">
            <div class="btns-y">
              <div class="btn-radio btn-hollow-primary">
                <input type="radio" name="hobby" value="basketball">
                <label>Basketball</label>
              </div>
              <div class="btn-radio btn-hollow-primary">
                <input type="radio" name="hobby" value="football">
                <label>Football</label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="fm-group">
    <div class="grid">
      <label class="fm-label fm-label-nowrap col-auto">Languages</label>
      <!-- Use the .my-tiny class for a better alignment effect. -->
      <div class="fm fm-check col-8 col-10-m my-tiny">
        <label><input type="checkbox">Chinese</label>
        <label><input type="checkbox">English</label>
        <label><input type="checkbox">Franch</label>
        <label><input type="checkbox">Italian</label>
        <label><input type="checkbox">Japanese</label>
        <label><input type="checkbox">Spanish</label>
      </div>
    </div>
  </div>  
</form>
{% endcapture %}
<div class="example">
  {{ grid_in_form_group }}
</div>
``` html{{ grid_in_form_group }}```

## Sass Variables

``` sass
$form-group-element-vertical-margin-rem: $spacing-small-rem !default
```

Default vertical margins of input elements in form groups.