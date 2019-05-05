---
title: Grid
description: With Luda grid system, you can create mobile-first responsive layout quickly and easily.
---

{% include variables.md %}

## Column Widths

Luda provides a 12 columns grid by default,
column widths can be spefic or auto-adjusted.
Each column has `1rem` padding in the left and right,
and they must be wrapped in a container with the `.grid` class.
You can preview grid layouts in the below examples.

### Specific Column Widths

The class `.col-*` means this column occupies `*/12` of the grid's horizontal space.
The classes from `.col-1` to `.col-12` can be used
to create columns with specific widths.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-9"><p class="p6 bc-primary c-light ta-center">9/12</p></div>
  <div class="col-3"><p class="p6 bc-primary c-light ta-center">3/12</p></div>
  <div class="col-8"><p class="p6 bc-primary c-light ta-center">8/12</p></div>
  <div class="col-4"><p class="p6 bc-primary c-light ta-center">4/12</p></div>
  <div class="col-7"><p class="p6 bc-primary c-light ta-center">7/12</p></div>
  <div class="col-5"><p class="p6 bc-primary c-light ta-center">5/12</p></div>
</div>

``` html
<div class="grid">
  <div class="col-9"></div>
  <div class="col-3"></div>
  <div class="col-8"></div>
  <div class="col-4"></div>
  <div class="col-7"></div>
  <div class="col-5"></div>
</div>
```
<!-- markdownlint-enable -->

### Responsive Column Widths

All the specific column width classes are extended with
the [screen width breakpoint postfixes]({{ width_breakpoints }}).
For example, the `.col-1-m` class means the width of the column
will be `1/12` of its `.grid` container's width when
the screen width is larger than or equal to the `m` breakpoint.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-12 col-10-m col-8-l">
    <p class="p6 bc-primary c-light ta-center">.col-12.col-10-m.col-8-l</p>
  </div>
</div>
``` html
<div class="grid">
  <!-- 12/12 on small screens, 10/12 on middle size screens and 8/12 on large screens -->
  <div class="col-12 col-10-m col-8-l"></div>
</div>
```
<!-- markdownlint-enable -->

### Auto-Adjusted Column Width

The class `.col-auto` is used to make a column's width auto adjusted.
The width of an auto-adjusted column depends on the availiable
horizontal space of its `.grid` container,
all the availiable space will be occupied.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-4"><p class="p6 bc-primary c-light ta-center">.col-4</p></div>
  <div class="col-auto"><p class="p6 bc-primary c-light ta-center">.col-auto</p></div>
</div>
``` html
<div class="grid">
  <div class="col-4"></div>
  <!-- Occupies 8/12 of the horizontal space -->
  <div class="col-auto"></div>
</div>
```
<!-- markdownlint-enable -->

## Column Offsets

Like column widths, column offsets can also be specific or auto-adjusted.
Let's have a look at how to control column offsets
with offset utilities and margin utilities.

### Specific Column Offsets

The specific offset distances are from 1 column with to 11 columns width.
You can add the offset utiltiy classes from `.offset-1` to `.offset-11`
to control a column's offset distance.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-11 offset-1"><p class="p6 bc-primary c-light ta-center">.offset-1</p></div>
  <div class="col-10 offset-2"><p class="p6 bc-primary c-light ta-center">.offset-2</p></div>
  <div class="col-9 offset-3"><p class="p6 bc-primary c-light ta-center">.offset-3</p></div>
  <div class="col-8 offset-4"><p class="p6 bc-primary c-light ta-center">.offset-4</p></div>
</div>
``` html
<div class="grid">
  <div class="col-11 offset-1"></div>
  <div class="col-10 offset-2"></div>
  <div class="col-9 offset-3"></div>
  <div class="col-8 offset-4"></div>
</div>
```
<!-- markdownlint-enable -->

### Auto-Adjusted Column Offsets

The margin utility classes `.mx-auto`, `.mr-auto` and `.ml-auto`
can also be used to control column offsets. The `.mx-auto` class makes
a column aligned in the horizontal center of its `.grid` container,
and the `.mr-auto` class and the `.ml-auto` class makes a column algined
in the left or right of its `.grid` container.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-10 mx-auto">
    <p class="p6 bc-primary c-light ta-center">.mx-auto</p>
  </div>
  <div class="col-10 mr-auto">
    <p class="p6 bc-primary c-light ta-center">.mr-auto</p>
  </div>
  <div class="col-10 ml-auto">
    <p class="p6 bc-primary c-light ta-center">.ml-auto</p>
  </div>
