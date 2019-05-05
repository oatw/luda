---
title: Avatar
description: Show an user photo together with necessary user information.
---

## Vertical Avatar

A vertical avatar contains a user photo in the top
and some texts like user name in the bottom.
To create a vertical avatar, add the `.avatar-y` class to a container,
then wrap an user photo with the `.media` class, wrap user information
with the `.avatar-info` class.

Let's see the below example for clarification.

{% capture avatar_y %}
<div class="avatar-y">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ avatar_y }}
</div>
``` html{{ avatar_y }}```

## Horizontal Avatar

If a horizontal avatar is prefered, replace the `.avatar-y` class
with the `.avatar-x` class.

{% capture avatar_x %}
<div class="avatar-x">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ avatar_x }}
</div>
``` html{{ avatar_x }}```

## Style Mofifiers

### Small{% include modifier.md %}

The `.avatar-small` class is used to make an avatar smaller.

{% capture avatar_small %}
<div class="avatar-y avatar-small">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
<div class="avatar-x avatar-small">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ avatar_small }}
</div>
``` html{{ avatar_small }}```

### Large{% include modifier.md %}

Oppsitely, the `.avatar-lager` class is used to make an avatar larger.

{% capture avatar_large %}
<div class="avatar-y avatar-large">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
<div class="avatar-x avatar-large">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ avatar_large }}
</div>
``` html{{ avatar_large }}```

## Sass Variables

### Size

``` sass
  $avatar-image-size-rem: 3rem !default
```

``` sass
  $avatar-large-image-size-rem: 6rem !default
```

``` sass
  $avatar-small-image-size-rem: 2rem !default
```

``` sass
  $avatar-info-height-rem: 3rem !default
```

``` sass
  $avatar-info-padding-top-rem: 0.3rem !default
```

``` sass
  $avatar-info-padding-left-rem: 0.5rem !default
```

``` sass
  $avatar-large-info-height-rem: 4rem !default
```

``` sass
  $avatar-large-info-padding-top-rem: 0.6rem !default
```

``` sass
  $avatar-large-info-padding-left-rem: 1rem !default
```

``` sass
  $avatar-small-info-height-rem: null !default
```

``` sass
  $avatar-small-info-padding-top-rem: null !default
```

``` sass
  $avatar-small-info-padding-left-rem: null !default
```

### Typography

``` sass
  $avatar-name-typography-size-level: 5 !default
```

The value must be an integer between 1 and 6.

``` sass
  $avatar-large-name-typography-size-level: 4 !default
```

The value must be an integer between 1 and 6.

``` sass
  $avatar-small-name-typography-size-level: 6 !default
```

The value must be an integer between 1 and 6.

``` sass
  $avatar-description-typography-size-level: 6 !default
```

The value must be an integer between 1 and 6.

``` sass
  $avatar-large-description-typography-size-level: 5 !default
```

The value must be an integer between 1 and 6.

``` sass
  $avatar-small-description-typography-size-level: null !default
```

The value must be an integer between 1 and 6.

### Others

``` sass
  $avatar-image-border-radius: 100% !default
```

``` sass
  $avatar-default-image-background-size: 50% auto !default
```

<!-- markdownlint-disable -->
``` sass
  $avatar-default-image: svg-icon('<svg viewBox="..."><path fill="#fill" d="..."/></svg>', $line-color-muted) !default
```

The `#fill` texts will be replaced automatically by color values,
you don't need set it.
<!-- markdownlint-enable -->

``` sass
  $avatar-background-color: $background-color-muted !default
```

``` sass
  $avatar-name-color: $color-muted !default
```

``` sass
  $avatar-description-color: $avatar-name-color !default
```