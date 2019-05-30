---
title: Typography
description: Learn how to use headings, paragraphs and other kinds of texts in Luda.
---

## Introduction

Luda uses native font stacks by default, type sizes are calculated
in a modular scale way through `$typography-main-size-px` and
`$typography-size-scale-ratio`. There're 8 level type sizes,
size level from 1 to 6 are available for heading texts and
size level from 5 to 8 are available for body texts.
`<body>` font size is set at level 6 which is the
calculated `rem` value of `$typography-main-size-px`.

## Headings

### Heading Global Styles

Global styles are added to heading elements from `<h1>` to `<h6>`,
extra paddings are added in the top and bottom of these elements
to ensure baseline alignment.

{% capture headings %}
<h1>Heading h1</h1>
<h2>Heading h2</h2>
<h3>Heading h3</h3>
<h4>Heading h4</h4>
<h5>Heading h5</h5>
<h6>Heading h6</h6>
{% endcapture %}
<div class="typography-example baseline">
  {{ headings }}
</div>
``` html{{ headings }}```

### Heading Classes

The classes from `.h1` to `.h6` can be used to create texts looks like headings.

{% capture heading_classes %}
<span class="h1">Heading class .h1</span>
<span class="h2">Heading class .h2</span>
<span class="h3">Heading class .h3</span>
<span class="h4">Heading class .h4</span>
<span class="h5">Heading class .h5</span>
<span class="h6">Heading class .h6</span>
{% endcapture %}
<div class="typography-example baseline">
  {{ heading_classes }}
</div>
``` html{{ heading_classes }}```

## Paragraphs

### Paragraph Global styles

Global styles are added to the `p` element, like headings,
extra paddings in the top and bottom are also added.

{% capture paragraph %}
<p>
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
<p>
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example baseline">
  {{ paragraph }}
</div>
``` html{{ paragraph }}```

### Paragraph Classes

You can use the classes from `.p5` to `.p8`
to create texts looks like paragraphs.

{% capture paragraph_classes %}
<span class="p5">Paragraph class .p5</span>
<span class="p6">Paragraph class .p6</span>
<span class="p7">Paragraph class .p7</span>
<span class="p8">Paragraph class .p8</span>
{% endcapture %}
<div class="typography-example baseline">
  {{ paragraph_classes }}
</div>
``` html{{ paragraph_classes }}```

## .typo-inline{% include modifier.md %}

Sometimes, texts have different font sizes need be nested together,
remember to use the `.typo-inline` modifier class to ensure baseline alignment.
Let's see the below example.

{% capture inline %}
<p>
  Here are
  <span class="h1 typo-inline">some nested inline texts</span>.
</p>
{% endcapture %}
<div class="typography-example baseline">
  {{ inline }}
</div>
``` html{{ inline }}```

## Codes

If you need show large amount of codes in your applications,
you'd better use code highlighters like [rouge](http://rouge.jneen.net/),
they support many languages and features.
But if you just want to show small pieces of codes,
you can use the code styles in Luda directly.  

### Inline Codes

Global styles are added to the `code`, `samp` and `kbd` elements,
to use inline codes, just wrap you code snippets in these elements as below.

{% capture inline_code %}
<p>
  <code>const DOMAIN = 'luda.com'</code><br>
  <samp>Disk fault</samp><br>
  <kbd>CTRL + ALT + M</kbd>
</p>
{% endcapture %}
<div class="typography-example baseline">
  {{ inline_code }}
</div>
``` html{{ inline_code }}```

### Code Block

To create a code block, add the `.code` class to a `pre` element,
then wrap a `code` element inside.

{% capture code_block %}
<pre class="code">
<code>
  class DocumentationController
    private
    def _set_items
      @generals = @@generals
      @behaviours = @@behaviours
      @elements = @@elements
      @collections = @@collections
      @utilities = @@utilities
    end
  end
</code>
</pre>
{% endcapture %}
<div class="typography-example baseline mb-medium">
  {{ code_block }}
</div>
``` html{{ code_block }}```

## Quotes

Quotes should be included with the the `<q>` tag or the `<blockquote>` tag.

### Inline Quote

Global styles are added to the `<q>` tag and the `<cite>` tag,
for short quotes, we should use the `<q>` tag.

{% capture inline_quote %}
<p>
  <q>
    Words can be like X-rays, if you use them properly – they'll go through anything.
    You read and you're pierced.
  </q>
  <cite>– Brave New World</cite>
