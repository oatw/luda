---
title: Typography
description: Learn how to use headings, paragraphs and other  kinds of texts in Luda.
---

## Headings

### Heading Global Styles

Global styles are added to heading elements from `h1` to `h6`,
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
<div class="example baseline">
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
<div class="example baseline">
  {{ heading_classes }}
</div>
``` html{{ heading_classes }}```

## Paragraphs

### Paragraph Global styles

Global styles are added to the `p` element, like headings,
extra paddings in the top and bottom are also added.

{% capture paragraph %}
<p>
  Once upon time a girl named Cinderella lived with her stepmother and two stepsisters.
  Poor Cinderella had to work hard all day long so the others could rest.
  It was she who had to wake up each morning when it was still dark
  and cold to start the fire. It was she who cooked the meals.
  It was she who kept the fire going. The poor girl could not stay clean,
  from all the ashes and cinders by the fire.
</p>
<p>
  One day, big news came to town. The King and Queen were going to have a ball!
  It was time for the Prince to find a bride.
  All of the young ladies in the land were invited to come.
  They were wild with joy! They would wear their most beautiful gown
  and fix their hair extra nice. Maybe the prince would like them!
</p>
{% endcapture %}
<div class="example baseline">
  {{ paragraph }}
</div>
``` html{{ paragraph }}```

### Paragraph Classes

You can use the classes from `.p1` to `p6`
to create texts looks like paragraphs.
In most cases, texts with the classes `.p4`, `.p5` or `.p6`
are easy for reading.

{% capture paragraph_classes %}
<span class="p1">Paragraph class .p1</span>
<span class="p2">Paragraph class .p2</span>
<span class="p3">Paragraph class .p3</span>
<span class="p4">Paragraph class .p4</span>
<span class="p5">Paragraph class .p5</span>
<span class="p6">Paragraph class .p6</span>
{% endcapture %}
<div class="example baseline">
  {{ paragraph_classes }}
</div>
``` html{{ paragraph_classes }}```

## Inline Modifier{% include modifier.md %}

Sometimes, texts have different font sizes need be nested together,
remember to use the `.typo-inline` modifier class to ensure baseline alignment.
Let's see the below example.

{% capture inline %}
<p>
  Here are
  <span class="p2 typo-inline">some nested inline texts</span>.
</p>
{% endcapture %}
<div class="example baseline">
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
<div class="example baseline">
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
<div class="example baseline">
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
<div class="example baseline">
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
  <footer class="p5">
    <cite>Brave New World</cite>
  </footer>
</blockquote>
{% endcapture %}
<div class="example baseline">
  {{ blockquote }}
</div>
``` html{{ blockquote }}```

## Links

### Link Global Styles

Global styles are added to the `<a>` tag.

<p class="example baseline">
  <a href="#" data-turbolinks="false">This is a link.</a>
</p>

``` html
<a href="#">This is a link.</a>
```

### Light Link

For using links in dark backgrounds, add the `.link-light` calss to the
`<a>` tag.

<p class="example baseline bc-dark">
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
<ul class="p5">
  <li>Unordered list item one</li>
  <li>Unordered list item two</li>
  <li>Unordered list item three</li>
</ul>
{% endcapture %}
<div class="example baseline">
  {{ ul }}
</div>
``` html{{ ul }}```

### Ordered List

The `<ol>` element represents an ordered list of items.

{% capture ol %}
<ol class="p5">
  <li>Ordered list item one</li>
  <li>Ordered list item two</li>
  <li>Ordered list item three</li>
</ol>
{% endcapture %}
<div class="example baseline">
  {{ ol }}
</div>
``` html{{ ol }}```

### Definition List

The `<dl`> element represents a description list.

{% capture dl %}
<dl class="p5">
  <dt>Title One</dt>
  <dd>Definition list item one</dd>
  <dt>Title Two</dt>
  <dd>Definition list item two</dd>
  <dt>Title Three</dt>
  <dd>Definition list item three</dd>
</dl>
{% endcapture %}
<div class="example baseline">
  {{ dl }}
</div>
``` html{{ dl }}```

## Other Inline Texts

You can preview the appearances of other inline texts in the below examples.

<p class="example baseline">
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
$typography-heading-color: $color-emphasis !default
```

``` sass
$typography-heading-font-weight: 700 !default
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

``` sass
$typography-block-code-size-level: 6 !default
```

The value must be an integer between 1 and 6.

``` sass
$typography-code-padding-em: 0.1em 0.3em !default
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
$typography-code-block-padding-rem: 0 $spacing-medium-rem !default
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

``` sass
$typography-block-quote-size-level: 4 !default
```

The value must be an integer between 1 and 6.

``` sass
$typography-cite-color: $color-muted !default
```

<!-- markdownlint-disable -->
``` sass
$typography-quote-block-padding-rem: 3 * $spacing-small-rem $spacing-large-rem $spacing-medium-rem !default
```
<!-- markdownlint-enable -->

``` sass
$typography-quote-block-p-margin-rem: 0 auto $spacing-small-rem !default
```

``` sass
$typography-quote-block-cite-line-height: $line-width-main !default
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
$typography-list-nested-padding-em: 0 0 0 strip-unit($spacing-medium-rem) * 1em !default
```

Default paddings of nested lists.

### Mark

``` sass
$typography-mark-padding-em: 0.1em 0.3em !default
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