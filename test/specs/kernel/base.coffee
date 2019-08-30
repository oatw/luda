import kernel from '../../page-objects/kernel.coffee'



describe 'kernel', ->

  before -> await kernel.open '/base'

  it 'luda() instanceof Luda', ->
    kernel.expect 'Luda', ->
      luda().constructor.name

  describe 'plugins', ->

    it 'supports including instance attributes', ->
      kernel.expect 'hello', ->
        luda.include({word: 'hello'})
        .include('word', 'morning')
        .include('word', 'goodbye')
        luda().word

    it 'supports extending static attributes', ->
      kernel.expect 'hello', ->
        luda.extend({word: 'hello'})
        .extend('word', 'morning')
        .extend('word', 'goodbye')
        luda.word
  
  describe 'selector', ->

    it 'supports falsy values', ->
      kernel.expect true, ->
        luda().length is 0 \
        and luda(0).length is 0 \
        and luda('').length is 0 \
        and luda(undefined).length is 0 \
        and luda(null).length is 0

    it 'supports id', ->
      kernel.expect 2, ->
        luda('#id').length

    it 'supports non-existent id', ->
      kernel.expect 0, ->
        luda('#foo').length

    it 'supports class', ->
      kernel.expect true, ->
        luda('.single').length is 1 \
        and luda('.multiple').length is 2

    it 'supports non-existent class', ->
      kernel.expect 0, ->
        luda('.foo').length

    it 'supports tag', ->
      kernel.expect true, ->
        luda('html').length is 1 \
        and luda('main').length is 2

    it 'supports non-existent tag', ->
      kernel.expect 0, ->
        luda('foo').length

    it 'supports DOM node', ->
      kernel.expect true, ->
        body = luda(document.body)
        body.length is 1 \
        and body.els[0] is document.body

    it 'supports array of DOM nodes', ->
      kernel.expect true, ->
        els = luda([document.documentElement, document.body])
        els.length is 2 \
        and els.els[0] is document.documentElement \
        and els.els[1] is document.body

    it 'supports NodeList', ->
      kernel.expect true, ->
        multiple = document.querySelectorAll('.multiple')
        els = luda(multiple)
        els.length is multiple.length \
        and els.els.every (el, index) -> el is multiple[index]

    it 'supports HTMLCollection', ->
      kernel.expect true, ->
        multiple = document.getElementsByClassName('.multiple')
        els = luda(multiple)
        els.length is multiple.length \
        and els.els.every (el, index) -> el is multiple[index]

    it 'supports HTML string', ->
      kernel.expect 1, ->
        luda('<div class="html"><p>paragraph</p></div>').length

    it 'supports Luda instances', ->
      kernel.expect true, ->
        el = luda(luda(document.body))
        el.length is 1 \
        and el.els[0] is document.body

  describe 'context', ->

    it 'supports a DOM node', ->
      kernel.expect true, ->
        context = luda('<div><div class="subcontext"></div></div>')
        luda('.subcontext').length is 0 \
        and luda('.subcontext', context.els[0]).length is 1
    
    it 'supports a Luda instance', ->
      kernel.expect true, ->
        context = luda('<div><div class="subcontext"></div></div>')
        luda('.subcontext').length is 0 \
        and luda('.subcontext', context).length is 1
    
    it 'supports a document', ->
      kernel.expect true, ->
        docStr = 'http://www.w3.org/1999/xhtml'
        doc = document.implementation.createDocument(docStr, 'html', null)
        el = luda('<p id="foo">').els[0]
        luda(doc.documentElement).append(el)
        luda('#foo', doc).els[0] is el