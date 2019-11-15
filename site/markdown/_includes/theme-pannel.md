<!-- markdownlint-disable -->
{% include variables.md %}

<div id="theme-pannel" data-turbolinks-permanent class="d-none d-block-m fix-r fix-b zi-high mr-large mb-large">

  <div class="btns-x btns-margin jc-end" data-toggle-target="change_theme">
    {% for theme_name in site.luda.themes %}
    <div class="theme-pannel-option btn-radio btn-hollow-dark bc-main circle">
      {% if theme_name == theme %}
      <input class="change-theme" checked type="radio" name="theme_pannel_apply_theme" value="{{ theme_name }}">
      {% else %}
      <input class="change-theme" type="radio" name="theme_pannel_apply_theme" value="{{ theme_name }}">
      {% endif %}
      <label class="bd-none circle sd-high tt-cap">Theme {{ theme_name }}</label>
    </div>
    {% endfor %}
    <div class="btn btn-light btn-ico circle sd-high" data-toggleable data-toggle-for="change_theme_trigger">
      <i class="ico ico-cross"></i>
    </div>
  </div>

  <button class="theme-pannel-trigger btn btn-ico-left btn-dark toggle-active mb-small mr-small circle sd-high" data-toggle-for="change_theme" data-toggle-target="change_theme_trigger" data-toggleable>
    <i class="ico material-icons">brush</i>
    Change Theme
  </button>

</div>