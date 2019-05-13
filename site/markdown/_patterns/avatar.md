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
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
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
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
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

### .avatar-small{% include modifier.md %}

The `.avatar-small` class is used to make an avatar smaller.

{% capture avatar_small %}
<div class="avatar-y avatar-small">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
<div class="avatar-x avatar-small">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
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

### .avatar-large{% include modifier.md %}

Oppsitely, the `.avatar-lager` class is used to make an avatar larger.

{% capture avatar_large %}
<div class="avatar-y avatar-large">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
  </figure>
  <div class="avatar-info">
    <p class="avatar-name">Olivia Johnson</p>
    <p class="avatar-description">2018/01/02 12:00</p>
  </div>
</div>
<div class="avatar-x avatar-large">
  <figure class="media">
    <img src="{{ '/assets/img/avatar.jpg' | relative_url }}" alt="avatar">
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
  $avatar-image-size-rem: baseline(4) !default
```

``` sass
  $avatar-large-image-size-rem: baseline(5) !default
```

``` sass
  $avatar-small-image-size-rem: baseline(3) !default
```

``` sass
  $avatar-info-height-rem: baseline(3) !default
```

``` sass
  $avatar-info-padding-top-rem: $spacing-tiny-rem !default
```

``` sass
  $avatar-info-padding-left-rem: $spacing-small-rem !default
```

``` sass
  $avatar-large-info-height-rem: null !default
```

``` sass
  $avatar-large-info-padding-top-rem: null !default
```

``` sass
  $avatar-large-info-padding-left-rem: null !default
```

``` sass
  $avatar-small-info-height-rem: baseline(3) !default
```

``` sass
  $avatar-small-info-padding-top-rem: null !default
```

``` sass
  $avatar-small-info-padding-left-rem: null !default
```

### Typography

``` sass
  $avatar-name-typography-size-level: 6 !default
```

The value must be an integer between 5 and 8.

``` sass
  $avatar-large-name-typography-size-level: 5 !default
```

The value must be an integer between 5 and 8.

``` sass
  $avatar-small-name-typography-size-level: 7 !default
```

The value must be an integer between 5 and 8.

``` sass
  $avatar-description-typography-size-level: 7 !default
```

The value must be an integer between 5 and 8.

``` sass
  $avatar-large-description-typography-size-level: 6 !default
```

The value must be an integer between 5 and 8.

``` sass
  $avatar-small-description-typography-size-level: 8 !default
```

The value must be an integer between 5 and 8.

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