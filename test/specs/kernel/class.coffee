import kernel from '../../page-objects/kernel.coffee'



describe 'class', ->

  before -> await kernel.open '/class'

  describe 'addClass', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.addClass('chain') is el

    it 'supports single class', ->
      kernel.expect true, ->
        luda('#el')
        .addClass('btn-primary')
        .hasClass('btn-primary')

    it 'supports multiple classes', ->
      kernel.expect true, ->
        luda('#el').addClass('btn-large btn-fluid')
        luda('#el').hasClass('btn-large') \
        and luda('#el').hasClass('btn-fluid')

    it "doesn't add duplicates", ->
      kernel.expect 1, ->
        luda('#el')
        .addClass('btn-large btn-fluid d-none')
        .addClass('d-none btn-fluid btn-large')
        luda('#el').els[0].className.match(/btn-large/g).length

    it "doesn't throw on falsy values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .addClass(0)
        .addClass('')
        .addClass(' ')
        .addClass(undefined)
        .addClass(null)
        'passed'

    it "doesn't throw on number values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .addClass(1.1)
        .addClass(3)
        .addClass(Infinity)
        .addClass(NaN)
        'passed'

  describe 'hasClass', ->

    it 'supports single class', ->
      kernel.expect true, ->
        luda('#el').hasClass('btn-primary')
      kernel.expect false, ->
        luda('#el').hasClass('btn-hollow-primary')
    
    it 'supports special characters', ->
      kernel.expect true, ->
        luda('#el')
        .addClass('aa$bb')
        .hasClass('aa$bb')
    
    it "doesn't throw on falsy values", ->
      kernel.expect 'passed', ->
        luda('#el').hasClass(0)
        luda('#el').hasClass('')
        luda('#el').hasClass(undefined)
        luda('#el').hasClass(null)
        'passed'
    
    it "doesn't throw on number values", ->
      kernel.expect 'passed', ->
        luda('#el').hasClass(1.1)
        luda('#el').hasClass(3)
        luda('#el').hasClass(Infinity)
        luda('#el').hasClass(NaN)
        'passed'

  describe 'removeClass', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.removeClass('chain') is el

    it 'supports single class', ->
      kernel.expect false, ->
        luda('#el')
        .removeClass('btn-primary')
        .hasClass('btn-primary')

    it 'supports multiple classes', ->
      kernel.expect false, ->
        luda('#el')
        .addClass('btn-primary')
        .removeClass('btn-primary btn-fluid')
        luda('#el').hasClass('btn-primary') \
        and luda('#el').hasClass('btn-fluid')
      
    it 'supports removing all classes', ->
      kernel.expect false, ->
        luda('#el')
        .removeClass()
        .addClass('aa bb')
        .removeClass('aa bb')
        luda('#el').hasClass('aa') \
        and luda('#el').hasClass('bb')

    it 'supports special characters', ->
      kernel.expect false, ->
        luda('#el')
        .addClass('aa$bb')
        .removeClass('aa$bb')
        .hasClass('aa$bb')
      
    it "doesn't throw on falsy values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .removeClass(0)
        .removeClass('')
        .removeClass(' ')
        .removeClass(undefined)
        .removeClass(null)
        'passed'
    
    it "doesn't throw on number values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .removeClass(1.1)
        .removeClass(3)
        .removeClass(Infinity)
        .removeClass(NaN)
        'passed'

  describe 'toggleClass', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.toggleClass('chain') is el

    it 'supports adding', ->
      kernel.expect true, ->
        luda('#el')
        .removeClass()
        .toggleClass('added')
        .hasClass('added')

    it 'supports force adding', ->
      kernel.expect true, ->
        luda('#el')
        .toggleClass('force', true)
        .hasClass('force')

    it 'supports removing', ->
      kernel.expect false, ->
        luda('#el')
        .toggleClass('added')
        .hasClass('added')

    it 'supports force removing', ->
      kernel.expect false, ->
        luda('#el')
        .toggleClass('force', false)
        .hasClass('force')
    
    it 'supports adding multiple classes', ->
      kernel.expect true, ->
        luda('#el')
        .toggleClass('multiple-a multiple-b')
        luda('#el').hasClass('multiple-a') \
        and luda('#el').hasClass('multiple-b')

    it 'supports removing multiple classes', ->
      kernel.expect false, ->
        luda('#el')
        .toggleClass('multiple-a multiple-b')
        luda('#el').hasClass('multiple-a') \
        and luda('#el').hasClass('multiple-b')

    it 'supports adding special characters', ->
      kernel.expect true, ->
        luda('#el')
        .removeClass()
        .toggleClass('aa$bb')
        .hasClass('aa$bb')

    it 'supports removing special characters', ->
      kernel.expect false, ->
        luda('#el')
        .toggleClass('aa$bb')
        .hasClass('aa$bb')

    it "doesn't throw on falsy values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .toggleClass(0)
        .toggleClass('')
        .toggleClass(' ')
        .toggleClass(undefined)
        .toggleClass(null)
        'passed'
    
    it "doesn't throw on number values", ->
      kernel.expect 'passed', ->
        luda('#el')
        .toggleClass(1.1)
        .toggleClass(3)
        .toggleClass(Infinity)
        .toggleClass(NaN)
        'passed'