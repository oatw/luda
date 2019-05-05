(->
  APPLIED_THEME_ATTRIBUTE = 'data-applied-theme'
  THEME_PATH_PATTERN_ATTRIBUTE = 'data-theme-path-pattern'
  THEME_PATH_PLACEHOLDER = '$theme$'
  APPLIED_THEME_STYLE_ATTRIBUTE = 'data-theme-style'
  SHOW_FOR_THEME_ATTRIBUTE = 'data-theme'
  HIDDEN_CLASS = 'd-none'
  CHANGING_CLASS = 'changing-theme'
  TRIGGER_SELECTOR = '.change-theme'
  isChanging = false



  appliedTheme = ->
    document.documentElement.getAttribute APPLIED_THEME_ATTRIBUTE



  loadTheme = (theme, callback) ->
    pathPattern = document.documentElement.getAttribute \
    THEME_PATH_PATTERN_ATTRIBUTE
    $appliedTheme = luda.$child "[#{APPLIED_THEME_STYLE_ATTRIBUTE}]"
    $theme = document.createElement 'link'
    $theme.rel = 'stylesheet'
    $theme.type = 'text/css'
    $theme.setAttribute APPLIED_THEME_STYLE_ATTRIBUTE, theme
    $theme.href = pathPattern.replace THEME_PATH_PLACEHOLDER, theme
    $theme.onload = callback
    document.head.replaceChild $theme, $appliedTheme



  changeTheme = (theme) ->
    unless isChanging or theme is appliedTheme()
      isChanging = true
      document.documentElement.setAttribute APPLIED_THEME_ATTRIBUTE, theme
      document.body.classList.add CHANGING_CLASS
      setTimeout(->
        loadTheme theme, ->
          toggleThemeElements()
          document.body.classList.remove CHANGING_CLASS
          setTimeout(->
            isChanging = false
          , 500)
      , 500)



  removeOldThemes = ->
    appliedThemeName = appliedTheme()
    luda.$children("[#{APPLIED_THEME_STYLE_ATTRIBUTE}]").forEach ($theme) ->
      themeName = $theme.getAttribute APPLIED_THEME_STYLE_ATTRIBUTE
      $theme.remove() unless themeName is appliedThemeName



  toggleThemeElements = ($range) ->
    appliedThemeName = appliedTheme()
    luda.$children("[#{SHOW_FOR_THEME_ATTRIBUTE}]", $range).forEach ($ele) ->
      themeName = $ele.getAttribute SHOW_FOR_THEME_ATTRIBUTE
      if themeName is appliedThemeName
        $ele.classList.remove HIDDEN_CLASS
      else
        $ele.classList.add HIDDEN_CLASS



  luda.on 'change', TRIGGER_SELECTOR, -> changeTheme(this.value)
  luda.on 'turbolinks:render', -> removeOldThemes()
  luda.on 'turbolinks:before-render', (e) ->
    toggleThemeElements(e.data.newBody)
  luda.on 'turbolinks:load', (e) ->
    toggleThemeElements() unless e.data.timing.requestStart
)()