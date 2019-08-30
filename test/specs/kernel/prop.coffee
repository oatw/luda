import kernel from '../../page-objects/kernel.coffee'



describe 'prop', ->

  before -> await kernel.open '/prop'

  describe 'prop', ->

    it 'is chainable', ->
      kernel.expect true, ->
        el = luda('#el')
        el.prop('pp', 'pp') is el

    it 'gets property', ->
      kernel.expect true, ->
        luda('#el').prop('checked') is true \
        and luda('#el').prop('disabled') is false

    it 'sets property', ->
      kernel.expect true, ->
        luda('#el')
        .prop('checked', false)
        .prop('disabled', true)
        luda('#el').prop('checked') is false \
        and luda('#el').prop('disabled') is true

    it 'supports setting properites in an object', ->
      kernel.expect true, ->
        luda('#el').prop
          checked: true
          disabled: false
        luda('#el').prop('checked') is true \
        and luda('#el').prop('disabled') is false

    it 'supports custom property', ->
      kernel.expect 3, ->
        luda('#el')
        .prop('custom-prop', 3)
        .prop('custom-prop')
    
    it 'supports no arguments', ->
      kernel.expect 'passed', ->
        luda('#el').prop()
        'passed'
    
  describe 'removeProp', ->

    it 'supports removing single property', ->
      kernel.expect true, ->
        luda('#el')
        .prop('custom-prop-two', 6)
        .removeProp('custom-prop-two')
        .prop('custom-prop-two') is undefined

    it 'supports removing multiple properties', ->
      kernel.expect true, ->
        luda('#el')
        .prop({'custom-a': 'a', 'custom-b': 'b'})
        .removeProp('custom-a custom-b')
        luda('#el').prop('custom-a') is undefined \
        and luda('#el').prop('custom-b') is undefined