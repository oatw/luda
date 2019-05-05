<!-- markdownlint-disable -->

<aside id="doc-aside" class="nav-aside col-12 col-3-m">
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
      <p class="px-small c-light">Get Started</p>
      {% assign ordered_generals = site.general | sort: "order" %}
      {% include doc-aside-item.md chapters=ordered_generals %}
    </div>
    <div class="nav-items">
      <p class="px-small c-light">Behaviors</p>
      {% include doc-aside-item.md chapters=site.behaviors %}
    </div>
    <div class="nav-items">
      <p class="px-small c-light">Elements</p>
      {% include doc-aside-item.md chapters=site.elements %}
    </div>
    <div class="nav-items">
      <p class="px-small c-light">Patterns</p>
      {% include doc-aside-item.md chapters=site.patterns %}
    </div>
    <div class="nav-items">
      <p class="px-small c-light">Utilities</p>
      {% include doc-aside-item.md chapters=site.utilities %}
    </div>
  </div>
</aside>
