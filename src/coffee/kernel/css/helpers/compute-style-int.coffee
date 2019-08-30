import computeStyle from './compute-style.coffee'



export default (el, prop) -> parseInt(computeStyle(el, prop), 10) or 0