</p>
{% endcapture %}
<div class="typography-example baseline">
  {{ inline_quote }}
</div>
``` html{{ inline_quote }}```

### Blockquote

To include long quotes, we should use the `<blockquote>` tag.
Add the `.quote` class to the `<blockquote>` tag,
then wrap `<p>` tags inside. If a footnote is necessary,
include a `<footer>` tag.

{% capture blockquote %}
<blockquote class="quote" cite="https://tools.ietf.org/html/rfc1149">
  <p>
    Words can be like X-rays, if you use them properly – they'll go through anything.
    You read and you're pierced.
  </p>
  <footer class="p6">
    <cite>Brave New World</cite>
  </footer>
</blockquote>
{% endcapture %}
<div class="typography-example baseline">
  {{ blockquote }}
</div>
``` html{{ blockquote }}```

## Links

### Link Global Styles

Global styles are added to the `<a>` tag.

<p class="typography-example baseline">
  <a href="#" data-turbolinks="false">This is a link.</a>
</p>

``` html
<a href="#">This is a link.</a>
```

### Light Link

For using links in dark backgrounds, add the `.link-light` calss to the
`<a>` tag.

<p class="typography-example baseline bc-dark mb-medium">
  <a class="link-light" href="#" data-turbolinks="false">This is a light link.</a>
</p>

``` html
<a class="link-light" href="#">This is a light link.</a>
```

## Lists

For different purpose, you should use different type lists.

### Unordered List

The `<ul>` element represents an unordered list of items.

{% capture ul %}
<ul class="p6">
  <li>Unordered list item one</li>
  <li>Unordered list item two</li>
  <li>Unordered list item three</li>
</ul>
{% endcapture %}
<div class="typography-example baseline">
  {{ ul }}
</div>
``` html{{ ul }}```

### Ordered List

The `<ol>` element represents an ordered list of items.

{% capture ol %}
<ol class="p6">
  <li>Ordered list item one</li>
  <li>Ordered list item two</li>
  <li>Ordered list item three</li>
</ol>
{% endcapture %}
<div class="typography-example baseline">
  {{ ol }}
</div>
``` html{{ ol }}```

### Definition List

The `<dl`> element represents a description list.

{% capture dl %}
<dl class="p6">
  <dt>Title One</dt>
  <dd>Definition list item one</dd>
  <dt>Title Two</dt>
  <dd>Definition list item two</dd>
  <dt>Title Three</dt>
  <dd>Definition list item three</dd>
</dl>
{% endcapture %}
<div class="typography-example baseline">
  {{ dl }}
</div>
``` html{{ dl }}```

## Other Inline Texts

You can preview the appearances of other inline texts in the below examples.

<p class="typography-example baseline">
  <b>Bold</b>&nbsp;&nbsp;
  <strong>Strong</strong>&nbsp;&nbsp;
  <ins>Inserted</ins>&nbsp;&nbsp;
  <u>Underline</u>&nbsp;&nbsp;
  <em>Emphasis</em>&nbsp;&nbsp;
  <i>Italic</i>&nbsp;&nbsp;
  <del>Delete</del>&nbsp;&nbsp;
  <s>Stroke</s>&nbsp;&nbsp;  
  <span>Text <sub>Sub</sub></span>&nbsp;&nbsp;
  <span>Text <sup>Sup</sup></span>&nbsp;&nbsp;
  <abbr title="abbr">abbr</abbr>&nbsp;&nbsp;
  <mark>Mark</mark>&nbsp;&nbsp;
</p>

``` html
<p>
  <b>Bold</b>
  <strong>Strong</strong>
  <ins>Inserted</ins>
  <u>Underline</u>
  <em>Emphasis</em>
  <i>Italic</i>
  <del>Delete</del>
  <s>Stroke</s>  
  <span>Text <sub>Sub</sub></span>
  <span>Text <sup>Sup</sup></span>
  <abbr title="abbr">abbr</abbr>
  <mark>Mark</mark>
</p>
```

<!-- markdownlint-disable -->
## Sass Mixins
{: .mb-small}
<!-- markdownlint-enable -->

<!-- markdownlint-disable -->
``` sass
+font-face($family: null, $style: normal, $weight: 400, $locals: null, $urls: null, $unicodes: null)
```
<!-- markdownlint-enable -->

This mixin is used to import web fonts. `$locals`, `$urls`
and `$unicodes` should be lists.

