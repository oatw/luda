---
title: Carousel
description: Learn how to create a carousel includes images, texts,
             control buttons and indicators, and also how to customize
             carousel transition effects.
---

## Introduction

The carousel component in Luda mainly includes three parts:
content items, control buttons(optional) and indicators(optional).
The control buttons only shows on middle size screens and
large screens.

The carousel responds to events triggered by
mouse or touches on the screen.
It supports almost any necessary control actions,
like pausing, restarting, activating next item, activating prev item,
activating a specific item and more.

Let's get familiar with how to create a carousel with the carousel classes
through the below example.

<!-- markdownlint-disable -->
{% capture carousel %}
<div class="carousel">
  <div class="carousel-box">
    <!-- A carousel item -->
    <div class="carousel-item">
      <!-- An image in the item -->
      <img class="carousel-figure" src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="carousel item one">
      <!-- Some description texts in the item -->
      <div class="carousel-description">This is the first carousel item.</div>
    </div>
    <div class="carousel-item">
      <img class="carousel-figure" src="{{ '/assets/img/carousel2.jpg' | relative_url }}" alt="carousel item two">
      <div class="carousel-description">This is the second carousel item.</div>
    </div>
    <div class="carousel-item">
      <img class="carousel-figure" src="{{ '/assets/img/carousel3.jpg' | relative_url }}" alt="carousel item three">
      <div class="carousel-description">This is the third carousel item.</div>
    </div>
    <!-- The control buttons -->
    <button class="carousel-prev btn btn-text-light btn-ico"><i class="ico ico-left"></i></button>
    <button class="carousel-next btn btn-text-light btn-ico"><i class="ico ico-right"></i></button>
    <!-- The indicators -->
    <div class="carousel-indicators btns-x btns-margin">
      <button class="btn btn-small btn-light"></button>
      <button class="btn btn-small btn-light"></button>
      <button class="btn btn-small btn-light"></button>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ carousel }}
</div>
``` html{{ carousel }}```
<!-- markdownlint-enable -->

## Customize Transition Effects

If you don't like the default transition effects of
the carousel component, you can create your own.
Your custom transition classes should be defined using this format:
`.carousel-custom-{name} .carousel-item-{state}`.
There're three state classes which are automatically added to
or removed from the carousel items for controlling the transition:

`.carousel-item-active`:
Added to the item which is going to be active
and enter the visible area,
and removed from current active item
which is going to leave the visible area.

`.carousel-item-prev`:
Added to current active item
which is going to leave the visible area
when in the order of the items in HTML.

`.carousel-item-next`:
Added to current active item
which is going to leave the visible area
when in the reverse order of the items in HTML.

There is a built-in transition class: `.carousel-custom-opacity`,
you can preview the effects in the below example.

<!-- markdownlint-disable -->
{% capture carousel_opacity %}
<div class="carousel carousel-custom-opacity">
  <div class="carousel-box">
    <div class="carousel-item">
      <img class="carousel-figure" src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="carousel item one">
      <div class="carousel-description">This is the first carousel item.</div>
    </div>
    <div class="carousel-item">
      <img class="carousel-figure" src="{{ '/assets/img/carousel2.jpg' | relative_url }}" alt="carousel item two">
      <div class="carousel-description">This is the second carousel item.</div>
    </div>
    <div class="carousel-item">
      <img class="carousel-figure" src="{{ '/assets/img/carousel3.jpg' | relative_url }}" alt="carousel item three">
      <div class="carousel-description">This is the third carousel item.</div>
    </div>
    <button class="carousel-prev btn btn-text-light btn-ico"><i class="ico ico-left"></i></button>
    <button class="carousel-next btn btn-text-light btn-ico"><i class="ico ico-right"></i></button>
    <div class="carousel-indicators btns-x btns-margin">
      <button class="btn btn-small btn-light"></button>
      <button class="btn btn-small btn-light"></button>
      <button class="btn btn-small btn-light"></button>
    </div>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ carousel_opacity }}
</div>
``` html{{ carousel_opacity }}```
<!-- markdownlint-enable -->

## HTML Attributes

### data-carousel-interval

``` html
<div class="carousel" data-carousel-interval="10000">...</div>
```

Set the interval time to 10000 milliseconds.
The interval time is 5000 milliseconds by default.

``` html
<div class="carousel" data-carousel-interval="false">...</div>
```

Disable the auto-play function.

### data-carousel-wrap

``` html
<div class="carousel" data-carousel-wrap="false">...</div>
```

Disable the auto-loop function.

## Javascript Methods

### luda.carousel.activate(element, index)