</div>
``` html
<div class="grid">
  <div class="col-10 mx-auto"></div>
  <div class="col-10 mr-auto"></div>
  <div class="col-10 ml-auto"></div>
</div>
```
<!-- markdownlint-enable -->

### Responsive Offsets

Like responsive column widths,
the offset utilities and the margin utilities are both responsive.
Let's see the below examples.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-9 offset-3 offset-2-m offset-1-l">
    <p class="p6 bc-primary c-light ta-center">.offset-3.offset-2-m.offset-1-l</p>
  </div>
  <div class="col-9 ml-auto ml-none-m ml-auto-l">
    <p class="p6 bc-primary c-light ta-center">.ml-auto.ml-none-m.ml-auto-l</p>
  </div>
</div>
<!-- markdownlint-enable -->

## Column Alignment

### Horizontal Alignment

The horizontal alignment of columns can be controlled by
using the flex utility classes: `.jc-start`, `.jc-center`,
`.jc-end`, `.jc-around` and `.jc-between`.

#### Align in Horizontal Center

Add the `.jc-center` class to the `.grid` to align columns in the horizontal center.

<!-- markdownlint-disable -->
<div class="grid grid-example jc-center">
  <div class="col-10">
    <p class="p6 bc-primary c-light ta-center">Center</p>
  </div>
</div>
``` html
<div class="grid jc-center"></div>
```
<!-- markdownlint-enable -->

#### Align to Horizontal End

Add the `.jc-end` class to the `.grid` to align columns in the right of horizontal.

<!-- markdownlint-disable -->
<div class="grid grid-example jc-end">
  <div class="col-10">
    <p class="p6 bc-primary c-light ta-center">End</p>
  </div>
</div>
``` html
<div class="grid jc-end"></div>
```
<!-- markdownlint-enable -->

#### Align With Horizontal Space Around Columns

Add the `.jc-around` class to the `.grid` to align columns
with extra horizontal space around.

<!-- markdownlint-disable -->
<div class="grid grid-example jc-around">
  <div class="col-5">
    <p class="p6 bc-primary c-light ta-center">Around</p>
  </div>
  <div class="col-5">
    <p class="p6 bc-primary c-light ta-center">Around</p>
  </div>
</div>
``` html
<div class="grid jc-around"></div>
```
<!-- markdownlint-enable -->

#### Align With Horizontal Space Between Columns

Add the `.jc-between` class to the `.grid` to align columns
with extra horizontal space between each other and the `.grid`'s edges.

<!-- markdownlint-disable -->
<div class="grid grid-example jc-between">
  <div class="col-5">
    <p class="p6 bc-primary c-light ta-center">Between</p>
  </div>
  <div class="col-5">
    <p class="p6 bc-primary c-light ta-center">Between</p>
  </div>
</div>
``` html
<div class="grid jc-between"></div>
```
<!-- markdownlint-enable -->

### Vertical Alignment

The vertical alignment of columns can be controlled by using the flex utility
classes: `.ai-start`, `.ai-center` and `.ai-end`.
You can also control the vertical alignment of a specific column
with the classes: `.as-start`, `.as-center` and `.as-end`.

#### Align in Vertical Center

Add the `.ai-center` class to the `.grid` to align columns in the vertical center.

<!-- markdownlint-disable -->
<div class="grid grid-example ai-center" style="height: 8rem">
  <div class="col-12">
    <p class="p6 bc-primary c-light ta-center">Center</p>
  </div>
</div>
``` html
<div class="grid ai-center"></div>
```
<!-- markdownlint-enable -->

If you just want specific columns to be aligned in the vertical center,
you can add the `.as-center` class to these columns.
{: .mt-small}

<!-- markdownlint-disable -->
<div class="grid grid-example" style="height: 8rem">
  <div class="col-auto">
    <p class="p6 bc-primary c-light ta-center">Start</p>
  </div>
  <div class="col-auto as-center">
    <p class="p6 bc-primary c-light ta-center">Center</p>
  </div>
</div>
``` html
<div class="grid">
  <div class="col-auto as-center"></div>
</div>
```
<!-- markdownlint-enable -->

#### Align to Vertical End

Add the `.ai-end` class to the `.grid` to align columns in the bottom of the `.grid`.

<!-- markdownlint-disable -->
<div class="grid grid-example ai-end" style="height: 8rem">
  <div class="col-12">
    <p class="p6 bc-primary c-light ta-center">End</p>
  </div>
</div>
``` html
<div class="grid ai-end"></div>
```
<!-- markdownlint-enable -->

