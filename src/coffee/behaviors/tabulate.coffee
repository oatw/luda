import '../kernel/index.coffee'



luda.component 'tabulate', document

.protect

  selector: 'input[type=radio]:not([disabled])'

.protect

  disabled: -> @html.data('tabulate') is false

.protect

  findSiblings: (radio) ->
    selector = @selector
    selector = "#{selector}[name=#{name}]" if name = radio.name
    radios = luda(selector).els.filter (el) -> el.tabIndex >= 0
    index = radios.indexOf radio
    prev: radios[index - 1]
    next: radios[index + 1]

  trigger: (e) ->
    return if @disabled()
    if e.shiftKey
      if prev = @findSiblings(e.target).prev
        e.preventDefault()
        prev.focus()
    else
      if next = @findSiblings(e.target).next
        e.preventDefault()
        next.focus()

.help

  listen: ->
    [
      ['keydown@tab', @selector, @trigger]
    ]