---
title: Navigation
description: Create responsive header navigations and aside navigations easily.
---

## Introduction

The navigation component includes three parts, a logo, a navigation menu
and an open button.
The navigation menu includes four parts, main navigation items,
sub navigation items, a search field and a close button.

The open button and the close button only shows on small screens
for toggling the navigation menu. Except these two buttons, all
the other parts in a navigation component can be optional.

A navigation component can be created with these classes:
`.nav-header`, `.nav-aside`, `.nav-logo`, `.nav-open`,
`.nav-menu`, `.nav-close`, `.nav-items` and `.nav-sub-items`.
Let's see the below examples for clarification.

## Header Navigation

To create a header navigation, add the class `.nav-header` to a container,
then wrap necessary elements like the below example.

<!-- markdownlint-disable -->
<header class="nav-header sti my-small zi-highest">
  <a class="nav-logo" data-turbolinks="false" href="#header-navigation">
    <img src="{{ '/assets/img/logo-text.svg' | relative_url }}" alt="logo">
  </a>
  <button class="nav-open btn btn-ico btn-text-light" data-toggle-for="header-menu">
    <i class="ico ico-menu"></i>
  </button>
  <div class="nav-menu" data-toggle-target="header-menu">
    <button class="nav-close btn btn-ico btn-text-light" data-toggle>
      <i class="ico ico-cross"></i>
    </button>
    <div class="nav-search fm fm-search fm-small">
      <input type="search" name="keywords" placeholder="Search anything...">
    </div>
    <nav class="nav-items" data-toggle>
      <a class="btn btn-text-light btn-active" data-turbolinks="false" href="#header-navigation">Home</a>
      <a class="btn btn-text-light" data-turbolinks="false" href="#header-navigation">Github</a>
    </nav>
    <nav class="nav-sub-items">
      <div class="dropdown-static dropdown-absolute-m dropdown-align-right">
        <button class="btn btn-ico-right btn-text-light">
          Admin<i class="ico ico-down"></i>
        </button>
        <div class="dropdown-menu mx-small-m">
          <div class="dropdown-items mt-small-m" data-toggle>
            <a class="btn btn-text-light" data-turbolinks="false" href="#header-navigation">Profile</a>
            <a class="btn btn-text-light" data-turbolinks="false" href="#header-navigation">Sign out</a>
          </div>
        </div>
      </div>
    </nav>
  </div>
</header>
<!-- markdownlint-enable -->

``` html
<header class="nav-header">
  <!-- The logo -->
  <a class="nav-logo" href="/">
    <img src="..." alt="logo">
  </a>
  <!-- The open button -->
  <button class="nav-open btn btn-ico btn-text-light" data-toggle-for="header_menu">
    <i class="ico ico-menu"></i>
  </button>
  <!-- The menu -->
  <div class="nav-menu" data-toggle-target="header_menu">
    <!-- The close button -->
    <button class="nav-close btn btn-ico btn-text-light" data-toggle>
      <i class="ico ico-cross"></i>
    </button>
    <!-- The search field -->
    <div class="nav-search fm fm-search fm-small">
      <input type="search" name="keywords" placeholder="Search anything...">
    </div>
    <!-- The main menu items -->
    <nav class="nav-items" data-toggle>
      <a class="btn btn-text-light btn-active" href="#">Home</a>
      <a class="btn btn-text-light" href="#">Github</a>
    </nav>
    <!-- The sub menu items -->
    <nav class="nav-sub-items">
      <div class="dropdown-static dropdown-absolute-m dropdown-align-right">
        <button class="btn btn-ico-right btn-text-light">
          Admin<i class="ico ico-down"></i>
        </button>
        <div class="dropdown-menu mx-small-m">
          <div class="dropdown-items mt-small-m" data-toggle>
            <a class="btn btn-text-light" href="#">Profile</a>
            <a class="btn btn-text-light" href="#">Sign out</a>
          </div>
        </div>
      </div>
    </nav>
  </div>
</header>
```

## Aside Navigation

To create an aside navigation, add the `.nav-aside` class to a container,
then wrap necessary elements like the below example.

<!-- markdownlint-disable -->
{% capture nav_aside_code %}
{% highlight html %}
<aside class="nav-aside">
  <!-- The logo -->
  <a class="nav-logo" href="/">
    <img src="..." alt="logo">
  </a>
  <!-- The open button -->
  <button class="nav-open btn btn-ico btn-text-light" data-toggle-for="aside-menu">
    <i class="ico ico-menu"></i>
  </button>
  <!-- The menu -->
  <div class="nav-menu" data-toggle-target="aside-menu">
    <!-- The close button -->
    <button class="nav-close btn btn-ico btn-text-light" data-toggle>
      <i class="ico ico-cross"></i>
    </button>
    <!-- The search filed -->
    <div class="nav-search fm fm-search fm-small">
      <input type="search" name="keywords" placeholder="Search anything...">
    </div>
    <!-- The main menu items -->
    <nav class="nav-items" data-toggle>
      <a class="btn btn-text-light btn-active" href="#">Home</a>
      <a class="btn btn-text-light" href="#">Documentation</a>
      <a class="btn btn-text-light" href="#">Themes</a>
      <a class="btn btn-text-light" href="#">Changelog</a>
      <a class="btn btn-text-light" href="#">Github</a>
    </nav>
    <!-- The sub menu items -->
    <nav class="nav-sub-items">
      <div class="dropdown-static">
        <button class="btn btn-ico-right btn-text-light" data-none-toggle>
          Admin<i class="ico ico-down"></i>
        </button>
        <div class="dropdown-menu">
          <div class="dropdown-items" data-toggle>
            <a class="btn btn-text-light" href="#">Profile</a>
            <a class="btn btn-text-light" href="#">Sign out</a>
          </div>
        </div>
      </div>
    </nav>
  </div>
