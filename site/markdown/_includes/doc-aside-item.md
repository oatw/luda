<!-- markdownlint-disable -->

{% for chapter in include.chapters %}
  {% if page.title == chapter.title %}
  <a class="btn btn-small btn-text-light btn-active" href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a>
  {% else %}
  <a class="btn btn-small btn-text-light" href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a>
  {% endif %}
{% endfor %}