If you want specific columns to be aligned in the bottom,
just add the class `.as-end` to these columns.
{: .mt-small}

<!-- markdownlint-disable -->
<div class="grid grid-example" style="height: 8rem">
  <div class="col-auto">
    <p class="p6 bc-primary c-light ta-center">Start</p>
  </div>
  <div class="col-auto as-end">
    <p class="p6 bc-primary c-light ta-center">End</p>
  </div>
</div>
``` html
<div class="grid">
  <div class="col-auto as-end"></div>
</div>
```
<!-- markdownlint-enable -->

### Responsive Alignment

The flex utilities and margin utilities are both responsive,
they can be used to control the alignment of columns responsively.

<!-- markdownlint-disable -->
<div class="grid grid-example jc-center jc-end-m jc-start-l">
  <div class="col-10">
    <p class="p6 bc-primary c-light ta-center">.jc-center.jc-end-m.jc-start-l</p>
  </div>
</div>

``` html
<!-- Align the columns in the center of horizontal on small screens, in the right on middle size screens and in the left on large screens. -->
<div class="grid jc-center jc-end-m jc-start-l"></div>
```

<div class="grid grid-example ai-center ai-end-m ai-start-l mt-small" style="height: 8rem">
  <div class="col-10">
    <p class="p6 bc-primary c-light ta-center">.ai-center.ai-end-m.ai-start-l</p>
  </div>
</div>

``` html
<!-- Align the columns in the center of vertical on small screens, in the bottom on middle size screens and in the top on large screens. -->
<div class="grid ai-center ai-end-m ai-start-l"></div>
```
<!-- markdownlint-enable -->

## Column Orders

### Introduction to Column Orders

Grid columns are not sorted by default, they appear just as the order in HTML.
But if you want to change the order a column appears in,
you can use the order utilities.

The order utility classes from `.od-1` to `.od-6` are used
to move columns backward to unsorted columns,
and from `.on-1` to `.on-6` are used to move columns
forward to unsorted columns.
The `on` is short for "negative order".

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-6 od-6">
    <p class="p6 bc-danger c-light ta-center">.od-6</p>
  </div>
  <div class="col-6 od-5">
    <p class="p6 bc-danger c-light ta-center">.od-5</p>
  </div>
  <div class="col-6 od-4">
    <p class="p6 bc-danger c-light ta-center">.od-4</p>
  </div>
  <div class="col-6 od-3">
    <p class="p6 bc-danger c-light ta-center">.od-3</p>
  </div>
  <div class="col-6 od-2">
    <p class="p6 bc-danger c-light ta-center">.od-2</p>
  </div>
  <div class="col-6 od-1">
    <p class="p6 bc-danger c-light ta-center">.od-1</p>
  </div>
  <div class="col-6 on-1">
    <p class="p6 bc-primary c-light ta-center">.on-1</p>
  </div>
  <div class="col-6 on-2">
    <p class="p6 bc-primary c-light ta-center">.on-2</p>
  </div>
  <div class="col-6 on-3">
    <p class="p6 bc-primary c-light ta-center">.on-3</p>
  </div>
  <div class="col-6 on-4">
    <p class="p6 bc-primary c-light ta-center">.on-4</p>
  </div>
  <div class="col-6 on-5">
    <p class="p6 bc-primary c-light ta-center">.on-5</p>
  </div>
  <div class="col-6 on-6">
    <p class="p6 bc-primary c-light ta-center">.on-6</p>
  </div>
</div>
<!-- markdownlint-enable -->

``` html
<div class="grid">
  <div class="col-12 od-6"></div>
  <div class="col-12 od-5"></div>
  <div class="col-12 od-4"></div>
  <div class="col-12 od-3"></div>
  <div class="col-12 od-2"></div>
  <div class="col-12 od-1"></div>
  <div class="col-12 on-1"></div>
  <div class="col-12 on-2"></div>
  <div class="col-12 on-3"></div>
  <div class="col-12 on-4"></div>
  <div class="col-12 on-5"></div>
  <div class="col-12 on-6"></div>
</div>
```

### Responsive Column Orders

The order utility classes are responsive.
Let's have a look at how to control columns' orders responsively
in the blow examples.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-12 od-2 on-1-m od-1-l">
    <p class="p6 bc-primary c-light ta-center">.od-2.on-1-m.od-1-l</p>
  </div>
  <div class="col-12 od-1 od-2-m on-1-l">
    <p class="p6 bc-danger c-light ta-center">.od-1.od-2-m.on-1-l</p>
  </div>
  <div class="col-12 on-1 od-1-m od-2-l">
    <p class="p6 bc-light ta-center">.on-1.od-1-m.od-2-l</p>
  </div>
