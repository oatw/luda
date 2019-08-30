import find from './find.coffee'
import matches from '../matches/helpers/matches.coffee'



export default (selector, ctx) ->
  all = find selector, ctx
  all.push ctx if matches ctx, selector
  all