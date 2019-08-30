import utility from '../../page-objects/utility.coffee'



describe 'border', ->

  it 'style', ->
    await utility.open '/border'
    await utility.checkElement()