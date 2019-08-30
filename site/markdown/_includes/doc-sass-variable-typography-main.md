<!-- markdownlint-disable -->

``` sass
$typography-main: constant-get(typography-stacks, sans-serif) !default
```

Default font family of body texts.

``` sass
$typography-main-size-px: 16px !default
```

This variable is used for type scale calculation from size level 1 to 8.
The value of this variable is treated as level 6 and a calculated `rem` value
is used to set the `font-size` property of body.

``` sass
$typography-size-scale-ratio: constant-get(scale-ratios, minor-second) !default
```

Default type scale ratio of texts. Different level font sizes are calculated
based on this variable and `$typography-main-size-px`.

``` sass
$typography-main-baseline-offset-ratio: constant-get(baseline-offset-ratios, "Helvetica Neue") !default
```

Default baseline offset ratio of body texts font family, it's used to calculate text paddings for better baseline alignment.

``` sass
$typography-baseline-divided: false !default
```

By default `$baseline-height-px` is used as the basic unit for calculating typography line heights.
If the value of this variable is `true`, `$baseline-height-px / 2` will be used for
calculation. 

``` sass
$typography-main-expected-line-height-ratios: (1.3, 1.5, 1.5, 1.5) !default
```

Default expected line height ratios of body texts at level 5, 6, 7 and 8.
The values are used for calculating body texts line heights
and might not match the calcualted values exactly.

``` sass
$typography-main-color: $color-main !default
```

Default color of body texts.