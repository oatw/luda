import kernel from '../../page-objects/kernel.coffee'



describe 'traversal', ->

  before -> await kernel.open '/traversal'

  describe 'children', ->

    it 'gets the children', ->
      kernel.expect 5, ->
        luda('.parent').children().length
    
    it 'supports filtering by a selector', ->
      kernel.expect 2, ->
        luda('.parent').children('.prev, .next').length

  describe 'closest', ->

    it 'finds the first matching element in the collection', ->
      kernel.expect true, ->
        child = luda('.child')
        child.closest('*').els[0] is child.els[0]

    it 'finds the first matching element walking the tree upwards', ->
      kernel.expect true, ->
        parent = luda('.parent')
        luda('.child').closest('.parent').els[0] is parent.els[0]

    it "doesn't throw if no argument is found", ->
      kernel.expect true, ->
        luda('.child').closest().length is 0 \
        and luda('.child').closest('aaa').length is 0
  
  describe 'contents', ->

    it 'gets the children, including text and comments', ->
      kernel.expect 13, ->
        luda('.parent').contents().length

  describe 'find', ->

    it 'gets elements in subtree', ->
      kernel.expect true, ->
        grandparent = luda('.grandparent')
        grandparent.find('*').length is 8 \
        and grandparent.find('.sibling').length is 5

  describe 'next', ->

    it 'gets the next sibling', ->
      kernel.expect true, ->
        luda('.child').next().els[0] is luda('.next').els[0]

    it 'supports multiple elements', ->
      kernel.expect true, ->
        anchors = luda('.child, .prevprev')
        next = luda('.prev, .next')
        anchors.next().els.every (el, index) ->
          el is next.get(index)
    
    it 'supports selector', ->
      kernel.expect true, ->
        child = luda('.child')
        next = luda('.next')
        child.next('.next').els[0] is next.els[0] \
        and child.next('foo').length is 0
  
  describe 'nextAll', ->

    it 'gets all the next siblings', ->
      kernel.expect true, ->
        anchor = luda('.child')
        next = luda('.next')
        nextnext = luda('.nextnext')
        nexts = anchor.nextAll()
        nexts.length is 2 \
        and nexts.els[0] is next.els[0] \
        and nexts.els[1] is nextnext.els[0]
    
  describe 'parent', ->

    it 'gets the parent', ->
      kernel.expect true, ->
        child = luda('.child')
        parent = luda('.parent')
        child.parent().els[0] is parent.els[0]
    
    it 'supports selector', ->
      kernel.expect true, ->
        child = luda('.child')
        parent = luda('.parent')
        child.parent('.parent').els[0] is parent.els[0] \
        and child.parent('foo').length is 0

    it "doesn't throw if there's no parent", ->
      kernel.expect true, ->
        luda().parent().length is 0 \
        and luda('<div>').parent().length is 0
  
  describe 'parents', ->

    it 'gets all parents', ->
      kernel.expect 6, ->
        luda('.child').parents().length
    
    it 'stops at <html>', ->
      kernel.expect true, ->
        html = luda('.child').parents().last().els[0]
        html is document.documentElement

    it 'supports filtering by a selector', ->
      kernel.expect 2, ->
        luda('.child').parents('.grandparent, body').length

  describe 'prev', ->

    it 'gets the previous sibling', ->
      kernel.expect true, ->
        luda('.child').prev().els[0] is luda('.prev').els[0]
    
    it 'supports multiple elements', ->
      kernel.expect true, ->
        anchors = luda('.child, .nextnext')
        prev = luda('.prev, .next')
        anchors.prev().els.every (el, index) ->
          el is prev.get(index)
    
    it 'supports selector', ->
      kernel.expect true, ->
        child = luda('.child')
        prev = luda('.prev')
        child.prev('.prev').els[0] is prev.els[0] \
        and child.prev('foo').length is 0
  
  describe 'prevAll', ->

    it 'gets all the previous siblings', ->
      kernel.expect true, ->
        anchor = luda('.child')
        prev = luda('.prev')
        prevprev = luda('.prevprev')
        prevs = anchor.prevAll()
        prevs.length is 2 \
        and prevs.els[0] is prev.els[0] \
        and prevs.els[1] is prevprev.els[0]
  
  describe 'siblings', ->

    it 'gets the siblings', ->
      kernel.expect true, ->
        child = luda('.child')
        siblings = luda('.sibling').not(child)
        child.siblings().els.every (el, index) ->
          el is siblings.get(index)

    it 'supports multiple elements in the collection', ->
      kernel.expect true, ->
        els = luda('.child, .next')
        siblings = luda('.parent').children()
        els.siblings().length is siblings.length \
        and els.siblings().not(siblings).length is 0
    
    it 'supports selector', ->
      kernel.expect true, ->
        child = luda('.child')
        siblings = luda('.sibling').not(child)
        surrounding = luda('.prev, .next')
        matchedOne = child.siblings('.prev, .next').els.every (el, index) ->
          el is surrounding.get(index)
        matchedTwo = child.siblings('*').els.every (el, index) ->
          el is child.siblings().get(index)
        matchedOne and matchedTwo and child.siblings('foo').length is 0