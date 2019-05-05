---
title: Background
description: Use background utilities to change the background color,
             background size and background pisition of an element.
---

## Background Color

Background color utilities are classes for setting the value of the
[`background-color`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-color)
property. You can preview the colors in the below gallery.
When you pick up a background color class, consider the meaning in your context
but not only the appearance, since in different themes background colors may be
changed but the meanings are the same.

<div class="background-example mb-none">
  <div>
    <div class="bc-primary"></div>
    <p class="p6">.bc-primary</p>
  </div>
  <div>
    <div class="bc-secondary"></div>
    <p class="p6">.bc-secondary</p>
  </div>
  <div>
    <div class="bc-danger"></div>
    <p class="p6">.bc-danger</p>
  </div>
  <div>
    <div class="bc-dark"></div>
    <p class="p6">.bc-dark</p>
  </div>
  <div>
    <div class="bc-light"></div>
    <p class="p6">.bc-light</p>
  </div>
  <div>
    <div class="bc-emphasis"></div>
    <p class="p6">.bc-emphasis</p>
  </div>
  <div>
    <div class="bc-main"></div>
    <p class="p6">.bc-main</p>
  </div>
  <div>
    <div class="bc-muted"></div>
    <p class="p6">.bc-muted</p>
  </div>
  <div>
    <div class="bc-inverse-emphasis"></div>
    <p class="p6">.bc-inverse-emphasis</p>
  </div>
  <div>
    <div class="bc-inverse-main"></div>
    <p class="p6">.bc-inverse-main</p>
  </div>
  <div>
    <div class="bc-inverse-muted"></div>
    <p class="p6">.bc-inverse-muted</p>
  </div>
</div>

``` html
  <div class="bc-primary"></div>
  <div class="bc-secondary"></div>
  <div class="bc-danger"></div>
  <div class="bc-dark"></div>
  <div class="bc-light"></div>
  <div class="bc-emphasis"></div>
  <div class="bc-main"></div>
  <div class="bc-muted"></div>
  <div class="bc-inverse-emphasis"></div>
  <div class="bc-inverse-main"></div>
  <div class="bc-inverse-muted"></div>
```

The `.bc-none` class is a special background color utility,
it sets the value of the background color property to transparent.
{: .mt-small}

If you want to remove an element's background images,
you can use the `.bi-none` class.

## Background Size

Background size utilities are classes for setting the value of the
`background-size` property.
If you're not familiar with the `background-size` property,
please read
[this tutorial](https://developer.mozilla.org/en-US/docs/Web/CSS/background-size)
at first.

You can preview how background size utilities
affect the size of an element's background in the below gallery.

<!-- markdownlint-disable -->
<div class="background-example mb-none">
  <div>
    <div class="bs-cover" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat"></div>
    <p class="p6">.bs-cover</p>
  </div>
  <div>
    <div class="bs-contain" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat"></div>
    <p class="p6">.bs-contain</p>
  </div>
  <div>
    <div class="bs-auto" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat"></div>
    <p class="p6">.bs-auto</p>
  </div>
  <div>
    <div class="bs-100-auto" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat"></div>
    <p class="p6">.bs-100-auto</p>
  </div>
  <div>
    <div class="bs-auto-100" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat"></div>
    <p class="p6">.bs-auto-100</p>
  </div>
</div>
<!-- markdownlint-enable -->

``` html
<div class="bs-cover"></div>
<div class="bs-contain"></div>
<div class="bs-auto"></div>
<div class="bs-100-auto"></div>
<div class="bs-auto-100"></div>
```

## Background Position

Background position utilities are classes for setting the value of the
[`background-position`](https://developer.mozilla.org/en-US/docs/Web/CSS/background-position)
property. They are named using the format: `.bp-{horizontal position}{vertical position}`.

We use the first letter of each position word for short,
all position abbreviations are listed in the below table.

<!-- markdownlint-disable -->
<div class="table table-border my-small">
  <table>
    <thead>
      <tr><th>Abbreviation</th><th>Position</th></tr>
    </thead>
    <tbody>
      <tr><td>c</td><td>center</td></tr>
      <tr><td>t</td><td>top</td></tr>
      <tr><td>r</td><td>right</td></tr>
      <tr><td>b</td><td>bottom</td></tr>
      <tr><td>l</td><td>left</td></tr>
    </tbody>
  </table>
</div>
<!-- markdownlint-enable -->

You can preview how they affect the position of an element's background images
in the below gallery.

<!-- markdownlint-disable -->
<div class="background-example mb-none">
  <div>
    <div class="bp-c" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-c</p>
  </div>
  <div>
    <div class="bp-rc" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-rc</p>
  </div>
  <div>
    <div class="bp-lc" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-lc</p>
  </div>
  <div>
    <div class="bp-ct" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-ct</p>
  </div>
  <div>
    <div class="bp-cb" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-cb</p>
  </div>
  <div>
    <div class="bp-lt" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-lt</p>
  </div>
  <div>
    <div class="bp-lb" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-lb</p>
  </div>
  <div>
    <div class="bp-rt" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-rt</p>
  </div>
  <div>
    <div class="bp-rb" style="background: url({{ '/assets/img/carousel1.jpg' | relative_url }}) no-repeat;background-size: 4rem"></div>
    <p class="p6">.bp-rb</p>
  </div>
</div>
<!-- markdownlint-enable -->

``` html
<div class="bp-c">.bp-c</div>
<div class="bp-rc">.bp-rc</div>
<div class="bp-lc">.bp-lc</div>
<div class="bp-ct">.bp-ct</div>
<div class="bp-cb">.bp-cb</div>
<div class="bp-lt">.bp-lt</div>
<div class="bp-lb">.bp-lb</div>
<div class="bp-rt">.bp-rt</div>
<div class="bp-rb">.bp-rb</div>
```

## Sass Variables

{% include doc-sass-variable-background.md %}