``` sass
+typo-link($class: null, $color: null, $hover-color: null, $active-color: null)
```

This mixin is used to create more link color classes.

## Sass Variables

### Body Texts

{% include doc-sass-variable-typography-main.md %}

### Heading

``` sass
$typography-heading: null !default
```

Default font family of headings.

<!-- markdownlint-disable -->
``` sass
$typography-heading-baseline-offset-ratio: $typography-main-baseline-offset-ratio !default
```
<!-- markdownlint-enable -->
Default baseline offset ratio of headings, for better baseline alignment.

``` sass
$typography-heading-expected-line-height-ratios: (1.2, 1.2, 1.2, 1, 1, 1) !default
```

Default expected line height ratios of heading texts from level 1 to 6.
The values are used for calculating heading texts line heights
and might not match the calcualted values exactly.

``` sass
$typography-heading-color: null !default
```

``` sass
$typography-heading-font-weight: 500 !default
```

### Code

``` sass
$typography-code: constant-get(typography-stacks, code) !default
```

Default font family of codes.

<!-- markdownlint-disable -->
``` sass
$typography-code-baseline-offset-ratio: constant-get(baseline-offset-ratios, "Courier New") !default
```
<!-- markdownlint-enable -->

Default baseline offset ratio of codes, for better baseline alignment.

<!-- markdownlint-disable -->
``` sass
$typography-code-expected-line-height-ratio: nth($typography-main-expected-line-height-ratios, 2) !default
```
<!-- markdownlint-enable -->

Default expected line height ratios of code block.
The value is used for calculating code block line height
and might not match the calcualted value exactly.

``` sass
$typography-block-code-size-level: 7 !default
```

The value must be an integer between 5 and 8.

``` sass
$typography-code-padding-em: 0 0.2em !default
```

Default paddings of inline codes.

``` sass
$typography-code-background: $background-color-muted !default
```

``` sass
$typography-code-color: $color-main !default
```

``` sass
$typography-code-border-radius: $border-radius-main !default
```

``` sass
$typography-block-code-padding-rem: 0 $spacing-medium-rem !default
```

### Quote

``` sass
$typography-quote: null !default
```

Default font family of quotes.

``` sass
$typography-quote-baseline-offset-ratio: $typography-main-baseline-offset-ratio !default
```

Default baseline offset ratio of quotes, for better baseline alignment.

<!-- markdownlint-disable -->
``` sass
$typography-quote-expected-line-height-ratio: nth($typography-main-expected-line-height-ratios, 1) !default
```
<!-- markdownlint-enable -->

Default expected line height ratios of blockquote.
The value is used for calculating blockquote line height
and might not match the calcualted value exactly.

``` sass
$typography-block-quote-size-level: 5 !default
```

The value must be an integer between 5 and 8.

``` sass
$typography-cite-color: $color-muted !default
```

``` sass
$typography-block-quote-padding-rem: $spacing-medium-rem !default
```

``` sass
$typography-block-quote-p-margin-rem: 0 auto $spacing-small-rem !default
```

``` sass
$typography-block-quote-cite-line-height: $line-width-main !default
```

### Link

``` sass
$typography-link-text-decoration: underline !default
```

``` sass
$typography-link-hover-text-decoration: null !default
```

``` sass
$typography-link-active-text-decoration: null !default
```

``` sass
$typography-link-color: $color-main !default
```

``` sass
$typography-link-hover-color: $color-emphasis !default
```

``` sass
$typography-link-active-color: null !default
```

``` sass
$typography-link-light-color: $color-inverse-main !default
```

``` sass
$typography-link-light-hover-color: $color-inverse-emphasis !default
```

``` sass
$typography-link-light-active-color: null !default
```

### List

``` sass
$typography-list-nested-padding-em: 0 0 0 2em !default
```

Default paddings of nested lists.

### Mark

``` sass
$typography-mark-padding-em: 0 0.2em !default
```

``` sass
$typography-mark-background: $background-color-emphasis !default
```

``` sass
$typography-mark-color: $color-primary !default
```

``` sass
$typography-mark-border-radius: $border-radius-main !default
```

### Others

``` sass
$typography-sub-sup-size: 100% / $typography-size-scale-ratio !default
```

``` sass
$typography-sub-bottom-offset-em: -0.25em !default
```

``` sass
$typography-sup-top-offset-em: -0.5em !default
```