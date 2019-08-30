import kernel from '../../page-objects/kernel.coffee'



describe 'event', ->

  beforeEach -> await kernel.open '/event'

  describe 'on', ->

    it 'attaches to single event', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        that = null
        handler = ->
          count += 1
          that = this
        returnValueOne = el.on('click', handler)
        returnValueTwo = el.trigger('click').trigger('click')
        returnValueOne is el \
        and returnValueTwo is el \
        and count is 2 \
        and that is el.els[0]

    it 'attaches to multiple events', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo bar', handler)
        el.trigger('foo').trigger('bar')
        count is 2

    it 'stops propagation if false is returned', ->
      kernel.expect true, ->
        el = luda('.event')
        parent = luda('.parent')
        countOne = 0
        countTwo = 0
        handler = ->
          countOne += 1
          false
        handlerTwo = -> countTwo += 1
        parent.on('foo', handler)
        parent.on('foo', handler)
        el.on('foo', handler)
        el.on('foo', handler)
        el.trigger('foo')
        parent.on('bar', handlerTwo)
        parent.on('bar', handlerTwo)
        el.on('bar&stop', handlerTwo)
        el.on('bar&stop', handlerTwo)
        el.trigger('bar')
        countOne is 2 and countTwo is 2

    it 'supports events that do not bubble', ->
      kernel.expect true, ->
        document.documentElement.focus()
        counts = []
        events = ['focus', 'blur', 'mouseenter', 'mouseleave']
        eventsTrigger = ['focus', 'blur', 'mouseover', 'mouseout']
        events.forEach (event, index) ->
          el = luda('.event-focus')
          parent = luda('.parent')
          count = 0
          eventTrigger = eventsTrigger[index]
          handler = -> count += 1
          parent.on(event, handler)
          el.on(event, handler)
          el.trigger(eventTrigger)
          counts.push(count)
        counts.every (c) -> c is 2

    it 'supports namespaces', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo bar.ns1', handler)
        el.on('foo.ns1.ns2', handler)
        el.trigger('foo.ns1.ns2').trigger('foo.ns1').trigger('foo.ns2')
        count is 3
    
    it 'supports event delegation', ->
      kernel.expect true, ->
        el = luda('.event')
        parent = luda('.parent')
        count = 0
        handler = -> count += 1
        parent.on('click', '.event', handler)
        el.trigger('click')
        parent.off('click', handler)
        el.trigger('click')
        count is 1
    
    it 'overwrites event.currentTarget when using event delegation', ->
      kernel.expect true, ->
        el = luda('.event')
        parent = luda('.parent')
        html = luda('html')
        count = 0
        currentTargets = []
        handler = (event) ->
          count += 1
          currentTargets.push(event.currentTarget)
        el.on('click', handler)
        parent.on('click', '.event', handler)
        html.on('click', handler)
        el.trigger('click')
        count is 3 \
        and currentTargets[0] is el.els[0] \
        and currentTargets[1] is el.els[0] \
        and currentTargets[2] is html.els[0]

    it 'stops propagation if false is returned when using event delegation', ->
      kernel.expect true, ->
        el = luda('.event')
        parent = luda('.parent')
        child = luda('.child')
        count = 0
        currentTargets = []
        handler = (event) ->
          count += 1
          currentTargets.push(event.currentTarget)
          false
        targets = [
          parent.els[0]
          parent.els[0]
          el.els[0]
          el.els[0]
          child.els[0]
          child.els[0]
        ]
        parent.on('foo', handler)
        parent.on('foo', handler)
        parent.on('foo', '.event', handler)
        parent.on('foo', '.event', handler)
        parent.on('foo', '.child', handler)
        parent.on('foo', '.child', handler)
        parent.trigger('foo')
        el.trigger('foo')
        child.trigger('foo')
        count is 6 \
        and currentTargets.every (t, i) -> t is targets[i]

    it 'supports keys', ->
      kernel.expect true, ->
        input = luda('.event-focus')
        count = 0
        handler = (event) -> count += 1
        input.on('keydown.test@enter&stop', handler)
        uid = input.els[0].__luda_guid
        event = luda.cache(true)[uid].event
        keyCode = event.keydown.quene[0].key[0]
        input.trigger('keydown')
        count is 1 \
        and keyCode is 13

  describe 'one', ->

    it 'removes the handler after the first call', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        returnValue = el.one('click', handler)
        el.trigger('click').trigger('click')
        el.one('click', handler).off('click', handler).trigger('click')
        returnValue is el \
        and count is 1

  describe 'off', ->

    it 'removes single event', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('click', handler)
        uid = el.els[0].__luda_guid
        evtCache = luda.cache(true)[uid].event
        globalHandler = evtCache.handler
        handlerInited = typeof globalHandler is 'function'
        handlerBinded = evtCache.click.binded is true
        queneCached = Array.isArray(evtCache.click.quene)
        callbackCached = evtCache.click.quene[0].callback is handler
        el.on('foo', handler)
        useSameGlobalHandler = evtCache.handler is globalHandler
        el.trigger('click')
        returnValue = el.off('click')
        el.off('foo')
        cleanCache = luda.cache(true)
        el.trigger('click')
        returnValue is el \
        and count is 1 \
        and cleanCache[uid] is undefined \
        and typeof uid is 'number' \
        and useSameGlobalHandler \
        and handlerInited \
        and handlerBinded \
        and queneCached \
        and callbackCached

    it 'removes multiple events', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo bar baz', handler)
        el.off('foo bar', handler)
        el.trigger('foo').trigger('bar').trigger('baz')
        count is 1

    it 'removes all events', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo bar', handler)
        el.off()
        el.trigger('foo').trigger('bar')
        count is 0

    it 'supports namespaces', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo.ns1.ns2', handler)
        .off('foo')
        .trigger('foo')
        .trigger('foo.ns1')
        .trigger('foo.ns2')
        .trigger('foo.ns3')
        el.on('foo.ns1.ns2', handler)
        .off('foo.ns1')
        .trigger('foo')
        .trigger('foo.ns1')
        .trigger('foo.ns2')
        .trigger('foo.ns3')
        el.on('foo.ns1.ns2', handler)
        .off('foo.ns2')
        .trigger('foo')
        .trigger('foo.ns1')
        .trigger('foo.ns2')
        .trigger('foo.ns3')
        el.on('foo.ns1.ns2', handler)
        .off('foo.ns1.ns2')
        .trigger('foo')
        .trigger('foo.ns1')
        .trigger('foo.ns2')
        .trigger('foo.ns3')
        el.on('foo.ns1.ns2 bar.ns1.ns2 baz.ns1.ns2', handler)
        .off('.ns1')
        .trigger ('foo')
        .trigger ('bar')
        .trigger ('baz')
        countTmp = count
        el.on('foo.ns1.ns2', handler)
        .off('foo.ns3')
        .trigger('foo')
        .trigger('foo.ns1')
        .trigger('foo.ns2')
        .trigger('foo.ns3')
        countTmp is 0 and count is 3

    it 'supports event delegation', ->
      kernel.expect true, ->
        el = luda('.event')
        parent = luda('.parent')
        countChild = 0
        countDelegate = 0
        handlerChild = -> countChild += 1
        handlerDelegate = -> countDelegate += 1
        el.on('click', handlerChild)
        parent.on('click', '.event', handlerDelegate)
        parent.off('click', '.event', handlerDelegate)
        el.trigger('click')
        countChild is 1 and countDelegate is 0
  
  describe 'trigger', ->

    it 'triggers single event', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('click', handler)
        returnValue = el.trigger('click')
        returnValue is el \
        and count is 1

    it 'triggers focus/blur natively', ->
      kernel.expect true, ->
        document.documentElement.focus()
        counts = []
        events = ['focus', 'blur']
        events.forEach (event) ->
          el = luda('.event-focus')
          handler = -> counts.push(1)
          nativeHandler = el.els[0][event]
          el.els[0][event] = ->
            handler()
            nativeHandler.apply(this, arguments)
          el.on(event, handler)
          el.trigger(event)
        counts.join(',') is '1,1'

    it 'can pass data to the handler', ->
      kernel.expect true, ->
        el = luda('.event')
        counts = []
        eventDatas = []
        datas = []
        handler = (event, d) ->
          counts.push(1)
          eventDatas.push(event.detail)
          datas.push(d)
        values = [123, 'string', {obj: true}]
        values.forEach (value) ->
          el.on('custom', handler)
          el.trigger('custom', value)
          el.off('custom', handler)
        counts.join(',') is '1,1,1' \
        and eventDatas.every((ed, i) -> ed is values[i]) \
        and datas.every((d, i) -> d is values[i])

    it 'can pass namespaces to the handler', ->
      kernel.expect true, ->
        el = luda('.event')
        namespaces = []
        handler = (event) -> namespaces.push(event.namespace)
        el.on('foo.ns1.ns2', handler)
        el.trigger('foo').trigger('foo.ns1')
        .trigger('foo.ns2').trigger('foo.ns1.ns2')
        namespaces.every (n, i) ->
          n.join('.') is ['', 'ns1', 'ns2', 'ns1.ns2'][i]

    it 'supports namespaces', ->
      kernel.expect true, ->
        el = luda('.event')
        count = 0
        handler = -> count += 1
        el.on('foo.ns1.ns2', handler)
        .trigger('foo').trigger('foo.ns1').trigger('foo.ns2')
        .trigger('foo.ns3').trigger('foo.ns1.ns3')
        count is 3

  describe 'ready', ->

    it 'supports DOM ready', ->
      isReady = ->
        result = await browser.execute -> document.readyState is 'loading'
        result.value is false
      getResult = ->
        result = await browser.execute ->
          ludaSetted: window.ld is window.luda
          executeOn: document.readyState
          readyReturnLuda: window.readyReturnValue is window.luda
        result.value
      check = ->
        if await isReady()
          result = await getResult()
          expect(result.ludaSetted).to.be.true \
          and expect(result.executeOn).to.not.equal('loading')
        else
          setTimeout check, 1000
      await browser.execute ->
        handler = (ld) ->
          window.ld = ld
          window.docReadyState = document.readyState
        window.readyReturnValue = luda.ready handler
        # fix firefox driver protocol bug
        console.log ''
      check()