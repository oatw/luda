Degradation =

  _URL_ATTRIBUTE: 'data-degradation-url'

  _HTML: [
    '<div id="luda-degradation-html" '
    'style="padding:100px 30px;text-align:center">'
    '<h1>Your Browser Is Too Old!</h1>'
    '<p>'
    'Please visit this site with a modern browser '
    '<a target="_blank" href="https://www.google.com/chrome/">'
    '(Chrome recommended)'
    '</a>'
    '.</p>'
    '</div>'
    ].join('')

  _CSS_PROPERTIES: [
    display: 'flex'
    position: ['sticky||-webkit-sticky', 'fixed']
    'transition'
    'animation'
  ]

  _JS_PROPERTIES:
    es6Class: 'class X {}'
    es6ArrowFunction: '((x) => x)()'
    mutationObserver: 'new MutationObserver(function(){})'

  _NOTIFY_MILLSECONDS: 500

  check: ->
    @_checkEnv()
    @_checkJS @_JS_PROPERTIES
    @_checkCSS @_CSS_PROPERTIES

  _eval: eval

  _checkEnv: ->
    if typeof document isnt 'undefined'
      return window if typeof window isnt 'undefined'
      return global if typeof global isnt 'undefined'
    throw new Error 'Unsupported runtime environment.'

  _checkJS: (properties) ->
    for property, value of properties
      try
        @_eval value
      catch err
        @_notify()
        throw new Error property + ' ' + err

  _checkCSS: (properties) ->
    ele = document.createElement 'div'
    for property in properties
      if typeof property is 'string'
        @_CSSPropertySupported ele, property
      else
        for name, value of property
          @_CSSPropertySupported ele, name
          if value instanceof Array
            @_CSSValueSupported ele, name, valueEle for valueEle in value
          else
            @_CSSValueSupported ele, name, value

  _CSSPropertySupported: (ele, property) ->
    unless typeof ele.style[property] is 'string'
      @_notify()
      throw new Error 'Unsupported CSS property: ' + property

  _CSSValueSupported: (ele, property, valueStr) ->
    values = valueStr.split '||'
    for value in values
      ele.style[property] = value
      return if ele.style[property] is value
    @_notify()
    throw new Error 'Unsupported CSS property value: ' \
    + property + ' ' + valueStr

  _notify: ->
    redirectUrl = document.documentElement.getAttribute @_URL_ATTRIBUTE
    return location.href = redirectUrl if redirectUrl
    for script in document.scripts
      redirectUrl = script.getAttribute @_URL_ATTRIBUTE
      return location.href = redirectUrl if redirectUrl
    _self = this
    setInterval(->
      unless document.getElementById 'luda-degradation-html'
        document.body.innerHTML = _self._HTML if document.body
    , @_NOTIFY_MILLSECONDS)




Degradation.check()