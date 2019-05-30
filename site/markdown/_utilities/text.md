---
title: Text
description: Use text utilities to control text alignment, font weight, font style and more.
---

{% include variables.md %}

## Text Alignment

Text alignment utilities are extended with the
[screen width breakpoint postfixes]({{ width_breakpoints }}).
They are named using the format: `.ta-{direction}-{postfix}`.
Let's preview their effects through the below examples.

{% capture left %}
<p class="ta-left">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ left }}
</div>
``` html{{ left }}```

{% capture right %}
<p class="ta-right">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ right }}
</div>
``` html{{ right }}```

{% capture center %}
<p class="ta-center">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ center }}
</div>
``` html{{ center }}```

{% capture justify %}
<p class="ta-justify">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ justify }}
</div>
``` html{{ justify }}```

## Font Weight

Font weight utility classes are named using the format: `.fw-{value}`.
We use meaningful value words in the class names,
all the value words are listed in the below table.

<div class="table table-border">
  <table>
    <thead>
      <tr><th>Word</th><th>Value</th></tr>
    </thead>
    <tbody>
      <tr><td>lightest</td><td>100</td></tr>
      <tr><td>lighter</td><td>200</td></tr>
      <tr><td>light</td><td>300</td></tr>
      <tr><td>regular</td><td>400</td></tr>
      <tr><td>medium</td><td>500</td></tr>
      <tr><td>semibold</td><td>600</td></tr>
      <tr><td>bold</td><td>700</td></tr>
      <tr><td>bolder</td><td>800</td></tr>
      <tr><td>boldest</td><td>900</td></tr>
    </tbody>
  </table>
</div>

When you use font weight utilities,
make sure the value words you pick up are supported by the fonts you embedded
in your projects. Otherwise, the font weight effects will not be visible.

Let's preview the effects through the below examples.

{% capture lightest %}
<p class="fw-lightest">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ lightest }}
</div>
``` html{{ lightest }}```

{% capture lighter %}
<p class="fw-lighter">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ lighter }}
</div>
``` html{{ lighter }}```

{% capture light %}
<p class="fw-light">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ light }}
</div>
``` html{{ light }}```

{% capture regular %}
<p class="fw-regular">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ regular }}
</div>
``` html{{ regular }}```

{% capture medium %}
<p class="fw-medium">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ medium }}
</div>
``` html{{ medium }}```

{% capture semibold %}
<p class="fw-semibold">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ semibold }}
</div>
``` html{{ semibold }}```

{% capture bold %}
<p class="fw-bold">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ bold }}
</div>
``` html{{ bold }}```

{% capture bolder %}
<p class="fw-bolder">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ bolder }}
</div>
``` html{{ bolder }}```

{% capture boldest %}
<p class="fw-boldest">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ boldest }}
</div>
``` html{{ boldest }}```

## Font Style

There're two font style utility classes, `.fs-italic` which sets the
value of the `font-style` property to `italic` and `.fs-normal` which
sets the value of the `font-style` property to `normal`.

{% capture italic %}
<p class="fs-italic">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ italic }}
</div>
``` html{{ italic }}```

{% capture normal %}
<p class="fs-normal">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ normal }}
</div>
``` html{{ normal }}```

## Text Transform

Text transform utility classes are named using the format `.tt-{value}`.
The value can be one of `upper`, `lower` and `cap`.

{% capture upper %}
<p class="tt-upper">Lorem ipsum dolor sit amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ upper }}
</div>
``` html{{ upper }}```

{% capture lower %}
<p class="tt-lower">Lorem Ipsum Dolor Sit Amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ lower }}
</div>
``` html{{ lower }}```

{% capture cap %}
<p class="tt-cap">Lorem ipsum dolor sit amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ cap }}
</div>
``` html{{ cap }}```

## Text Decoration

Text decoration utility classes are named using the format `.td-{value}`.
The value can be one of `stroke`, `underline` and `none`.

{% capture stroke %}
<p class="td-stroke">Lorem ipsum dolor sit amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ stroke }}
</div>
``` html{{ stroke }}```

{% capture underline %}
<p class="td-underline">Lorem ipsum dolor sit amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ underline }}
</div>
``` html{{ underline }}```

{% capture none %}
<p class="td-none" style="text-decoration: underline">Lorem ipsum dolor sit amet...</p>
{% endcapture %}
<div class="typography-example">
  {{ none }}
</div>
``` html{{ none }}```

## Word Break

There're two utility classes for breaking words.
The `.wb-all` class breaks a long word into newlines
and the `.text-ellipsis` class cuts a long word with ellipsis into a single line.
Let's preview the effects in the below examples.

{% capture break_all %}
<p class="wb-all">LoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitametLoremipsumdolorsitamet</p>
{% endcapture %}
<div class="typography-example">
  {{ break_all }}
</div>
``` html{{ break_all }}```

{% capture ellipsis %}
<p class="text-ellipsis">
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
  erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
  et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
  Lorem ipsum dolor sit amet.
</p>
{% endcapture %}
<div class="typography-example">
  {{ ellipsis }}
</div>
``` html{{ ellipsis }}```