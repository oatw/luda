---
title: Form Group
description: Group form inputs and labels together, and combine with the
             grid to create complex form layouts.
---

## Basic Usage

Add the `.fm-group` to a container, then wrap a label and input elements
inside to create a form group.

<!-- markdownlint-disable -->
{% capture form_group %}
<form>
  <div class="fm-group">
    <label class="fm-label" for="fullname">Fullname</label>
    <div class="fm fm-text">
      <input type="text" id="fullname" name="fullname" placeholder="E.g., James Bond">
    </div>
  </div>
  <fieldset class="fm-group">
    <legend class="fm-label">Addresses</legend>
    <div class="fm fm-text">
      <label for="primary-address" class="d-none">primary address</label>
      <input type="text" id="primary-address" name="primary_address" placeholder="E.g., Menlo Park, California, United States">
    </div>
    <div class="fm fm-text">
      <label for="secondary-address" class="d-none">secondary address</label>
      <input type="text" id="secondary-address" name="secondary_address" placeholder="E.g., Cambridge, Massachusetts, United States">
    </div>
  </fieldset>
  <fieldset class="fm-group">
    <legend class="fm-label">Hobby</legend>
    <div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
      <div class="fm fm-select">
        <input placeholder="E.g., Basketball">
      </div>
      <div class="dropdown-menu">
        <div class="dropdown-items">
          <div class="btns-y">
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" id="hobby-basketball" name="hobby" value="basketball">
              <label for="hobby-basketball">Basketball</label>
            </div>
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" id="hobby-football" name="hobby" value="football">
              <label for="hobby-football">Football</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </fieldset>
  <fieldset class="fm-group">
    <legend class="fm-label">Languages</legend>
    <div class="fm fm-check">
      <label><input type="checkbox" name="languages" value="zh">Chinese</label>
      <label><input type="checkbox" name="languages" value="en">English</label>
      <label><input type="checkbox" name="languages" value="fr">Franch</label>
      <label><input type="checkbox" name="languages" value="ja">Japanese</label>
      <label><input type="checkbox" name="languages" value="it">Italian</label>
      <label><input type="checkbox" name="languages" value="sp">Spanish</label>
    </div>
  </fieldset>  
</form>
{% endcapture %}
<div class="example">
  {{ form_group }}
</div>
``` html{{ form_group }}```
<!-- markdownlint-enable -->

## Form Groups in Grid

Form groups can be wrapped in a `.grid` container, the `.col-*` classes
can be added to `.fm-group`s to create a responsive form layout.

<!-- markdownlint-disable -->
{% capture form_group_in_grid %}
<form class="grid">
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label" for="firstname">Firstname</label>
    <div class="fm fm-text">
      <input id="firstname" name="firstname" placeholder="E.g., James">
    </div>
  </div>
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label" for="family-name">Family Name</label>
    <div class="fm fm-text">
      <input id="family-name" name="family_name" placeholder="E.g., Bond">
    </div>
  </div>
  <div class="fm-group col-12 col-6-m">
    <label class="fm-label" for="resume">Resume</label>
    <div class="fm fm-file">
      <input type="file" id="resume" name="resume" placeholder="E.g., my_resume.pdf">
    </div>
  </div>
  <fieldset class="fm-group col-12 col-6-m">
    <legend class="fm-label">Country</legend>
    <div class="fm-dropdown dropdown-fixed dropdown-absolute-m">
      <div class="fm fm-select">
        <input placeholder="E.g., America">
      </div>
      <div class="dropdown-menu">
        <div class="dropdown-items">
          <div class="btns-y">
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" id="america" name="country" value="america">
              <label for="america">America</label>
            </div>
            <div class="btn-radio btn-hollow-primary">
              <input type="radio" id="china" name="country" value="china">
              <label for="china">China</label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </fieldset>
  <fieldset class="fm-group col-12">
    <legend class="fm-label">Languages</legend>
    <div class="fm fm-check">
      <label><input type="checkbox" name="languages" value="zh">Chinese</label>
      <label><input type="checkbox" name="languages" value="en">English</label>
      <label><input type="checkbox" name="languages" value="fr">Franch</label>
      <label><input type="checkbox" name="languages" value="ja">Japanese</label>
      <label><input type="checkbox" name="languages" value="it">Italian</label>
      <label><input type="checkbox" name="languages" value="sp">Spanish</label>
    </div>
  </fieldset>
