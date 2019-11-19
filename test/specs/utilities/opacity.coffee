import utility from '../../page-objects/utility.coffee'



describe 'opacity', ->

  it 'style', ->
    await utility.open '/opacity'
    await utility.checkElement()