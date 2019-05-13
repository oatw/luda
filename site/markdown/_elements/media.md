---
title: Media
description: Lean how to control the appearances of images and videos with the media classes.
---

## Why the Media Classes

Wrap a media element like an `<img/>` or a `<video>`
with the `.media` container to prevent it from
breaking out of the container.
A light background color will show
when the inside media element is being loaded,
so users can know there is something not ready.
The aspect radio of the inside media element depends on
its original size and its `width` and `height` attributes,
but we can change it with the `.media-content` class.
Let's see the below examples for detail.

## Image

In the below example, the image is wrapped in a `.media` container.
It won't break out of the container, even though its original size is
larger than the container's size.

<!-- markdownlint-disable -->
{% capture image %}
<figure class="media">
  <img src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="a demo image">
</figure>
{% endcapture %}
<div class="example">
  {{ image }}
</div>
``` html{{ image }}```
<!-- markdownlint-enable -->

## Video

A `<video>` element can also be wrapped in the `.media` container.

<!-- markdownlint-disable -->
{% capture video %}
<div class="media">
  <video autoplay loop muted playsinline controls>
    <source type="video/mp4" src="{{ '/assets/video/home-background.mp4' | relative_url }}">
  </video>
</div>
{% endcapture %}
<div class="example">
  {{ video }}
</div>
``` html{{ video }}```
<!-- markdownlint-enable -->

## Responsive Control

A `.media-content` container can be wrapped in the `.media` container
to make the inside media element responsive, the aspect ratio of
the `.media-content` container is 16:9 by default.
Size utility classes can be used to change the `.media`'s
width responsively.

### Responsive images

Here is a responsive image occupies 100% of the horizontal space
on small screens and 66% of the horizontal space on
middle size screens and large screens.

<!-- markdownlint-disable -->
{% capture responsive_image %}
<figure class="media w-100 w-66-m">
  <picture class="media-content">
    <source srcset="{{ '/assets/img/carousel3.jpg' | relative_url }}" media="(min-width: 600px)">
    <img src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="a demo image">
  </picture>
</figure>
{% endcapture %}
<div class="example">
  {{ responsive_image }}
</div>
``` html{{ responsive_image }}```
<!-- markdownlint-enable -->

### Responsive Videos

Like responsive images, videos can also be responsive by
combining the `.media-content` class and size utility classes.

<!-- markdownlint-disable -->
{% capture responsive_video %}
<div class="media w-100 w-66-m">
  <div class="media-content">
    <video autoplay loop muted playsinline controls>
      <source type="video/mp4" src="{{ '/assets/video/home-background.mp4' | relative_url }}">
    </video>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ responsive_video }}
</div>
``` html{{ responsive_video }}```
<!-- markdownlint-enable -->

### Responsive Iframes

The same to images and videos, we can make an `<iframe>` responsive.
This is useful when include videos from external sites such as youtube.

<!-- markdownlint-disable -->
{% capture responsive_iframe %}
<div class="media w-100 w-66-m">
  <div class="media-content">
    <iframe allowfullscreen allow="autoplay; encrypted-media" src="https://www.youtube.com/embed/izGwDsrQ1eQ"></iframe>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ responsive_iframe }}
</div>
``` html{{ responsive_iframe }}```
<!-- markdownlint-enable -->

### Aspect Radio 1by1

You can change a responsive media elements' aspect ratio to `1:1`
by replacing the `.media-content` class with
the `.media-content-1by1` class.
The value of a `.media-content-1by1` container's `padding-top` property
is set at 100%, you can create more aspect ratio classes by changing
the value of the `padding-top` property.

<!-- markdownlint-disable -->
{% capture one_by_one_image %}
<figure class="media w-100 w-66-m">
  <picture class="media-content-1by1">
    <source srcset="{{ '/assets/img/carousel1.jpg' | relative_url }}" media="(min-width: 600px)">
    <img src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="a demo image">
  </picture>
</figure>
{% endcapture %}
<div class="example">
  {{ one_by_one_image }}
</div>
``` html{{ one_by_one_image }}```
<!-- markdownlint-enable -->

<!-- markdownlint-disable -->
{% capture one_by_one_video %}
<div class="media w-100 w-66-m">
  <div class="media-content-1by1">
    <video autoplay loop muted playsinline controls>
      <source type="video/mp4" src="{{ '/assets/video/home-background.mp4' | relative_url }}">
    </video>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ one_by_one_video }}
</div>
``` html{{ one_by_one_video }}```
<!-- markdownlint-enable -->

## Style Modifiers

### .media-contain{% include modifier.md %}

The wrapped media element occupies the whole space of its container by default,
if the aspect radio of the element is different from its container,
some content areas will be invisible. You can change this by
adding the `.media-contain` class to the `.media` container,
so the whole content area can be visible.

In the below example, we set the width and height against to
the image's original aspect ratio, and use the `.media-contain` class
to show the whole image content area forcely.

<!-- markdownlint-disable -->
{% capture contain_image %}
<figure class="media media-contain">
  <img width="300" height="300" src="{{ '/assets/img/carousel1.jpg' | relative_url }}" alt="a demo image">
</figure>
{% endcapture %}
<div class="example">
  {{ contain_image }}
</div>
``` html{{ contain_image }}```
<!-- markdownlint-enable -->

In the below example, we use the `.media-content-1by1` class to set
the container's aspect radio against to the `<video>`'s original aspect ratio,
and use the `.media-contain` class to show the whole video area.
{: .mt-small}

<!-- markdownlint-disable -->
{% capture contain_video %}
<div class="media media-contain w-100 w-50-m">
  <div class="media-content-1by1">
    <video autoplay loop muted playsinline controls>
      <source type="video/mp4" src="{{ '/assets/video/home-background.mp4' | relative_url }}">
    </video>
  </div>
</div>
{% endcapture %}
<div class="example">
  {{ contain_video }}
</div>
``` html{{ contain_video }}```
<!-- markdownlint-enable -->

## Sass Variables

``` sass
$media-background-color: $background-color-muted !default
```

``` sass
$media-border-radius: $border-radius-main !default
```

``` sass
$media-content-aspect-ratio: 16 / 9 !default
```