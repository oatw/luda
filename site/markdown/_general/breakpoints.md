---
title: Breakpoints
order: 4
description: Luda provides width breakpoints, aspect ratio breakpoints
             and resolution breakpoints by default, lean how to configure
             and use them in your projects. 
---

## Width Breakpoints

Luda provides 3 screen width breakpoints by default:
small, medium and large. The first letters of these breakpoints are
used as classname postfixes to make components responsive.
Luda is a mobile first framework, the postfixes are only necessary for
middle size screens and large screens.

The width breakpoints and classname postfixes are listed in the below table.

<div class="table table-nowrap table-border">
  <table>
    <thead>
      <tr>
        <th>Breakpoint</th>
        <th>Screen Width</th>
        <th>Postfix</th>
        <th>Classname Example</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>small</td>
        <td>≥ 0px</td>
        <td>s</td>
        <td></td>
      </tr>
      <tr>
        <td>medium</td>
        <td>≥ 768px</td>
        <td>m</td>
        <td><code class="bc-none">.m-small-m</code></td>
      </tr>
      <tr>
        <td>large</td>
        <td>≥ 1200px</td>
        <td>l</td>
        <td><code class="bc-none">.d-block-l</code></td>
      </tr>
    </tbody>
  </table>
</div>

### Configure Width Breakpoints in Sass

{% include doc-sass-variable-breakpoints-width.md %}

### Detect Screen Width in Sass

``` sass
+media-width($breakpoint-postfix, $less-than-next: false)
```

Use this mixin to detect screen width and include styles.
If the value of the `$less-than-next` parameter is `true`,
a `max-width` media query rule will be added, and the max width
will be the result of next breakpoint's value minus `1px`.

## Aspect Ratio Breakpoints

Luda provides 2 aspect ratio breakpoints by default,
portrait and landscape. Components' classnames are
not extended with these breakpoints.
We use the abbreviations of these breakpoints as sass mixin parameters
for responsive control.

The aspect ratio breakpoints and their abbreviations are listed in the below table.

<div class="table table-nowrap table-border">
  <table>
    <thead>
      <tr>
        <th>Breakpoint</th>
        <th>Aspect Ratio</th>
        <th>Abbreviation</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>portrait</td>
        <td>≥ 0</td>
        <td>p</td>
      </tr>
      <tr>
        <td>landscape</td>
        <td>≥ 1.0001</td>
        <td>l</td>
      </tr>
    </tbody>
  </table>
</div>

### Configure Aspect Ratio Breakpoints in Sass

{% include doc-sass-variable-breakpoints-aspect-ratio.md %}

### Detect Aspect Ratio in Sass

``` sass
+media-aspect-ratio($breakpoint-abbreviation, $less-than-next: false)
```

Use this mixin to detect screen aspect ratio and include styles.
If the value of the `$less-than-next` parameter is `true`,
a `max-aspect-ratio` media query rule will be added,
and the max aspect ratio will be the result of
next breakpoint's value minus `0.0001`.

## Resolution Breakpoints

Luda provides 3 resolution breakpoints by default,
low, high and extra high. Components' classnames
are not extended with these breakpoints.
We use the abbreviations of these breakpoints as sass mixin parameters
for responsive control.

The resolution breakpoints and their abbreviations are listed in the below table.

<div class="table table-nowrap table-border">
  <table>
    <thead>
      <tr>
        <th>Breakpoint</th>
        <th>Resolution</th>
        <th>Abbreviation</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>low</td>
        <td>≥ 0</td>
        <td>l</td>
      </tr>
      <tr>
        <td>high</td>
        <td>≥ 105.6dpi</td>
        <td>h</td>
      </tr>
      <tr>
        <td>extra high</td>
        <td>≥ 201.6dpi</td>
        <td>xh</td>
      </tr>
    </tbody>
  </table>
</div>

### Configure Resolution Breakpoints in Sass

{% include doc-sass-variable-breakpoints-resolution.md %}

### Detect Resolution in Sass

``` sass
+media-resolution($breakpoint-abbreviation, $less-than-next: false)
```

Use this mixin to detect screen resolution and include styles.
If the value of the `$less-than-next` parameter is `true`,
a `max-resolution` media query rule will be added,
and the max resolution will be the result of
next breakpoint's value minus `9.6dpi`.