</div>

``` html
<div class="grid grid-example">
  <div class="col-12 od-2 on-1-m od-1-l"></div>
  <div class="col-12 od-1 od-2-m on-1-l"></div>
  <div class="col-12 on-1 od-1-m od-2-l"></div>
</div>
```
<!-- markdownlint-enable -->

## Column Breaker

Columns will not be aligned in new rows unless the `.grid`'s
horizontal space is not enough.
But if you want to break a column in a new row forcely,
you can insert a `hr` tag before the column.
Let's see the below example for clarification.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-6">
    <p class="bc-primary c-light ta-center">.col-6</p>
  </div>
  <hr>
  <div class="col-6">
    <p class="bc-primary c-light ta-center">.col-6</p>
  </div>
</div>

``` html
<div class="grid">
  <div class="col-6"></div>
  <hr>
  <!-- The horizontal space is enough, but we use a <hr> to break the column in a new row. -->
  <div class="col-6"></div>
</div>
```
<!-- markdownlint-enable -->

## Grid Without Gutters

As metioned at the begining, there're `1rem` paddings in the
left and the right of columns. If you don't need the paddings,
you can replace the container's `.grid` class by the `.grid-edge` class.

<!-- markdownlint-disable -->
<div class="grid-edge grid-example">
  <div class="col-auto">
    <p class="bc-primary c-light ta-center">.grid-edge .col-auto</p>
  </div>
  <div class="col-auto">
    <p class="bc-danger c-light ta-center">.grid-edge .col-auto</p>
  </div>
</div>

``` html
<!-- Columns in this grid have no horizontal paddings. -->
<div class="grid-edge"></div>
```
<!-- markdownlint-enable -->

## Nested Grids

Grids can be nested, nested grids should be wrapped in one
of its parent grid's columns. Please see the below examples for detail.

<!-- markdownlint-disable -->
<div class="grid grid-example">
  <div class="col-6">
    <p class="bc-primary c-light ta-center">.grid .col-6</p>
  </div>
  <div class="col-12">
    <div class="grid">
      <div class="col-6 m-none">
        <p class="bc-danger c-light ta-center">.grid .col-12 .grid .col-6</p>
      </div>
    </div>
  </div>
  <div class="col-10">
    <p class="bc-primary c-light ta-center">.grid .col-10</p>
  </div>  
  <div class="col-10">
    <div class="grid">
      <div class="col-6 m-none">
        <p class="bc-danger c-light ta-center">.grid .col-10 .grid .col-6</p>
      </div>
    </div>
  </div>
</div>

``` html
<div class="grid">
  <div class="col-6"></div>
  <div class="col-12">
    <!-- A nested grid -->
    <div class="grid">
      <div class="col-6"></div>
    </div>
  </div>
  <div class="col-10"></div>  
  <div class="col-10">
    <!-- Another nested grid -->
    <div class="grid">
      <div class="col-6"></div>
    </div>
  </div>
</div>
```

<div class="grid grid-example mt-medium">
  <div class="col-12">
    <p class="bc-primary ta-center c-light">.grid .col-12</p>
  </div>
  <div class="col-12">
    <div class="grid-edge">
      <div class="col-12 m-none">
        <p class="bc-danger ta-center c-light">.grid .col-12 .grid-edge .col-12</p>
      </div>
    </div>
  </div>
</div>

``` html
<div class="grid">
  <div class="col-12"></div>
  <div class="col-12">
    <!-- A nested grid hasn't column gutters -->
    <div class="grid-edge">
      <div class="col-12"></div>
    </div>
  </div>
</div>
```

<div class="grid-edge grid-example mt-medium">
  <div class="col-12">
    <p class="bc-primary ta-center c-light">.grid-edge .col-12</p>
  </div>
  <div class="col-12">
    <div class="grid">
      <div class="col-12 m-none">
        <p class="bc-danger ta-center c-light">.grid-edge .col-12 .grid .col-12</p>
      </div>
    </div>
  </div>
</div>

``` html
<div class="grid-edge">
  <div class="col-12"></div>
  <div class="col-12">
    <!-- A grid has column gutters nested in another grid hasn't column gutters -->
    <div class="grid">
      <div class="col-12"></div>
    </div>
  </div>
</div>
```
<!-- markdownlint-enable -->

## Sass Variables

``` sass
$grid-columns: 12 !default
```

Default count of grid columns.

``` sass
$grid-gutter-width-rem: $spacing-medium-rem !default
```

Default horizontal padding of grid columns.