</aside>
{% endhighlight %}
{% endcapture %}
<!-- markdownlint-enable -->

<!-- markdownlint-disable -->
<div class="d-block d-flex-m my-small">
  <aside class="nav-aside">
    <a class="nav-logo" data-turbolinks="false" href="#aside-navigation">
      <img src="{{ '/assets/img/logo-text.svg' | relative_url }}" alt="logo">
    </a>
    <button class="nav-open btn btn-ico btn-text-light" data-toggle-for="aside-menu">
      <i class="ico ico-menu"></i>
    </button>
    <div class="nav-menu" data-toggle-target="aside-menu">
      <button class="nav-close btn btn-ico btn-text-light" data-toggle>
        <i class="ico ico-cross"></i>
      </button>
      <div class="nav-search fm fm-search fm-small">
        <input type="search" name="keywords" placeholder="Search anything...">
      </div>
      <nav class="nav-items" data-toggle>
        <a class="btn btn-text-light btn-active" data-turbolinks="false" href="#aside-navigation">Home</a>
        <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Documentation</a>
        <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Themes</a>
        <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Changelog</a>
        <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Github</a>
      </nav>
      <nav class="nav-sub-items">
        <div class="dropdown-static">
          <button class="btn btn-ico-right btn-text-light" data-none-toggle>
            Admin<i class="ico ico-down"></i>
          </button>
          <div class="dropdown-menu">
            <div class="dropdown-items" data-toggle>
              <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Profile</a>
              <a class="btn btn-text-light" data-turbolinks="false" href="#aside-navigation">Sign out</a>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </aside>
  <div class="mt-small mt-none-m" style="min-width:0">{{ nav_aside_code }}</div>
</div>
<!-- markdownlint-enable -->

## Sass Variables

### Size

``` sass
$navigation-width-breakpoint: m !default
```

Default breakpoint for header navigations and aside navigations.
The layouts of navigations change on this breakpoint.

``` sass
$navigation-padding-rem: $spacing-tiny-rem $spacing-small-rem !default
```

``` sass
$navigation-logo-margin-rem: 0 $spacing-small-rem !default
```

``` sass
$navigation-logo-image-height-rem: baseline(2) !default
```

``` sass
$navigation-open-button-margin-rem: 0 0 0 auto !default
```

<!-- markdownlint-disable -->
``` sass
$navigation-close-button-margin-rem: $spacing-small-rem $spacing-small-rem 0 auto !default
```
<!-- markdownlint-enable -->

``` sass
$navigation-search-field-margin-rem: $spacing-medium-rem !default
```

``` sass
$navigation-items-margin-rem: $spacing-small-rem !default
```

``` sass
$navigation-sub-items-margin-rem: $navigation-items-margin-rem !default
```

#### Header Navigation Sizes

``` sass
$navigation-header-breakpoint-padding-rem: $spacing-small-rem !default
```

``` sass
$navigation-header-breakpoint-search-field-margin-rem: 0 $spacing-small-rem !default
```

``` sass
$navigation-header-breakpoint-items-margin-rem: 0 auto 0 0 !default
```

``` sass
$navigation-header-breakpoint-sub-items-margin-rem: 0 !default
```

``` sass
$navigation-header-breakpoint-search-field-width-rem: baseline(16) !default
```

#### Aside Navigation Sizes

``` sass
$navigation-aside-breakpoint-padding-rem: 0 !default
```

<!-- markdownlint-disable -->
``` sass
$navigation-aside-breakpoint-logo-margin-rem: 3 * $spacing-small-rem $spacing-medium-rem $spacing-small-rem !default
```
<!-- markdownlint-enable -->

``` sass
$navigation-aside-breakpoint-logo-image-height-rem: baseline(8) !default
```

``` sass
$navigation-aside-breakpoint-logo-image-width-rem: baseline(10) !default
```

``` sass
$navigation-aside-breakpoint-min-width-rem: baseline(20) !default
```

``` sass
$navigation-aside-breakpoint-max-width-rem: baseline(22) !default
```

### Others

``` sass
$navigation-background: $background-color-dark !default
```

``` sass
$navigation-header-breakpoint-dropdown-background: $navigation-background !default
```

``` sass
$navigation-header-box-shadow: null !default
```

``` sass
$navigation-aside-box-shadow: $navigation-header-box-shadow !default
```

``` sass
$navigation-aside-breakpoint-box-shadow: none !default
```