import kernel from '../../page-objects/kernel.coffee'



describe 'manipulation', ->

  beforeEach -> await kernel.open '/manipulation'

  it 'inserted script tags get executed', ->
    kernel.expect true, ->
      scripts = [
        '<script>var __script_test__ = 0</script>'
        '<script type="">__script_test__ = 1</script>'
        '<script type="text/javascript">__script_test__ = 2</script>'
        '<script type="text/ecmascript">__script_test__ = 3</script>'
        '<script type="module">__script_test__ = 4</script>'
        '<div class="nested"><script>__script_test__ = 5</script></div>'
      ]
      scripts.every (script, index) ->
        luda(script).appendTo('.anchor')
        window.__script_test__ is index

  describe 'after', ->

    it 'inserts a selector after', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        returnValue = anchor.after('<div>')
        prev = luda('.anchor').prev()
        next = luda('.anchor').next()
        returnValue is anchor \
        and prev.length is 0 and next.length is 1

    it 'inserts multiple selectors after', ->
      kernel.expect true, ->
        luda('.anchor').after('<div>', '<div>', '<div>')
        prev = luda('.anchor').prev()
        siblings = luda('.anchor').siblings()
        prev.length is 0 and siblings.length is 3

  describe 'append', ->

    it 'appends a selector', ->
      kernel.expect true, ->
        parent = luda('.parent')
        returnValue = parent.append('<div>')
        returnValue is parent \
        and parent.next().length is 1
    
    it 'appends multiple selectors', ->
      kernel.expect 3, ->
        luda('.parent').append('<div>', '<div>', '<div>')
        luda('.anchor').siblings().length
    
    it "doesn't throw with undefined", ->
      kernel.expect 'passed', ->
        luda('.anchor').append(undefined)
        'passed'

  describe 'appendTo', ->

    it 'appends this to a selector', ->
      kernel.expect true, ->
        div = luda('<div>')
        returnValue = div.appendTo('.parent')
        returnValue is div \
        and luda('.anchor').next().length is 1

  describe 'before', ->

    it 'inserts a selector before', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        returnValue = anchor.before('<div>')
        returnValue is anchor \
        and anchor.prev().length is 1 \
        and anchor.next().length is 0

    it 'inserts multiple selectors before', ->
      kernel.expect true, ->
        luda('.anchor').before('<div>', '<div>', '<div>')
        luda('.anchor').next().length is 0 \
        and luda('.anchor').siblings().length is 3

  describe 'clone', ->

    it 'clones all elements', ->
      kernel.expect true, ->
        original = luda('#el *')
        cloned = original.clone()
        original.length is cloned.length \
        and original.els[0] isnt cloned.els[0] \
        and original.els[0].className is cloned.els[0].className

    it 'clones cache and events deeply', ->
      kernel.expect true, ->
        original = luda('#el')
        originalParent = luda('#el .parent')
        originalCousin = luda('#el .cousin')
        original.cache({num: 1, arr: [1]})
        originalParent.cache({num: 2, arr: [2]})
        originalCousin.cache({num: 3, arr: [3]})
        count = 0
        handler = -> count += 1
        parentCount = 0
        parentHandler = -> parentCount += 1
        cousinCount = 0
        cousinHandler = -> cousinCount += 1
        original.on('click', handler)
        originalParent.on('click&stop', parentHandler)
        originalCousin.on('click&stop', cousinHandler)
        original.trigger('click')
        originalParent.trigger('click')
        originalCousin.trigger('click')
        window.scriptExCount = 0
        originalParent.append('<script>scriptExCount += 1</script>')
        cloned = luda('#el').clone(true)
        clonedParent = luda('.parent', cloned)
        clonedCousin = luda('.cousin', cloned)
        luda('body').append(cloned)
        cloned.trigger('click')
        clonedParent.trigger('click')
        clonedCousin.trigger('click')
        window.unAttachedScriptExCount = 0
        unAttachedScript = luda('<script>unAttachedScriptExCount += 1</script>')
        clonedScript = unAttachedScript.clone(true)
        luda('body').append(clonedScript)
        luda('body').append(unAttachedScript)
        window.unAttachedScriptExCount is 1 \
        and window.scriptExCount is 1 \
        and count is 2 \
        and parentCount is 2 \
        and cousinCount is 2 \
        and cloned.cache() isnt original.cache() \
        and cloned.cache('num') is original.cache('num') \
        and cloned.cache('arr') is original.cache('arr') \
        and clonedParent.cache() isnt originalParent.cache() \
        and clonedParent.cache('num') is originalParent.cache('num') \
        and clonedParent.cache('arr') is originalParent.cache('arr') \
        and clonedCousin.cache() isnt originalCousin.cache() \
        and clonedCousin.cache('num') is originalCousin.cache('num') \
        and clonedCousin.cache('arr') is originalCousin.cache('arr')

    
  describe 'detach', ->

    it 'detaches all elements and preserves their event handlers', ->
      kernel.expect true, ->
        count = 0
        anchor = luda('.anchor')
        handler = -> count += 1
        anchor.on('foo', handler)
        returnValue = anchor.detach()
        anchor.trigger('foo')
        anchor.detach()
        anchor.trigger('foo')
        returnValue is anchor \
        and luda('.anchor').length is 0 \
        and count is 2

  describe 'empty', ->

    it 'empties all elements and their cache', ->
      kernel.expect true, ->
        el = luda('#el')
        parent = luda('.parent')
        cousin = luda('.cousin')
        parent.on('click', -> console.log('executed'))
        cousin.on('click', -> console.log('executed'))
        parent.cache({a: 1, b: {c: 1}})
        cousin.cache({a: 1, b: {c: 1}})
        returnValue = el.empty()
        parentId = parent.els[0].__luda_guid
        cousinId = cousin.els[0].__luda_guid
        returnValue is el \
        and el.contents().length is 0 \
        and Object.keys(luda.cache()).length is 0 \
        and luda.cache(true)[parentId] is undefined \
        and luda.cache(true)[cousinId] is undefined

    it 'supports multiple elements in the collection', ->
      kernel.expect true, ->
        parent = luda('.parent')
        aunt = luda('.aunt')
        parents = parent.add(aunt)
        parents.empty()
        parent.contents().length is 0 \
        and aunt.contents().length is 0

  describe 'html', ->

    it 'gets the html', ->
      kernel.expect true, ->
        html = luda('.parent').html().trim()
        html is '<div class="anchor">content</div>'

    it 'cleans cache', ->
      kernel.expect true, ->
        el = luda('#el')
        parent = luda('.parent')
        cousin = luda('.cousin')
        parent.on('click', -> console.log('executed'))
        cousin.on('click', -> console.log('executed'))
        parent.cache({a: 1, b: {c: 1}})
        cousin.cache({a: 1, b: {c: 1}})
        returnValue = el.html('<div>content</div>')
        parentId = parent.els[0].__luda_guid
        cousinId = cousin.els[0].__luda_guid
        returnValue is el \
        and el.html() is '<div>content</div>' \
        and Object.keys(luda.cache()).length is 0 \
        and luda.cache(true)[parentId] is undefined \
        and luda.cache(true)[cousinId] is undefined

    it 'sets the html', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        html = '<div class="foo"></div>'
        returnValue = anchor.html(html)
        returnValue is anchor \
        and anchor.html() is html \
        and luda('.foo').length is 1

    it 'sets plain strings', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        html = 'foo'
        anchor.html(html)
        anchor.html() is html

    it 'sets numbers', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        anchor.html(0)
        anchor.html() is '0'
  
  describe 'insertAfter', ->

    it 'inserts this after a selector', ->
      kernel.expect true, ->
        div = luda('<div>')
        returnValue = div.insertAfter('.anchor')
        returnValue is div \
        and luda('.anchor').next().length is 1
  
  describe 'insertBefore', ->

    it 'inserts this before a selector', ->
      kernel.expect true, ->
        div = luda('<div>')
        returnValue = div.insertBefore('.anchor')
        returnValue is div \
        and luda('.anchor').prev().length is 1

  describe 'prepend', ->

    it 'prepends a selector', ->
      kernel.expect true, ->
        parent = luda('.parent')
        returnValue = parent.prepend('<div>')
        returnValue is parent \
        and luda('.anchor').prev().length is 1
    
    it 'prepends multiple selectors', ->
      kernel.expect 3, ->
        luda('.parent').prepend('<div>', '<div>', '<div>')
        luda('.anchor').siblings().length
    
    it "doesn't throw with undefined",  ->
      kernel.expect 'passed', ->
        luda('.anchor').prepend(undefined)
        'passed'
  
  describe 'prependTo', ->

    it 'prepends this to a selector', ->
      kernel.expect true, ->
        div = luda('<div>')
        returnValue = div.prependTo('.parent')
        returnValue is div \
        and luda('.anchor').prev().length is 1

  describe 'remove', ->

    it 'detaches all elements and removes their event handlers and cache', ->
      kernel.expect true, ->
        count = 0
        anchor = luda('.anchor')
        handler = -> count += 1
        anchor.cache('custom', true)
        anchor.on('foo', handler)
        uid = anchor.els[0].__luda_guid
        returnValue = anchor.remove()
        anchor.prependTo('body')
        anchor.trigger('foo')
        anchor.cache()
        anchor.remove()
        anchor.trigger('foo')
        anchor.cache()
        anchor.remove()
        returnValue is anchor \
        and not luda.cache()[uid] \
        and not luda.cache(true)[uid] \
        and luda('.anchor').length is 0 \
        and count is 0

  describe 'replaceAll', ->

    it 'replaces a selector with this', ->
      kernel.expect true, ->
        parent = luda('.parent')
        html = '<p></p>'
        p = luda('<p>')
        returnValue = p.replaceAll('.anchor')
        returnValue is p \
        and parent.html().trim() is html \
        and luda('.anchor').length is 0 \
        and luda('.parent p').length is 1

    it 'supports multiple elements', ->
      kernel.expect 3, ->
        luda('<p></p>').replaceAll(luda('.parent, .uncle, .aunt'))
        luda('#el p').length

  describe 'replaceWith', ->

    it 'replaces this with a selector', ->
      kernel.expect true, ->
        parent = luda('.parent')
        anchor = luda('.anchor')
        html = '<p></p>'
        returnValue = anchor.replaceWith(html)
        returnValue is anchor \
        and parent.html().trim() is html \
        and luda('.anchor').length is 0 \
        and luda('.parent p').length is 1

    it 'supports multiple elements', ->
      kernel.expect 3, ->
        luda('.parent, .uncle, .aunt').replaceWith('<p></p>')
        luda('#el p').length

  describe 'text', ->

    it 'gets the text', ->
      kernel.expect 'content', ->
        luda('.anchor').text()

    it 'cleans elements cache', ->
      kernel.expect true, ->
        el = luda('#el')
        parent = luda('.parent')
        cousin = luda('.cousin')
        parent.on('click', -> console.log('executed'))
        cousin.on('click', -> console.log('executed'))
        parent.cache({a: 1, b: {c: 1}})
        cousin.cache({a: 1, b: {c: 1}})
        returnValue = el.text('text content')
        parentId = parent.els[0].__luda_guid
        cousinId = cousin.els[0].__luda_guid
        returnValue is el \
        and el.text() is 'text content' \
        and Object.keys(luda.cache()).length is 0 \
        and luda.cache(true)[parentId] is undefined \
        and luda.cache(true)[cousinId] is undefined
    
    it 'sets html strings', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        text = '<div>foo</div>'
        returnValue = anchor.text(text)
        returnValue is anchor \
        and anchor.text() is text

    it 'sets plain strings', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        text = 'foo'
        anchor.text(text)
        anchor.text() is text

    it 'sets numbers', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        anchor.text(0)
        anchor.text() is '0'

  describe 'unwrap', ->

    it 'unwraps each element', ->
      kernel.expect true, ->
        anchor = luda('.anchor')
        returnValue = anchor.unwrap()
        returnValue is anchor \
        and luda('.parent').length is 0 \
        and anchor.parent().els[0] is luda('#el').els[0]

  describe 'wrap', ->

    it 'wraps a structure around each element', ->
      kernel.expect true, ->
        els = luda('.uncle, .aunt')
        wrapper = '<div class="wrapper"></div>'
        returnValue = els.wrap(wrapper)
        returnValue is els \
        and els.parent().filter('.wrapper').length is 2

    it 'supports nested structures', ->
      kernel.expect true, ->
        els = luda('.uncle, .aunt')
        wrapper = '<div class="wrapper"><div class="nested"></div></div>'
        els.wrap(wrapper)
        els.parent().filter('.nested').length is 2 \
        and els.parent().parent().filter('.wrapper').length is 2

  describe 'wrapAll', ->

    it 'wraps a structure around all elements', ->
      kernel.expect true, ->
        els = luda('.uncle, .aunt')
        wrapper = '<div class="wrapper"></div>'
        returnValue = els.wrapAll(wrapper)
        returnValue is els \
        and els.parent().filter('.wrapper').length is 1

    it 'supports nested structures', ->
      kernel.expect true, ->
        els = luda('.uncle, .aunt')
        wrapper = '<div class="wrapper"><div class="nested"></div></div>'
        els.wrapAll(wrapper)
        els.parent().filter('.nested').length is 1 \
        and els.parent().parent().filter('.wrapper').length is 1

  describe 'wrapInner', ->

    it 'wraps a structure around all contents', ->
      kernel.expect true, ->
        els = luda('.anchor, .uncle')
        wrapper = '<div class="wrapper"></div>'
        returnValue = els.wrapInner(wrapper)
        htmlOne = '<div class="wrapper">content</div>'
        htmlTwo = '<div class="wrapper"></div>'
        returnValue is els \
        and luda(els.els[0]).html().trim() is htmlOne \
        and luda(els.els[1]).html() is htmlTwo

    it 'supports nested structures', ->
      kernel.expect true, ->
        els = luda('.anchor, .uncle')
        wrapper = '<div class="wrapper"><div class="nested"></div></div>'
        htmlOne = '<div class="wrapper"><div class="nested">content</div></div>'
        htmlTwo = '<div class="wrapper"><div class="nested"></div></div>'
        els.wrapInner(wrapper)
        luda(els.els[0]).html().trim() is htmlOne \
        and luda(els.els[1]).html() is htmlTwo