<!-- markdownlint-disable -->

``` sass
$typography-main: constant-get(typography-stacks, sans-serif) !default
```

Default font family of body texts.

``` sass
$typography-main-baseline-offset-ratio: constant-get(baseline-offset-ratios, "Helvetica Neue") !default
```

Default baseline offset ratio of body texts font family, it's used to calculate text paddings for better baseline alignment.

``` sass
$typography-main-size-px: 14px !default
```

Default font size of body texts.
A calculated `rem` value will be used to set the `font-size` property of body.

``` sass
$typography-main-size-level: 5 !default
```

Default font size level of body texts. The value must be an integer between 1 and 6.

``` sass
$typography-size-scale-ratio: constant-get(scale-ratios, minor-third) !default
```

Default type scale ratio of texts. Different level font sizes are calculated
based on this variable and `$typography-main-size-level`.

``` sass
$typography-main-line-height-ratio: 26 / 14 !default
```

Default line height of body texts. The height of baseline grid is calculated
based on this variable and `$typography-main-size-px`.

``` sass
$typography-main-color: $color-main !default
```

Default color of body texts.