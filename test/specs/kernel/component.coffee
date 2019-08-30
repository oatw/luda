import kernel from '../../page-objects/kernel.coffee'



describe 'component', ->

  before -> await kernel.open '/component'

  it 'supports singleton component', ->

    await browser.execute ->
      SC = luda.component('sc', document)
      .include
        selectors:
          dom: '.singleton-dom'
          click: '.singleton-click'
        count: 1
        clickHandler: (e) -> @con.prototype.count += 1
      .help
        create: ->
          @instanceAttr = 'sc'
        listen: ->
          [
            ['click', @selectors.click, @clickHandler]
          ]
        find: ->
          $dom: @selectors.dom
      readyHandler = ->
        window.scRootRight = SC.root is document
        window.scEvtBindedRight = SC.eventsBinded is true
        window.scAutoDisabled = SC.autoEnabled is false
        window.scLengthRight = Object.keys(SC.instances).length is 1
        window.scInsId = parseInt Object.keys(SC.instances)[0], 10
        window.scInsCreateOnce = luda.sc().id[0] is luda.sc().id[0] \
        and luda.sc().id[0] is scInsId
        window.scCreateExecuted = luda.sc()
        .hasOwnProperty('instanceAttr', {chain: false})[0] \
        and luda.sc().instanceAttr[0] is 'sc'
        window.scNotCacheWorks = luda.sc().$dom[0] \
        isnt luda.sc().$dom[0] \
        and luda.sc().$dom[0].length is 3
        luda('.singleton-click').trigger('click')
        window.scEventsTriggered = luda.sc().count[0] is 2 \
        and luda.sc.prototype.count is 2
        setTimeout(->
          luda('body').append('<p id="sc-ready"></p>')
        , 500)
      luda.ready readyHandler
      # fix firefox driver bug
      console.log ''

    await browser.waitForVisible '#sc-ready', 99999
    result = await browser.execute ->
      [
        window.scRootRight
        window.scEvtBindedRight
        window.scAutoDisabled
        window.scLengthRight
        window.scInsCreateOnce
        window.scCreateExecuted
        window.scNotCacheWorks
        window.scEventsTriggered
      ]
    result.value.forEach (r) -> expect(r).to.be.true

  it 'supports multiple components', ->

    await browser.execute ->
      MT = luda.component('multiple')
      .include
        selectors:
          cached: '.cache'
          click: '.click'
        count: 1
        clickHandler: (e) -> @count += 1
      .help
        create: ->
          @root.data 'multiple-id', @root.els[0].id
        destroy: ->
          @root.data 'removed-count', 1
        listen: ->
          [
            ['click', @selectors.click, @clickHandler]
          ]
        find: ->
          $cached: @selectors.cached
      readyHandler = ->
        window.mtRootRight = MT.root is '.multiple'
        window.mtEvtBindedRight = MT.eventsBinded is true
        window.mtAutoEnabled = MT.autoEnabled is true
        window.mtLengthRight = Object.keys(MT.instances).length is 3
        window.mtInsCreateOnce = luda.multiple('.multiple').id.join(',') \
        is luda.multiple('.multiple').id.join(',') \
        and luda.multiple('.multiple').id.join(',') \
        is Object.keys(MT.instances).join(',')
        window.mtCreateExecuted = luda('.multiple').els.every (el) ->
          luda(el).data('multiple-id') is el.id
        gettedCached = luda.multiple('.multiple').$cached
        gettedCachedAgain = luda.multiple('.multiple').$cached
        window.mtCacheWorks = gettedCached.every((c, i) ->
          c is gettedCachedAgain[i])
        window.mtCacheRight = luda.multiple('#multiple-1').$cached[0].length \
        is 3 and luda.multiple('#multiple-1').$cached[0].els.every (el) ->
          luda(el).data('root-id') is 'multiple-1'
        luda('#multiple-1 .click').trigger('click')
        window.mtEventsTriggered = luda.multiple('#multiple-1').count[0] is 2 \
        and luda.multiple('#multiple-2').count[0] is 1
        luda('.cache').remove()
        setTimeout(->
          window.mtCachedUpdated = luda.multiple('.multiple').$cached
          .every (cached) -> cached.length is 0
          removed = luda('#multiple-1').remove()
          setTimeout(->
            removedRight = Object.keys(MT.instances).length is 1 \
            and removed.data('removed-count') is 1
            removed.appendTo('body')
            setTimeout(->
              addedRight = Object.keys(MT.instances).length is 2 \
              and luda.multiple('#multiple-1').$cached[0].length is 0
              window.mtAutoWorks = removedRight and addedRight
              luda('body').append('<p id="mt-ready"></p>')
            , 500)
          , 500)
        , 500)
      luda.ready readyHandler
      # fix firefox driver bug
      console.log ''

    await browser.waitForVisible '#mt-ready', 99999
    result = await browser.execute ->
      [
        window.mtRootRight
        window.mtEvtBindedRight
        window.mtAutoEnabled
        window.mtLengthRight
        window.mtInsCreateOnce
        window.mtCreateExecuted
        window.mtCacheWorks
        window.mtCacheRight
        window.mtEventsTriggered
        window.mtCachedUpdated
        window.mtAutoWorks
      ]
    result.value.forEach (r) -> expect(r).to.be.true