<!-- markdownlint-disable -->

``` sass
$breakpoint-width-pxs: (s: 0, m: 768px, l: 1200px) !default
```

You can override this variable according to your needs,
make sure the value is a sass map. Except the key of
the first pair in the map, all the other keys are treated as postfixes
which will be added to the end of responsive components' classnames.