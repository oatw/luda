<!-- markdownlint-disable -->
<header id="main-header" class="sd-low sti-t zi-highest bc-light">
  <div class="nav-header container sta py-medium-m bc-light">
    <a href="{{ '/' | relative_url }}" data-turbolinks="false" class="nav-logo">
      <img src="{{ '/assets/img/logo-text-dark.svg' | relative_url }}" alt="logo">
    </a>
    <button class="nav-open btn btn-text-dark btn-ico" data-toggle-for="header-menu">
      <i class="ico ico-menu"></i>
    </button>
    <div class="nav-menu bc-light" data-toggle-target="header-menu">
      <div class="d-flex d-none-m jc-between ai-center px-small py-tiny bc-muted">
        <span class="nav-logo">
          <img src="{{ '/assets/img/logo-text-dark.svg' | relative_url }}" alt="logo">
        </span>
        <button class="btn btn-text-dark btn-ico" data-toggleable>
          <i class="ico ico-cross"></i>
        </button>
      </div>
      <nav class="nav-items pt-medium pt-none-m">
        <a data-turbolinks="false" href="{{ '/general/introduction' | relative_url }}" class="btn btn-text-dark">Documentation</a>
        <a href="https://github.com/oatw/luda/blob/v{{ site.luda.version }}/CHANGELOG.md" class="btn btn-text-dark">Changelog</a>
        <a href="https://github.com/oatw/luda" class="btn btn-text-dark">Github</a>
        <a href="https://gitter.im/oatw/luda" class="btn btn-text-dark">Chatroom</a>
      </nav>
      <nav class="nav-sub-items">
        <div class="dropdown-static dropdown-absolute-m dropdown-align-right">
          <button class="btn btn-text-dark btn-ico-right btn-small">
            V<span class="d-none d-inline-l">ersion&nbsp;</span> {{ site.luda.siteVersion }} <i class="ico ico-down"></i>
          </button>
          <div class="dropdown-menu m-none">
            <div id="site-versions" class="dropdown-items py-small rounded">
              {% for version in site.luda.siteVersions %}
              {% if version != site.luda.siteVersion %}
              <a data-turbolinks="false" class="btn btn-text-dark btn-small mb-small mb-none-m" href="{{ site.luda.siteBaseUrl }}/{{ version }}">Version {{ version }}</a>
              {% endif %}
              {% endfor %}
            </div>
          </div>
        </div>
        <a class="d-none d-inline-flex-m btn btn-dark btn-small circle-l circle-r px-medium mx-small" href="https://github.com/oatw/luda/raw/v{{site.luda.version}}/release/dist/luda-{{site.luda.version}}.zip">Download</a>
      </nav>
    </div>
  </div>
</header>