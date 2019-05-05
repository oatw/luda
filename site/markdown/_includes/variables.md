<!-- markdownlint-disable -->
{% if layout.theme %}
{% assign theme = layout.theme %}
{% else %}
{% assign theme = 'default' %}
{% endif %}

{% capture width_breakpoints %}{{ '/general/breakpoints#screen-width-breakpoints' | relative_url }}{% endcapture %}