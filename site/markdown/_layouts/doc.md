---
layout: common
---
<!-- markdownlint-disable -->
<div id="doc" class="grid-edge">
  {% include doc-aside.md %}
  <main id="doc-container" class="col-auto pt-medium pb-large px-medium p-large-m">
    <h1 class="page-title mt-large mt-small-m">{{ page.title }}</h1>
    <p class="p3 page-sub-title">{{ page.description }}</p>
    {{ content }}
  </main>
  <nav id="doc-sub-nav" class="nav-aside col-auto zi-normal d-none d-block-l pr-large pl-medium pb-medium bc-none bi-none">
    <div class="nav-items m-none">
    </div>
  </nav>
  {% include theme-pannel.md %}
</div>