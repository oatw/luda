---
title: Article
description: A beautiful layout pattern to show articles, useful for blog like projects.
---

## Introduction

An article pattern can be created by
adding the `.article` class to a `<article>` element.
By default vertical margins are added to elements
match the `.article > *` selector.
For specific elements like headings, paragraphs, tables and medias,
margins can be setted by changing sass variables or overriding the default margins.
You can preview the default layout effect in the below sample article.

{% capture article %}
<article class="article">
  <h1>Lorem Ipsum Dolor</h1>
  <p class="p7 c-muted">
    Lorem ipsum dolor sit amet lorem ipsum dolor sit amet
  </p>
  <p class="p5">
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <figure class="media">
    <img src="https://cdn.stocksnap.io/img-thumbs/960w/CTCNBFUFH8.jpg" alt="sample">
  </figure>
  <h2>Lorem Ipsum Dolor</h2>
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
  <h3>Lorem Ipsum Dolor</h3>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h4>Lorem Ipsum Dolor</h4>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h5>Lorem Ipsum Dolor</h5>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h6>Lorem Ipsum Dolor</h6>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h2>Lorem Ipsum Dolor</h2>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <figure class="media">
    <img src="https://cdn.stocksnap.io/img-thumbs/960w/CTCNBFUFH8.jpg" alt="sample">
  </figure>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h2>Lorem Ipsum Dolor</h2>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <div class="table">
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
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h2>Lorem Ipsum Dolor</h2>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
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
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <h2>Lorem Ipsum Dolor</h2>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
  <blockquote class="quote" cite="#">
    <p>
      Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
      nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
      erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
      et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
      Lorem ipsum dolor sit amet.
    </p>
    <footer class="p7">
      Lorem Ipsum Dolor
      <cite title="Lorem Ipsum Dolor">Lorem Ipsum Dolor</cite>
    </footer>
  </blockquote>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
    erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
    et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
</article>
{% endcapture %}
<div class="example">
  {{ article }}
</div>
``` html{{ article }}```

## Sass Variables

``` sass
$article-padding-rem: $spacing-small-rem !default
```

<!-- markdownlint-disable -->
``` sass
$article-max-width-rem: px-to-rem($typography-main-size-px * 70 / 2) + mirror-nth($article-padding-rem, 4) !default
```
<!-- markdownlint-enable -->

``` sass
$article-elements-margin-rem: $spacing-medium-rem 0 !default
```

``` sass
$article-headings-margin-rem: $spacing-medium-rem 0 $spacing-small-rem !default
```

``` sass
$article-heading-group-heading-margin-rem: $spacing-small-rem 0 !default
```

``` sass
$article-paragraph-margin-rem: $spacing-small-rem 0 !default
```

``` sass
$article-table-margin-rem: null !default
```

``` sass
$article-block-code-margin-rem: null !default
```

``` sass
$article-block-quote-margin-rem: null !default
```

``` sass
$article-media-margin-rem: null !default
```

``` sass
$article-list-margin-rem: $article-paragraph-margin-rem !default
```