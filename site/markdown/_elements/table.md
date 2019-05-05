---
title: Table
description: A table represents tabular data — that is, information presented
             in a two-dimensional table comprised of rows and columns of
             cells containing data.
---

## Striped Table

A striped table makes the data in rows easy to read, tables are striped
by default in Luda.
To create a striped table, add the `.table` calss to a block element
like `<div>`, then wrap a `<table>` element inside.

<div class="table my-small">
  <table>
    <thead>
      <tr>
        <th>Company</th>
        <th>Founded</th>
        <th>Founders</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Google</td>
        <td>September 4, 1998</td>
        <td>Larry Page, Sergey Brin</td>
        <td>Menlo Park, California, United States</td>
      </tr>
      <tr>
        <td>Facebook</td>
        <td>February 2004</td>
        <td>Mark Zuckerberg, Eduardo Saverin...</td>
        <td>Cambridge, Massachusetts, United States</td>
      </tr>
      <tr>
        <td>GitHub</td>
        <td>2008</td>
        <td>Tom Preston-Werner</td>
        <td>San Francisco, California, United States</td>
      </tr>
      <tr>
        <td>Airbnb</td>
        <td>August 2008</td>
        <td>Brian Chesky, Joe Gebbia, Nathan Blecharczyk</td>
        <td>San Francisco, California</td>
      </tr>
    </tbody>
  </table>
</div>
``` html
<div class="table">
  <table>
    <thead>
      <tr><th></th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
      <tr><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td></tr>
    </tbody>
  </table>
</div>
```

## Table Borders

If you want to add surrounding borders and row deviders to a table,
replace the container's `.table` class with the `.table-border` class.

<div class="table-border my-small">
  <table>
    <thead>
      <tr>
        <th>Company</th>
        <th>Founded</th>
        <th>Founders</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Google</td>
        <td>September 4, 1998</td>
        <td>Larry Page, Sergey Brin</td>
        <td>Menlo Park, California, United States</td>
      </tr>
      <tr>
        <td>Facebook</td>
        <td>February 2004</td>
        <td>Mark Zuckerberg, Eduardo Saverin...</td>
        <td>Cambridge, Massachusetts, United States</td>
      </tr>
      <tr>
        <td>GitHub</td>
        <td>2008</td>
        <td>Tom Preston-Werner</td>
        <td>San Francisco, California, United States</td>
      </tr>
      <tr>
        <td>Airbnb</td>
        <td>August 2008</td>
        <td>Brian Chesky, Joe Gebbia, Nathan Blecharczyk</td>
        <td>San Francisco, California</td>
      </tr>
    </tbody>
  </table>
</div>

``` html
<div class="table-border">
  <table>
    <thead>
      <tr><th></th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
      <tr><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td></tr>
    </tbody>
  </table>
</div>
```

## Style Modifiers

### No Wrap{% include modifier.md %}

A `.table` container has the `.table-nowrap` class prevents
contents in cells from breaking in newlines.
Let's see the below example.

<!-- markdownlint-disable -->
<div class="table table-nowrap my-small">
  <table>
    <thead>
      <tr>
        <th>#</th>
        <th>Company</th>
        <th>Founded</th>
        <th>Founders</th>
        <th>Address</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><div class="fm fm-check"><input type="checkbox"></div></td>
        <td>Google</td>
        <td>September 4, 1998</td>
        <td>Larry Page, Sergey Brin</td>
        <td>Menlo Park, California, United States</td>
        <td><button class="btn btn-small btn-primary">Mark</button></td>
      </tr>
      <tr>
        <td><div class="fm fm-check"><input type="checkbox"></div></td>
        <td>Facebook</td>
        <td>February 2004</td>
        <td>Mark Zuckerberg, Eduardo Saverin, Dustin Moskovitz, Chris Hughes, Andrew McCollum</td>
        <td>Cambridge, Massachusetts, United States</td>
        <td><button class="btn btn-small btn-primary">Mark</button></td>
      </tr>
      <tr>
        <td><div class="fm fm-check"><input type="checkbox"></div></td>
        <td>GitHub</td>
        <td>2008</td>
        <td>Tom Preston-Werner</td>
        <td>San Francisco, California, United States</td>
        <td><button class="btn btn-small btn-primary">Mark</button></td>
      </tr>
      <tr>
        <td><div class="fm fm-check"><input type="checkbox"></div></td>
        <td>Airbnb</td>
        <td>August 2008</td>
        <td>Brian Chesky, Joe Gebbia, Nathan Blecharczyk</td>
        <td>San Francisco, California</td>
        <td><button class="btn btn-small btn-primary">Mark</button></td>
      </tr>
    </tbody>
  </table>
