import luda from '../base/luda.coffee'
import getDurations from './helpers/get-durations.coffee'



luda.include

  transitionDuration: ->
    return unless el = @els[0]
    styles = window.getComputedStyle el
    length = styles.transitionProperty.split(',').length
    return 0 unless length
    delays = getDurations styles.transitionDelay, length
    durations = getDurations styles.transitionDuration, length
    finalDurations = durations.map (duration, index) -> duration + delays[index]
    Math.max.apply null, finalDurations