<!-- markdownlint-disable -->
<header id="main-header" class="nav-header">
  <a href="{{ '/' | relative_url }}" data-turbolinks="false" class="nav-logo">
    <img src="{{ '/assets/img/logo-text.svg' | relative_url }}" alt="logo">
  </a>
  <button class="nav-open btn btn-text-light btn-ico" data-toggle-for="header-menu">
    <i class="ico ico-menu"></i>
  </button>
  <div class="nav-menu" data-toggle-target="header-menu">
    <button class="nav-close btn btn-text-light btn-ico" data-toggle>
      <i class="ico ico-cross"></i>
    </button>
    <nav class="nav-items">
      {% if page.title == 'Home' %}
      <a href="{{ '/' | relative_url }}" class="btn btn-text-light btn-active">Home</a>
      {% else %}
      <a href="{{ '/' | relative_url }}" class="btn btn-text-light">Home</a>
      {% endif %}
      <a data-turbolinks="false" href="{{ '/general/introduction' | relative_url }}" class="btn btn-text-light">Documentation</a>
      <a href="https://github.com/oatw/luda/blob/v{{ site.luda.version }}/CHANGELOG.md" class="btn btn-text-light">Changelog</a>
      <a href="https://github.com/oatw/luda" class="btn btn-text-light">Github</a>
      <a href="https://gitter.im/oatw/luda" class="btn btn-text-light">Chatroom</a>
    </nav>
    <nav class="nav-sub-items">
      <div class="dropdown-static dropdown-absolute-m dropdown-align-right">
        {% if site.luda.siteVersions.size != 1 %}
        <button class="btn btn-text-light btn-ico-right btn-active">
          v{{ site.luda.siteVersion }} <i class="ico ico-down"></i>
        </button>
        {% else %}
        <button class="btn btn-text-light btn-active">
          v{{ site.luda.siteVersion }}
        </button>
        {% endif %}
        <div class="dropdown-menu">
          <div id="site-versions" class="dropdown-items mt-small-m">
            {% for version in site.luda.siteVersions %}
            {% if version != site.luda.siteVersion %}
            <a data-turbolinks="false" class="btn btn-text-light" href="{{ site.luda.siteBaseUrl }}/{{ version }}">v{{ version }}</a>
            {% endif %}
            {% endfor %}
          </div>
        </div>
      </div>
      {% if page.title == 'Home' %}
      <a href="https://github.com/oatw/luda/raw/v{{site.luda.version}}/release/dist/luda-{{site.luda.version}}.zip" class="d-none d-inline-flex-m btn btn-text-light btn-active mr-small">Download</a>
      <a data-turbolinks="false" href="{{ '/general/introduction' | relative_url }}" class="d-none d-inline-flex-m btn btn-small btn-light mr-small c-primary rounded">Get started</a>
      {% endif %}
    </nav>
  </div>
</header>
