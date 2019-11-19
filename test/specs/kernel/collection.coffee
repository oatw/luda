import kernel from '../../page-objects/kernel.coffee'



describe 'collection', ->

  before -> await kernel.open '/collection'

  describe 'add', ->

    it 'supports selector', ->
      kernel.expect 3, ->
        luda('.child').add('.prev, .next').length
    
    it 'supports DOM node', ->
      kernel.expect true, ->
        added = luda('.child').add(document.body)
        added.length is 2 \
        and added.els[1] is document.body

    it 'supports Luda instances', ->
      kernel.expect 2, ->
        luda('.child').add(luda('.next')).add(luda()).length

    it "doesn't add duplicates", ->
      kernel.expect 5, ->
        luda('.child').add('.sibling').length

  describe 'each', ->

    it 'iterates over elements', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        indexes = []
        els = []
        thats = []
        returnValue = siblings.each (el, index) ->
          indexes.push index
          els.push el
          thats.push this
        returnValue is siblings \
        and indexes.join(',') is '0,1,2,3,4' \
        and els.every((el, index) -> el is siblings.get(index)) \
        and thats.every((el, index) -> el is siblings.get(index))

    it 'supports break when return false', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        indexes = []
        siblings.each (el, index) ->
          indexes.push index
          return false if index is 0
        indexes.join(',') is '0'

  describe 'eq', ->

    it 'gets the element at index', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        length = siblings.length
        finalIndex = NaN
        siblings.each (el, index) ->
          equal = siblings.eq(index).els[0] is siblings.els[index]
          if equal
            finalIndex = index
          else
            false
        finalIndex is length - 1

  describe 'filter', ->

    it 'supports selector', ->
      kernel.expect 2, ->
        luda('.sibling').filter('.prev, .next').length

    it 'supports DOM node', ->
      kernel.expect true, ->
        child = luda('.child')
        siblings = luda('.sibling')
        filtered = siblings.filter(child.els[0])
        filtered.length is 1 \
        and filtered.els[0] is child.els[0]

    it 'supports function', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        indexes = []
        els = []
        thats = []
        filtered = siblings.filter (el, index) ->
          indexes.push index
          els.push el
          thats.push this
          Boolean index
        indexes.join(',') is '0,1,2,3,4' \
        and els.every((el, index) -> el is siblings.get(index)) \
        and thats.every((el, index) -> el is siblings.get(index)) \
        and filtered.els.every (el, index) ->
          el is siblings.slice(1).get(index)

  describe 'first', ->

    it 'gets a collection containing the first element', ->
      kernel.expect true, ->
        luda('.sibling').first().hasClass('prevprev')

  describe 'get', ->

    it 'gets a single element', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        length = siblings.length
        finalIndex = NaN
        siblings.each (el, index) ->
          equal = siblings.get(index) is siblings.els[index]
          if equal
            finalIndex = index
          else
            false
        finalIndex is length - 1

    it 'gets all elements', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        arr = siblings.get()
        Array.isArray(arr) \
        and arr.length is 5 \
        and arr.every((el, index) -> el is siblings.els[index])

  describe 'has', ->

    it 'filter out elements not containing the selector', ->
      kernel.expect true, ->
        els = luda('.grandparent').children()
        els.has('.sibling').length is 1 \
        and els.has('div').length is 1 \
        and els.has('.foo').length is 0

  describe 'index', ->

    it 'gets index of collection element', ->
      kernel.expect 2, ->
        luda('.child').index()

    it 'gets index of selector', ->
      kernel.expect 2, ->
        luda('.sibling').index('.child')

  describe 'is', ->

    it 'checks if the collection matches a selector', ->
      kernel.expect true, ->
        child = luda('.child')
        child.is('div') is true \
        and child.is('foo, div') is true \
        and child.is('.child') is true \
        and child.is(child) is true \
        and child.is(luda('div')) is true \
        and child.is() is false \
        and child.is(luda('#foo')) is false
  
  describe 'last', ->

    it 'gets a collection containing the last element', ->
      kernel.expect true, ->
        luda('.sibling').last().hasClass('nextnext')

  describe 'map', ->

    it 'maps over elements', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        body = document.body
        indexes = []
        els = []
        thats = []
        mapped = siblings.map (el, index) ->
          indexes.push index
          els.push el
          thats.push this
          body
        indexes.join(',') is '0,1,2,3,4' \
        and els.every((el, index) -> el is siblings.get(index)) \
        and thats.every((el, index) -> el is siblings.get(index)) \
        and mapped.els.every((el, index) -> el is body)

  describe 'not', ->

    it 'filters by negating a comparator', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        siblings.not().length is 5 \
        and siblings.not('div').length is 0 \
        and siblings.not('.child').length is 4 \
        and siblings.not('.prev, .next').length is 3 \
        and siblings.not(siblings.els[0]).length is 4
  
  describe 'slice', ->

    it 'gets a slice', ->
      kernel.expect true, ->
        siblings = luda('.sibling')
        siblings.slice(2).length is 3 \
        and siblings.slice(2, 3).length is 1 \
        and siblings.slice(2, 3).els[0] is siblings.get(2) \
        and siblings.slice(-1).els[0] is siblings.get(4)