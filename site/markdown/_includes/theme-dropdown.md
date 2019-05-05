<!-- markdownlint-disable -->
{% include variables.md %}
<div id="theme-dropdown" data-turbolinks-permanent class="dropdown-fixed ml-auto d-none-m">
  <button class="btn btn-ico btn-text-primary">
    <i class="change-theme-trigger ico material-icons">brush</i>
  </button>
  <div class="dropdown-menu">
    <div class="dropdown-items">
      <div class="btns-y">
        {% for theme_name in site.luda.themes %}
        <div class="btn-radio btn-hollow-primary">
          {% if theme_name == theme %}
          <input class="change-theme" checked type="radio" name="theme_dropdown_apply_theme" value="{{ theme_name }}">
          {% else %}
          <input class="change-theme" type="radio" name="theme_dropdown_apply_theme" value="{{ theme_name }}">
          {% endif %}
          <label class="bd-none">Theme {{ theme_name }}</label>
        </div>
        {% endfor %}
      </div>
    </div>
  </div>
</div>