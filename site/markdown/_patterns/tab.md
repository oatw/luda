---
title: Tab
description: Create horizontal tab navigations and vertical nativations easily.
---

## Introduction

The tab component includes two parts, tab indicators and tab panes.
Tab panes are used to wrap contents, and tab indicators are used to
control which tab pane to show.
A tab can be created with these classes: `.tab`, `.tab-indicators`,
`.tab-panes` and `.tab-pane`.

## Vertical Tab

To create a vertical tab navigation,
add the class `.tab` to a container,
then wrap tab indicators and tab panes like the below example.

{% capture tab %}
<div class="tab">
  <nav class="tab-indicators btns-x">
    <div class="btn-radio btn-hollow-secondary">
      <input type="radio" name="tab_demo">
      <label>Tab One</label>
    </div>
    <div class="btn-radio btn-hollow-secondary">
      <input type="radio" name="tab_demo">
      <label>Tab Two</label>
    </div>
    <div class="btn-radio btn-hollow-secondary">
      <input type="radio" name="tab_demo">
      <label>Tab Three</label>
    </div>
  </nav>
  <div class="tab-panes">
    <div class="tab-pane">
      <p>
        Once upon time a girl named Cinderella lived with her stepmother
        and two stepsisters. Poor Cinderella had to work hard all day long
        so the others could rest...
      </p>
    </div>
    <div class="tab-pane">
      <p>It was she who had to wake up each morning when it was still dark and cold
         to start the fire. It was she who cooked the meals...
       </p>
    </div>
    <div class="tab-pane">
      <p>
        It was she who kept the fire going. The poor girl could not stay clean,
        from all the ashes and cinders by the fire...
      </p>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ tab }}
</div>
``` html{{ tab }}```

## Horizontal Tab

To create a horizontal tab navigation,
a `.grid` need be wrapped in the `.tab` container.
Let's see the below example for detail.

{% capture horizontal %}
<div class="tab">
  <div class="grid">
    <div class="col-4 col-3-m">
      <nav class="tab-indicators btns-y btns-fluid">
        <div class="btn-radio btn-hollow-secondary">
          <input type="radio" name="horizontal_tab">
          <label>One</label>
        </div>
        <div class="btn-radio btn-hollow-secondary">
          <input type="radio" checked name="horizontal_tab">
          <label>Two</label>
        </div>
        <div class="btn-radio btn-hollow-secondary">
          <input type="radio" name="horizontal_tab">
          <label>Three</label>
        </div>
      </nav>
    </div>
    <div class="col-auto">
      <div class="tab-panes">
        <div class="tab-pane">
          <p>
            Once upon time a girl named Cinderella lived with her stepmother
            and two stepsisters. Poor Cinderella had to work hard all day long
            so the others could rest...
          </p>
        </div>
        <div class="tab-pane">
          <p>
            It was she who had to wake up each morning
            when it was still dark and cold
            to start the fire. It was she who cooked the meals...
          </p>
        </div>
        <div class="tab-pane">
          <p>
            It was she who kept the fire going. The poor girl could not stay clean,
            from all the ashes and cinders by the fire...
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
{% endcapture %}
<div style="margin: 1rem -1rem">
  {{ horizontal }}  
</div>
``` html{{ horizontal }}```

## Javascript Methods

### luda.tab.activate(element, index)

``` javascript
luda.tab.activate(document.querySelector('#my-tab'), 0)
```

Activate a specific tab pane by passing in its index number.

## DOM Events

### luda:tab:activate

``` javascript
luda.on('luda:tab:activate', '#my-tab', function(event){
  let $myTab = this, $pane = event.tartet, index = event.detail
  event.preventDefault() // Prevent the pane from being activated if necessary.
})
```

Will be triggered before the `.tab-pane-active` class added to a tab pane.

### luda:tab:activated

``` javascript
luda.on('luda:tab:activated', '#my-tab', function(event){
  let $myTab = this, $pane = event.tartet, index = event.detail
})
```

Will be triggered after the `.tab-pane-active` class added to a tab pane
and CSS transition finished.

### luda:tab:deactivate

``` javascript
luda.on('luda:tab:deactivate', '#my-tab', function(event){
  let $myTab = this, $pane = event.tartet, index = event.detail
  event.preventDefault() // Prevent the pane from being deactivated if necessary.
})
```

Will be triggered before the `.tab-pane-active` class removed from a tab pane.

### luda:tab:deactivated

``` javascript
luda.on('luda:tab:deactivated', '#my-tab', function(event){
  let $myTab = this, $pane = event.tartet, index = event.detail
})
```

Will be triggered after the `.tab-pane-active` class removed from a tab pane
and CSS transition finished.

## Sass Variables

``` sass
$tab-panes-padding-rem: null !default
```