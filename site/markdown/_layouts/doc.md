---
layout: common
---
<!-- markdownlint-disable -->
<div id="doc" class="grid-edge">
  {% include doc-aside.md %}
  <main id="doc-container" class="col-auto p-medium pt-small-m px-large-m pb-large-m">
    <article class="article max-w-100 p-none">
      <h1 class="page-title display fw-semibold mt-large-m">{{ page.title }}</h1>
      <p class="h3 page-sub-title fw-light">{{ page.description }}</p>
      {{ content }}
    </article>
  </main>
  <nav id="doc-sub-nav" class="nav-aside col-auto zi-normal d-none d-block-l pr-large pl-medium pb-medium bc-none bi-none">
    <div class="nav-items m-none">
    </div>
  </nav>
  {% include theme-pannel.md %}
</div>