``` javascript
luda.carousel.activate(document.querySelector('#my-carousel'), 1)
```

Activate a specfic item in the carousel by passing in the item's index number.

### luda.carousel.next(element)

``` javascript
luda.carousel.next(document.querySelector('#my-carousel'))
```

Activate the next item in the carousel.

### luda.carousel.prev(element)

``` javascript
luda.carousel.prev(document.querySelector('#my-carousel'))
```

Activate the prev item in the carousel.

### luda.carousel.pause(element)

``` javascript
luda.carousel.pause(document.querySelector('#my-carousel'))
```

Pause an auto-play carousel.

### luda.carousel.play(element)

``` javascript
luda.carousel.play(document.querySelector('#my-carousel'))
```

Restart a paused carousel.

## DOM Events

### luda:carousel:activate

``` javascript
luda.on('luda:carousel:activate', '#my-carousel', function(event){
  let $myCarousel = this, $item = event.tartet, index = event.detail
  event.preventDefault() // Prevent the carousel item from being activated if necessary.
})
```

Will be triggered before the `.carousel-item-active` class added to a carousel item.

### luda:carousel:activated

``` javascript
luda.on('luda:carousel:activated', '#my-carousel', function(event){
  let $myCarousel = this, $item = event.tartet, index = event.detail
})

```

Will be triggered after the `.carousel-item-active` class added
to a carousel item and CSS transition finished.

### luda:carousel:deactivate

``` javascript
luda.on('luda:carousel:deactivate', '#my-carousel', function(event){
  let $myCarousel = this, $item = event.tartet, index = event.detail
  event.preventDefault() // Prevent the carousel item from being deactivated if necessary.
})
```

Will be triggered before the `.carousel-item-active` class removed from
a carousel item.

### luda:carousel:deactivated

``` javascript
luda.on('luda:carousel:deactivated', '#my-carousel', function(event){
  let $myCarousel = this, $item = event.tartet, index = event.detail
})
```

Will be triggered after the `.carousel-item-active` class removed from
a carousel item and CSS transition finished.

## Sass Variables

### Size

``` sass
$carousel-width-breakpoint: m !default
```

Default breakpoint of carousels.
The control buttons are hidden on screens which are wider than
or equal to the width of this breakpoint.

``` sass
$carousel-aspect-ratio: 16 / 9 !default
```

Default aspect ratio of the `.carousel-box` container.

``` sass
$carousel-indicators-top-spacing-rem: $spacing-small-rem !default
```

``` sass
$carousel-indicators-right-spacing-rem: $spacing-small-rem !default
```

``` sass
$carousel-indicator-height-rem: 0.2rem !default
```

``` sass
$carousel-indicator-outline-offset-px: 2px !default
```

``` sass
$carousel-description-padding-rem: $spacing-small-rem !default
```

``` sass
$carousel-breakpoint-indicators-top-spacing-rem: $spacing-medium-rem !default
```

``` sass
$carousel-breakpoint-indicators-right-spacing-rem: $spacing-medium-rem !default
```

``` sass
$carousel-breakpoint-prev-button-left-spacing-rem: $spacing-small-rem !default
```

``` sass
$carousel-breakpoint-next-button-right-spacing-rem: $spacing-small-rem !default
```

``` sass
$carousel-breakpoint-description-padding-rem: $spacing-medium-rem !default
```

### Transition

``` sass
$carousel-transition-duration: $transition-duration-long !default
```

``` sass
$carousel-transition-timing-function: $transition-timing-function-main !default
```

``` sass
$carousel-custom-opacity-transition-duration: $transition-duration-long !default
```

<!-- markdownlint-disable -->
``` sass
$carousel-custom-opacity-transition-timing-function: $transition-timing-function-main !default
```
<!-- markdownlint-enable -->

### Others

``` sass
$carousel-background: $background-color-muted !default
```

<!-- markdownlint-disable -->
``` sass
$carousel-description-background: linear-gradient(180deg, transparent 0, rgba($background-color-dark, $opacity-most-muted) 2rem) !default
```
<!-- markdownlint-enable -->

``` sass
$carousel-description-color: $color-inverse-main !default
```

``` sass
$carousel-controls-opacity: $opacity-main !default
```

Default opacity of control buttons and indicators.

``` sass
$carousel-controls-disabled-opacity: $opacity-more-muted !default
```

``` sass
$carousel-controls-opacity-transition-duration: $transition-duration-normal !default
```

<!-- markdownlint-disable -->
``` sass
$carousel-controls-opacity-transition-timing-function: $transition-timing-function-main !default
```
<!-- markdownlint-enable -->