</div>
<!-- markdownlint-enable -->

``` html
<div class="table table-nowrap">
  <table>
    <thead>
      <tr><th></th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
      <tr><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td></tr>
    </tbody>
  </table>
</div>
```

### Stripless{% include modifier.md %}

If you don't want a striped table, add the `.table-stripless` class
to the `.table` container.

<!-- markdownlint-disable -->
<div class="table-border table-stripless my-small">
  <table>
    <thead>
      <tr>
        <th>Company</th>
        <th>Founded</th>
        <th>Founders</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Google</td>
        <td>September 4, 1998</td>
        <td>Larry Page, Sergey Brin</td>
        <td>Menlo Park, California, United States</td>
      </tr>
      <tr>
        <td>Facebook</td>
        <td>February 2004</td>
        <td>Mark Zuckerberg, Eduardo Saverin...</td>
        <td>Cambridge, Massachusetts, United States</td>
      </tr>
      <tr>
        <td>GitHub</td>
        <td>2008</td>
        <td>Tom Preston-Werner</td>
        <td>San Francisco, California, United States</td>
      </tr>
      <tr>
        <td>Airbnb</td>
        <td>August 2008</td>
        <td>Brian Chesky, Joe Gebbia, Nathan Blecharczyk</td>
        <td>San Francisco, California</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- markdownlint-enable -->

``` html
<div class="table-border table-stripless">
  <table>
    <thead>
      <tr><th></th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
      <tr><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td></tr>
    </tbody>
  </table>
</div>
```

### Hover{% include modifier.md %}

The `.table-hover` class enhances hovering styles of table rows.
Hover the rows in the below table to preview the effects.

<!-- markdownlint-disable -->
<div class="table table-hover my-small">
  <table>
    <thead>
      <tr>
        <th>Company</th>
        <th>Founded</th>
        <th>Founders</th>
        <th>Address</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Google</td>
        <td>September 4, 1998</td>
        <td>Larry Page, Sergey Brin</td>
        <td>Menlo Park, California, United States</td>
      </tr>
      <tr>
        <td>Facebook</td>
        <td>February 2004</td>
        <td>Mark Zuckerberg, Eduardo Saverin...</td>
        <td>Cambridge, Massachusetts, United States</td>
      </tr>
      <tr>
        <td>GitHub</td>
        <td>2008</td>
        <td>Tom Preston-Werner</td>
        <td>San Francisco, California, United States</td>
      </tr>
      <tr>
        <td>Airbnb</td>
        <td>August 2008</td>
        <td>Brian Chesky, Joe Gebbia, Nathan Blecharczyk</td>
        <td>San Francisco, California</td>
      </tr>
    </tbody>
  </table>
</div>
<!-- markdownlint-enable -->

``` html
<div class="table table-hover">
  <table>
    <thead>
      <tr><th></th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
      <tr><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td></tr>
    </tbody>
  </table>
</div>
```

## Sass Variables

### Striped

``` sass
$table-head-background: $background-color-muted !default
```

``` sass
$table-row-even-background: $background-color-muted !default
```

``` sass
$table-row-odd-background: $background-color-main !default
```

### Border

``` sass
$table-border-style: solid !default
```

``` sass
$table-border-width: $line-width-main !default
```

``` sass
$table-border-color: $line-color-main !default
```

``` sass
$table-border-radius: $border-radius-main !default
```

### Hover

``` sass
$table-row-hover-background: $background-color-emphasis !default
```

``` sass
$table-row-hover-color: null !default
```

### Others

``` sass
$table-cell-padding-rem: $spacing-small-rem !default
```

``` sass
$table-head-color: $color-emphasis !default
```

``` sass
$table-body-color: $color-main !default
```