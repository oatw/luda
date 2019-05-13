<!-- markdownlint-disable -->

{% for chapter in include.chapters %}
  {% if page.title == chapter.title %}
  <a class="btn btn-small btn-text-light mt-tiny btn-active" href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a>
  {% else %}
  <a class="btn btn-small btn-text-light mt-tiny" href="{{ chapter.url | relative_url }}">{{ chapter.title }}</a>
  {% endif %}
{% endfor %}