</form>
{% endcapture %}
<div style="margin: 1rem -1rem">
  {{ form_group_in_grid }}
</div>
``` html{{ form_group_in_grid }}```
<!-- markdownlint-enable -->

## Grids in Form Group

A form group can include `.grid`s to create responsive form layouts.
The `.fm-label-nowrap` class and the `.fm-label-wrap` class can be used
in form groups for better alignment effects.
Let's see the below example for clarification.

<!-- markdownlint-disable -->
{% capture grid_in_form_group %}
<form>
  <div class="fm-group">
    <div class="grid">
      <!-- Use the .fm-label-wrap modifier to
      break the long texts in the label in two lines. -->
      <label class="fm-label fm-label-wrap col-auto" for="fullname">Your full name, please!</label>
      <div class="fm fm-text col-8 col-10-m">
        <input type="text" id="fullname" name="fullname" placeholder="E.g., James Bond">
      </div>
    </div>
  </div>
  <fieldset class="fm-group">
    <div class="grid">
      <!-- Use the .fm-label-nowrap class to
      ensure the texts in the label show in a single line. -->
      <legend class="fm-label fm-label-nowrap col-auto">Addresses</legend>
      <div class="fm fm-text col-4 col-5-m">
        <label for="address1" class="d-none">address1</label>
        <input type="text" id="address1" name="address1" placeholder="E.g., Menlo Park, California">
      </div>
      <div class="fm fm-text col-4 col-5-m">
        <label for="address2" class="d-none">address2</label>
        <input type="text" id="address2" name="address2" placeholder="E.g., Cambridge, Massachusetts">
      </div>
    </div>
  </fieldset>
  <fieldset class="fm-group">
    <div class="grid">
      <legend class="fm-label fm-label-nowrap col-auto">Hobby</legend>
      <div class="fm-dropdown dropdown-fixed dropdown-absolute-m col-8 col-10-m">
        <div class="fm fm-select">
          <input placeholder="E.g., Basketball">
        </div>
        <div class="dropdown-menu">
          <div class="dropdown-items">
            <div class="btns-y">
              <div class="btn-radio btn-hollow-primary">
                <input type="radio" id="basketball" name="hobby2" value="basketball">
                <label for="hobby-basketball">Basketball</label>
              </div>
              <div class="btn-radio btn-hollow-primary">
                <input type="radio" id="football" name="hobby2" value="football">
                <label for="hobby-football">Football</label>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </fieldset>
  <fieldset class="fm-group">
    <div class="grid">
      <legend class="fm-label fm-label-nowrap col-auto">Languages</legend>
      <!-- Use the .my-tiny class for a better alignment effect. -->
      <div class="fm fm-check col-8 col-10-m my-tiny">
        <label><input type="checkbox" name="languages" value="zh">Chinese</label>
        <label><input type="checkbox" name="languages" value="en">English</label>
        <label><input type="checkbox" name="languages" value="fr">Franch</label>
        <label><input type="checkbox" name="languages" value="it">Italian</label>
        <label><input type="checkbox" name="languages" value="ja">Japanese</label>
        <label><input type="checkbox" name="languages" value="sp">Spanish</label>
      </div>
    </div>
  </fieldset>  
</form>
{% endcapture %}
<div class="example">
  {{ grid_in_form_group }}
</div>
``` html{{ grid_in_form_group }}```
<!-- markdownlint-enable -->

## Sass Variables

``` sass
$form-group-label-vertical-margin-rem: null !default
```

``` sass
$form-group-element-vertical-margin-rem: $spacing-small-rem !default
```

Default vertical margins of input elements in form groups.