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
    luda('html').data APPLIED_THEME_ATTRIBUTE



  loadTheme = (theme, callback) ->
    pathPattern = luda('html').data THEME_PATH_PATTERN_ATTRIBUTE
    $appliedTheme = luda "[#{APPLIED_THEME_STYLE_ATTRIBUTE}]"
    $theme = luda '<link>'
    $theme.get(0).rel = 'stylesheet'
    $theme.get(0).type = 'text/css'
    $theme.data APPLIED_THEME_STYLE_ATTRIBUTE, theme
    $theme.get(0).href = pathPattern.replace THEME_PATH_PLACEHOLDER, theme
    $theme.get(0).onload = callback
    $appliedTheme.replaceWith $theme



  changeTheme = (theme) ->
    unless isChanging or theme is appliedTheme()
      isChanging = true
      luda('html').data APPLIED_THEME_ATTRIBUTE, theme
      luda('body').addClass CHANGING_CLASS
      setTimeout(->
        loadTheme theme, ->
          toggleThemeElements()
          luda('body').removeClass CHANGING_CLASS
          setTimeout(->
            isChanging = false
          , 500)
      , 500)



  removeOldThemes = ->
    appliedThemeName = appliedTheme()
    luda("[#{APPLIED_THEME_STYLE_ATTRIBUTE}]").each ->
      themeName = luda(this).data APPLIED_THEME_STYLE_ATTRIBUTE
      luda(this).remove() unless themeName is appliedThemeName



  toggleThemeElements = ($range) ->
    appliedThemeName = appliedTheme()
    luda("[#{SHOW_FOR_THEME_ATTRIBUTE}]", $range).each ->
      themeName = luda(this).data SHOW_FOR_THEME_ATTRIBUTE
      luda(this).toggleClass HIDDEN_CLASS, themeName is appliedThemeName



  luda(document).on 'change', TRIGGER_SELECTOR, -> changeTheme(this.value)
  luda(document).on 'turbolinks:render', -> removeOldThemes()
  luda(document).on 'turbolinks:before-render', (e) ->
    toggleThemeElements(e.data.newBody)
  luda(document).on 'turbolinks:load', (e) ->
    toggleThemeElements() unless e.data.timing.requestStart
)()