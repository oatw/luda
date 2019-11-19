import '../kernel/index.coffee'
import '../mixins/tabable.coffee'



luda.component 'carousel'

.protect

  cls:
    tabable:
      active: 'carousel-item-active'
      indicatorActive: 'btn-active'
      prev: 'carousel-item-prev'
      next: 'carousel-item-next'

  data:
    interval: 'carousel-interval'
    tabable:
      interruption: 'data-carousel_interruption'
      wrap: 'data-carousel-wrap'

  default:
    interval: 5000
    tabable:
      activeIndex: 0
      wrap: true

  evt:
    tabable:
      activate: 'luda:carousel:activate'
      activated: 'luda:carousel:activated'
      deactivate: 'luda:carousel:deactivate'
      deactivated: 'luda:carousel:deactivated'

  selector:
    tabable:
      targets: '.carousel-item'
      indicators: '.carousel-indicators .btn'
      prevCtrl: '.carousel-prev'
      nextCtrl: '.carousel-next'

.include luda.mixin('tabable').alias(
  activate: 'tabableActivate'
  next: 'tabableNext'
  prev: 'tabablePrev'
)

.include

  pause: ->
    return unless 'intervaling' of this
    clearTimeout @intervaling
    delete @intervaling
    @nextInterval -= Date.now() - @playAt
    @nextInterval = undefined if @nextInterval <= 10
    @pauseIndex = @tabableActiveIndex()

  play: ->
    return if 'intervaling' of this
    return unless @interval()
    @playAt = Date.now()
    @nextInterval = @interval() unless @pauseIndex is @tabableActiveIndex()
    handler = =>
      @tabableNext()
      @playAt = Date.now()
      @nextInterval = @interval()
      @intervaling = setTimeout handler, @interval()
    @intervaling = setTimeout handler, @nextInterval

.protect luda.mixin('tabable').all()

.protect

  interval: ->
    duration = @root.data @data.interval
    return false if duration is false
    Math.abs(parseInt duration, 10) or @default.interval

  touchendPlay: -> setTimeout => @play()

.help

  find: -> @tabableFind()

  create: ->
    @tabableCreate()
    @play()

  destroy: ->
    @pause()
    @tabableDestroy()

  watch: ->
    watches = @tabableWatch()
    watches.attr.push [@data.interval, @pause, @play]
    watches

  listen: ->
    @tabableListen().concat [
      ['swipeleft', @tabableNextOnEvent]
      ['swiperight', @tabablePrevOnEvent]
      ['touchstart mouseover', @pause]
      ['mouseout', @play]
      ['touchend', @touchendPlay]
    ]