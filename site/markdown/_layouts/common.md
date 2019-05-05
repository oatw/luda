<!-- markdownlint-disable -->
{% include variables.md %}
{% capture theme_path_pattern %}{{ '/.dist/css/luda-$theme$.min.css' | relative_url }}{% endcapture %}

<!DOCTYPE html>
<html lang="en" data-init-theme="{{ theme }}" data-applied-theme="{{ theme }}" data-theme-path-pattern="{{ theme_path_pattern }}">
  <head>
    <title>{{ page.title }} | Luda - A lightweight and responsive UI framework for modern web development.</title>
    {% include head.md %}
    <link rel="shortcut icon" href="{{ '/favicon.ico' | relative_url }}">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900">
    <script type="text/javascript" src="{{ '/assets/js/turbolinks.js' | relative_url }}"></script>
    <link rel="stylesheet" type="text/css" data-theme-style="{{ theme }}" href="{{ theme_path_pattern | replace: '$theme$', theme }}">
    {% if jekyll.environment == "development" %}
    <link rel="stylesheet" type="text/css" href="{{ '/.dist/css/site.css' | relative_url }}">
    <script type="text/javascript" src="{{ '/.dist/js/luda-degradation.min.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/.dist/js/luda.min.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/assets/js/clipboard.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/.dist/js/site.js' | relative_url }}"></script>
    {% else %}
    <link rel="stylesheet" type="text/css" href="{{ '/.dist/css/site.min.css' | relative_url }}">
    <script type="text/javascript" src="{{ '/.dist/js/luda-degradation.min.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/.dist/js/luda.min.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/assets/js/clipboard.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ '/.dist/js/site.min.js' | relative_url }}"></script>
    <script type="text/javascript" src="{{ site.luda.siteBaseUrl }}/version.js"></script>
    {% include site-version.md %}
    {% endif %}
  </head>
  <body>
    {% if jekyll.environment != "development" %}
    {% include site-version-alert.md %}
    {% endif %}
    {{ content }}
  </body>
</html>