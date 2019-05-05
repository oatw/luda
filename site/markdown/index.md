---
title: Home
layout: common
permalink: /
---
<!-- markdownlint-disable -->
<div id="home-background" class="fix w-100 of-hidden">
  <video autoplay loop muted playsinline class="o-more-muted">
    <source type="video/mp4" src="{{ '/assets/video/home-background.mp4' | relative_url }}">
  </video>
</div>

<div id="home" class="rel zi-high d-flex fd-column jc-between-m min-h-100vh pt-medium-m pb-small-m">
  {% include main-header.md %}
  <div class="home-main grid container w-100 py-large py-none-m">
    <h1 class="col-12 col-8-m col-6-l mt-large fw-regular c-light">
      A lightweight and responsive UI framework for modern web development.
    </h1>
    <hr class="mb-medium-m">
    <div class="col-12 col-3-m mt-large ta-right ta-left-m">
      <h3 class="fw-regular c-light">Lightweight</h3>
      <p class="c-light">
        No external dependencies<br>
        Each theme is about 25kb after gzipped
      </p>
    </div>
    <div class="col-12 col-3-m mt-large">
      <h3 class="fw-regular c-light">Modular</h3>
      <p class="c-light">
        Sass &amp; Coffeescript &amp; Javascript<br>
        Modular imports are well supported
      </p>
    </div>
    <div class="col-12 col-3-m mt-large ta-right ta-left-m">
      <h3 class="fw-regular c-light">Rhythmical</h3>
      <p class="c-light">
        Sticks to baseline grid system<br>
        Provides a harmonious vertical rhythm
      </p>
    </div>
    <div class="col-12 col-3-m mt-large">
      <h3 class="fw-regular c-light">Automatic</h3>
      <p class="c-light">
        Based on Mutation Observer<br>
        Lifecycles are automatically handled
      </p>
    </div>
    <div class="col-12 mt-large pt-small pb-medium d-none-m">
      <div class="btns-x btns-fluid">
        <a data-turbolinks="false" href="{{ '/general/introduction' | relative_url }}" class="btn btn-light c-primary">Get started</a>
        <a href="https://github.com/oatw/luda/raw/v{{site.luda.version}}/release/dist/luda-{{site.luda.version}}.zip" class="btn btn-hollow-light">Download</a>
      </div>
    </div>
  </div>
  {% include main-footer.md %}
</div>
