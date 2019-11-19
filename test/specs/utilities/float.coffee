import utility from '../../page-objects/utility.coffee'



describe 'float', ->

  it 'style', ->
    await utility.open '/float'
    await utility.checkElement()