<!-- markdownlint-disable -->

<aside id="doc-aside" class="nav-aside col-12 col-3-m pb-medium-m">
  <a href="{{ '/' | relative_url }}" data-turbolinks="false" class="nav-logo">
    <img src="{{ '/assets/img/logo-text.svg' | relative_url }}" alt="logo">
  </a>
  {% include theme-dropdown.md %}
  <button class="nav-open btn btn-text-light btn-ico ml-none" data-toggle-for="nav-aside-menu">
    <i class="ico ico-menu"></i>
  </button>
  <div class="nav-menu" data-toggle-target="nav-aside-menu" data-toggle>
    <button class="nav-close btn btn-text-light btn-ico">
      <i class="ico ico-cross"></i>
    </button>
    <div class="nav-items">
      <p class="display px-small fw-semibold c-light">Get Started</p>
      {% assign ordered_generals = site.general | sort: "order" %}
      {% include doc-aside-item.md chapters=ordered_generals %}
    </div>
    <div class="nav-items">
      <p class="display px-small fw-semibold c-light">Behaviors</p>
      {% include doc-aside-item.md chapters=site.behaviors %}
    </div>
    <div class="nav-items">
      <p class="display px-small fw-semibold c-light">Elements</p>
      {% include doc-aside-item.md chapters=site.elements %}
    </div>
    <div class="nav-items">
      <p class="display px-small fw-semibold c-light">Patterns</p>
      {% include doc-aside-item.md chapters=site.patterns %}
    </div>
    <div class="nav-items">
      <p class="display px-small fw-semibold c-light">Utilities</p>
      {% include doc-aside-item.md chapters=site.utilities %}
    </div>
  </div>
</aside>

<button class="btn btn-dark btn-ico fix-r fix-t zi-highest circle sd-high m-small d-none-m" data-toggle-for="nav-aside-menu">
  <i class="ico ico-menu"></i>
</button>
