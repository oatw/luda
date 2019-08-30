(->
  docAsideScrollTop = 0

  luda(document).on 'turbolinks:before-visit', (e) ->
    $container = luda('#doc-aside').get 0
    docAsideScrollTop = if $container then $container.scrollTop else 0

  luda(document).on 'turbolinks:render', (e) ->
    $container = luda('#doc-aside').get 0
    $container.scrollTop = docAsideScrollTop if $container



  clipboard = null

  renderCode = ->
    $codes = luda '.highlight:not(.rendered)'
    $codes.each ->
      luda(this).addClass('rendered')
      @outerHTML = "<div class='rel'>\
      <button type='button' \
      class='code-copy abs-r abs-t zi-high btn btn-small btn-secondary'>\
      Copy</button>#{@outerHTML}</div>"

  initClipboard = ->
    clipboard.destroy() if clipboard
    clipboard = new ClipboardJS('.code-copy', {
      target: (trigger) -> trigger.nextElementSibling
    })
    clipboard.on 'success', (e) ->
      e.clearSelection()
      luda(e.trigger)
      .removeClass('focus btn-secondary')
      .addClass('btn-primary')
      .text('Copied!')
      setTimeout ->
        luda(e.trigger)
        .addClass('btn-secondary')
        .removeClass('btn-primary')
        .text('Copy')
      , 2000

  initCode = ->
    renderCode()
    initClipboard()

  luda.ready -> initCode()
  luda(document).on 'turbolinks:render', initCode



  insertSubNav = ->
    selectors = '#doc-container h2[id],\
    #doc-container h3[id],\
    #doc-container h4[id]'
    $titles = luda selectors
    items = ''
    if $titles.length
      $titles.each ->
        link = "<a href='##{@id}' data-turbolinks='false' \
        class='doc-sub-nav-item td-none'>\
        #{luda(this).text().replace(/^#/, '').replace(/modifier$/i, '')}</a>"
        switch @tagName.toLowerCase()
          when 'h2'
            itemClass = 'p7 mt-small mb-tiny py-none text-ellipsis'
          when 'h3'
            itemClass = 'p7 pl-medium mb-tiny py-none text-ellipsis'
          else
            itemClass = 'p7 pl-large mb-tiny py-none text-ellipsis'
        items += "<p class='#{itemClass}'>#{link}</p>"
      luda('#doc-sub-nav .nav-items').html items

  luda.ready -> insertSubNav()
  luda(document).on 'turbolinks:render', insertSubNav



  appendAnchors = ->
    selectors = '#doc-container h2[id]:not(.rendered),\
    #doc-container h3[id]:not(.rendered),\
    #doc-container h4[id]:not(.rendered),\
    #doc-container h5[id]:not(.rendered),\
    #doc-container h6[id]:not(.rendered)'
    $titles = luda selectors
    if $titles.length
      $titles.each ->
        luda(this).addClass('rendered rel')
        link = "<a href='##{@id}' data-turbolinks='false' \
        class='doc-anchor abs td-none c-primary'>#</a>"
        luda(this).prepend link

  luda.ready -> appendAnchors()
  luda(document).on 'turbolinks:render', appendAnchors
)()