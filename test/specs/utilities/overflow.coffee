import utility from '../../page-objects/utility.coffee'



describe 'overflow', ->

  it 'style', ->
    await utility.open '/overflow'
    await utility.checkElement()