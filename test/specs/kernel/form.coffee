import kernel from '../../page-objects/kernel.coffee'



describe 'form', ->

  beforeEach -> await kernel.open '/form'

  describe 'val', ->

    it 'gets the value of input', ->
      kernel.expect 'text', ->
        luda('.form input[type=text]').val()

    it 'gets the value of input file multiple', ->
      kernel.expect '', ->
        luda('.form input[type=file][multiple]').val()
    
    it 'gets the value of select', ->
      kernel.expect 'selected', ->
        luda('select[name=select]').val()
    
    it 'gets the value of select multiple', ->
      kernel.expect true, ->
        val = luda('select[name=select-multiple]').val()
        val.join(',') is 'option-1,option-2'

    it 'sets the value of input', ->
      kernel.expect true, ->
        el = luda('.form input[type=text]')
        returnValue = el.val(0)
        returnValue is el \
        and luda('.form input[type=text]').val() is 0
    
    it 'sets the value of select', ->
      kernel.expect 'not-selected', ->
        luda('select[name=select]').val('not-selected').val()

    it 'sets the value of select multiple', ->
      kernel.expect true, ->
        luda('select[name=select-multiple]').val(['option-1'])
        valOne = luda('select[name=select-multiple]').val()
        luda('select[name=select-multiple]').val(['option-1', 'option-2'])
        valTwo = luda('select[name=select-multiple]').val()
        valOne.join(',') is 'option-1' \
        and valTwo.join(',') is 'option-1,option-2'
    
    it 'supports setting the value of input to null', ->
      kernel.expect '', ->
        luda('.form input[type=text]').val(null).val()

    it 'supports setting the value of select to null', ->
      kernel.expect true, ->
        luda('select[name=select]').val(null)
        val = luda('select[name=select]').val()
        val is '' or val is 'not-selected'

    it 'supports setting the value of select multiple to null', ->
      kernel.expect '', ->
        luda('select[name=select-multiple]').val(null)
        luda('select[name=select-multiple]').val().join(',')