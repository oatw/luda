---
title: Kernel Engine API
order: 4
description: The reference of Luda kernel engine API. 
---

## Custom Types

```bash
@typedef {Object} Luda

@typedef {Object} LudaInstance

@typedef {document | Element | LudaInstance} LudaContext

@typedef {string | document | window | Element
         | NodeList | HTMLCollection | LudaInstance} LudaSelector

@typedef {string | document | window | Element
         | Function | LudaInstance} LudaComparator

@typedef {Object} LudaComponent
- Component class objects.

@typedef {Object} LudaComponentProperty
- Property and method definitions of LudaComponentInstances.

@typedef {Object} LudaComponentHelper
- Method definitions help to handle lifecycles of LudaComponentInstances,
  bind event listeners to instances and watch instance dom changes.

@typedef {Object} LudaComponentInstance
- Instances created by LudaComponents.

@typedef {Proxy}  LudaComponentProxy
- Proxy objects help to access public properties and methods of
  LudaComponents and LudaComponentInstances.

@typedef {Object} LudaMixin
- Reusable code snippets across multiple LudaComponents.

@typedef {Object} LudaMixinConfig
- Property and method definitions of LudaMixinInstances.

@typedef {Object} LudaMixinInstance
- Instances created by LudaMixin.
```

## Luda Static Methods

### Loger

#### .log (arg1, arg2, ...)

```bash
@param {*} [arg1, arg2, ...]
@returns {boolean | undefined}
```

```javascript
// @example Check if luda log is opened.
luda.log()
// @example Toggle luda log according to an environment variable.
luda.log(process.env.NODE_ENV === 'development')
// @example Print logs to dev tool console if luda log is opened.
luda.log('Ready to do something using data:', {name: 'Luda'})
```

### Mounter

#### .extend (name, value)

```bash
@param {Object | string} name
@param {*} [value]
@returns {Luda}
```

```javascript
// @example Add a static method to Luda.
luda.extend('sayHi', function(name){
  alert(name)
  return this
})
// @example Add multiple static properties to Luda
luda.extend({
  CONSTANT: 'Hello Luda!',
  sayHi: function(name){
    alert(name)
    return this
  }
})
```

#### .include (name, value)

```bash
@param {Object | string} name
@param {*} [value]
@returns {Luda}
```

```javascript
// @example Add a instance method to Luda.
luda.include('reverse', function(){
  this.els = this.els.reverse()
  return this
})
// @example Add multiple instance properties to Luda
luda.include({
  CONSTANT: 'Hello Luda!',
  reverse: function(){
    this.els = this.els.reverse()
    return this
  }
})
```

### Ready

#### .ready (callback)

```bash
@param {Function} callback
@returns {Luda}
```

```javascript
// @example Do something immediately after DomContentLoaded.
luda.ready(function(){
  console.log('document ready')
})
```

### Others

#### .arrayEqual (arrOne, arrTwo, compareOrder)

```bash
@param {Array} arrOne
@param {Array} arrTwo
@param {boolean} compareOrder
@returns {boolean}
```

```javascript
// @example Compare if two array have the same members.
luda.arrayEqual([1, 2, 3], [3, 2, 1])
// @example Compare if two array have the same members
// and the members' orders are the same.
luda.arrayEqual([1, 2, 3], [3, 2, 1], true)
```

#### .camelCase (string)

```bash
@param {string} string
@returns {string}
```

```javascript
// @example Convert a dash case string into camel case.
luda.camelCase('hello-luda')
```

#### .dashCase (string)

```bash
@param {string} string
@returns {string}
```

```javascript
// @example Convert a camel case string into dash case.
luda.dashCase('helloLuda')
```

#### .guid ()

```bash
@returns {integer}
```

```javascript
// @example Get a global unique id number.
luda.guid()
```

#### .isArray (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is an array.
luda.isArray([1, 2])
```

#### .isBool (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is a boolean.
luda.isBool(true)
```

#### .isElement (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is a html element.
luda.isElement(document.body)
```

#### .isFunction (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is a function.
luda.isFunction(function(){})
```

#### .isObject (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is an object.
luda.isObject({name: 'Luda'})
```

#### .isNumeric (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is a number.
luda.isNumberic(1)
```

#### .isString (arg)

```bash
@param {*} arg
@returns {boolean}
```

```javascript
// @example Check if the input argument is a string.
luda.isString('Luda')
```

#### .pluck (source, property, deep, filter)

```bash
@param {Object | Array} source
@param {string} property
@param {boolean} [deep = false]
@param {Function} [filter]
@returns {Array}
```

```javascript
// @example Pluck objects deeply in an object.
luda.pluck({
  name: 'Jim',
  son: {
    name: 'Jacky',
    son: {
      name: 'Jerry'
    }
  }
}, 'son', true)
// @example Pluck objects deeply in an object with a filter.
luda.pluck({
  name: 'Jim',
  son: {
    name: 'Tim',
    son: {
      name: 'Lucus',
      son: {
        name: 'Thomas'
      }
    }
  }  
}, 'son', true, function (son) {
  return son.name.length > 3
})
```

#### .unique (arr)

```bash
@param {Array} arr
@returns {Array}
```

```javascript
// @example Get an array not contains duplicated memebers.
luda.unique([1, 1, 2, 2])
```

## Luda Constructor

### luda (selector, context)

```bash
@param {LudaSelector} selector
@param {LudaContext} [context = document]
@returns {LudaInstance}
```

```javascript
// @example Use a css selector to create a LudaInstance.
luda('.example')
// @example Use html strings to create a LudaInstance.
luda('<p class="example">example</p>')
// @example Use a LudaInstance to create a LudaInstance.
luda(luda('.example'))
// @example Use window to create a LudaInstance.
luda(window)
// @example Use document to create a LudaInstance.
luda(document)
// @example Use an element to create a LudaInstance.
luda(document.body)
// @example Use an element collection to create a LudaInstance.
luda(document.getElementsByTagName('p'))
```

## Luda Instance Properties

### .els

```bash
@prop {Array} els
```

```javascript
// @example Get all the collected elements in an array.
luda('.example').els
```

### .length

```bash
@prop {integer} length
```

```javascript
// @example Get the length of collected elements.
luda('.example').length
luda('.example').length === luda('.example').els.length // true
```

## Luda Instance Methods

### Attribute

#### .attr (attribute, value)

```bash
@param {Object | string} attribute
@param {Object | string | number | boolean | null} [value]
@returns {LudaInstance | Object | string | number | boolean | undefined}
```

```javascript
// @example Get an element's attribute.
luda('#example').attr('name')
// @example Set elements' attribute.
luda('.example').attr('name', 'luda')
// @example Set elements' attributes.
luda('.example').attr({name: 'luda', age: 2})
// @example Remove elements' attribute.
luda('.example').attr('name', null)
```

#### .hasAttr (attribute)

```bash
@param {string} attribute
@returns {boolean}
```

```javascript
// @example Check if an element has a specific attribute.
luda('#example').hasAttr('name')
```

#### .removeAttr (attribute)

```bash
@param {string} attribute
@returns {LudaInstance}
```

```javascript
// @example Remove elements' attribute.
luda('.example').removeAttr('name')
// @example Remove elements' attributes.
luda('.example').removeAttr('name age')
```

### Cache

#### .cache (name, value)

```bash
@param {Object | string} [name]
@param {*} [value]
@returns {LudaInstance | *}
```

```javascript
// @example Get an element's cached data.
luda('#example').cache('pathes')
// @example Get all the cached data of an element.
luda('#example').cache()
// @example Cache data for an element.
luda('#example').cache('pathes', ['/home', '/about'])
luda('#example').cache({pathes: ['/home', '/about'], availiable: true})
// @example Remove cached data.
luda('#example').cache('pathes', null)
````

#### .removeCache (name)

```bash
@param {string} [name]
@returns {LudaInstance}
```

```javascript
// @example Remove cached data by passing in a name.
luda('#example').removeCache('pathes')
// @example Remove all cached data.
luda('#example').removeCache()
```

### Class

#### .addClass (name)

```bash
@param {string} name
@returns {LudaInstance}
```

```javascript
// @example Add element's css class.
luda('.example').addClass('class-one')
// @example Add element's css classes.
luda('.example').addClass('class-one class-two')
```

#### .hasClass (name)

```bash
@param {string} name
@returns {boolean}
```

```javascript
// @example Check if an element has a specific css class.
luda('#example').hasClass('class-one')
```

#### .removeClass (name)

```bash
@param {string} [name]
@returns {LudaInstance}
```

```javascript
// @example Remove elements' css class.
luda('.example').removeClass('class-one')
// @example Remove elements' css classes.
luda('.example').removeClass('class-one class-two')
// @example Remove elements' all css classes.
luda('.example').removeClass()
```

#### .toggleClass (name, force)

```bash
@param {string} name
@param {boolean} [force]
@returns {LudaInstance}
```

```javascript
// @example Toggle element's css class.
luda('.example').toggleClass('class-one')
// @example Toggle elements' css classes.
luda('.example').toggleClass('class-one class-two')
// @example Add element's css class.
luda('.example').toggleClass('class-one', true)
// @example Add element's css classes.
luda('.example').toggleClass('class-one class-two', true)
// @example Remove element's css class.
luda('.example').toggleClass('class-one', false)
// @example Remove element's css classes.
luda('.example').toggleClass('class-one class-two', false)
```

### Collection

#### .add (selector, context)

```bash
@param {LudaSelector} selector
@param {LudaContext} [context = document]
@returns {LudaInstance}
```

```javascript
// @example Add elements to a LudaInstance.
luda('#example').add('.example')
```

#### .each (func)

```bash
@param {Function} func
@returns {LudaInstance}
```

```javascript
// @example Do something to each element of a LudaInstance.
luda('.example').each(function(el, index){
  console.log(this === el) // true
})
// @example Stop looping when return false.
luda('.example').each(function(el, index){
  if(index === 2){
    return false
  }
})
```

#### .eq (index)

```bash
@param {integer} [index]
@returns {LudaInstance}
```

```javascript
// @example Create a LudaInstance
// which contains the first element of an existed LudaInstance.
luda('.example').eq(0)
// @example Create a LudaInstance
// which contains all the elements of an existed LudaInstance.
luda('.example').eq()
```

#### .filter (comparator)

```bash
@param {LudaComparator} comparator
@returns {LudaInstance}
```

```javascript
// @example Collect the .appended elements in the LudaInstance.
luda('.example').filter('.appended')
// @example Collect the elements contained in both instances.
luda('.example').filter(luda('.appended'))
// @example Collect elements which make the function return true.
luda('.example').filter(function(el, index){
  console.log(this === el) // true
  return index > 2
})
```

#### .first ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Create a new LudaInstance
// which contains the first element of an existed LudaInstance.
luda('.example').first()
```

#### .get (index)

```bash
@param {integer} [index]
@returns {Element | Array}
```

```javascript
// @example Get the first element of a LudaInstance.
luda('.example').get(0)
// @example Get the last element of a LudaInstance.
luda('.example').get(-1)
// @example Get all the elements of a LudaInstance.
luda('.example').get()
```

#### .has (selector)

```bash
@param {string | Element} selector
@returns {LudaInstance}
```

```javascript
// @example Create a new LudaInstance contains elements
// which have .descendant descendants.
luda('.example').has('.descendant')
// @example Create a new LudaInstance contains elements
// which have a specific descendant.
luda('.example').has(document.getElementById('descendant'))
```

#### .index (selector)

```bash
@param {LudaSelector} [selector]
@returns {integer}
```

```javascript
// @example Get the index of an element in its parent node's children.
luda('#example').index()
// @example Get the index of an element in a LudaInstance's elements.
luda('.example').index('#example')
```

#### .is (comparator)

```bash
@param {LudaComparator} comparator
@returns {boolean}
```

```javascript
// @example Check if any elements of a LudaInstance match a selector.
luda('#example').is('.example')
// @example Check if a LudaInstance contains a specific element.
luda('#example').is(document.getElementById('example'))
// @example Check if a LudaInstance contains any elements of another LudaInstance.
luda('#example').is(luda('.example'))
// @example Check if any elements of a LudaInstance match a specifc rule.
luda('#example').is(function(el, index){
  return el.value === 'value'
})
```

#### .last ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Create a new LudaInstance
// which contains the last element of an existed LudaInstance.
luda('.example').last()
```

#### .map (func)

```bash
@param {Function} func
@returns {LudaInstance}
```

```javascript
// @example Create a new LudaInstance by
// mapping an existed LudaInstance under a rule.
luda('.example').map(function(el, index){
  console.log(this === el) // true
  return el.parentNode
})
```

#### .not (comparator)

```bash
@param {LudaComparator} comparator
@returns {LudaInstance}
```

```javascript
// @example Collect the elements not match the .appended selector.
luda('.example').not('.appended')
// @example Collect the elements not contained in the latter instance.
luda('.example').not(luda('.appended'))
// @example Collect elements which make the function return false.
luda('.example').not(function(el, index){
  console.log(this === el) // true
  return index > 2
})
```

#### .slice (beginIndex, endIndex)

```bash
@param {integer} [beginIndex]
@param {integer} [endIndex]
@returns {LudaInstance}
```

```javascript
// @example Collect the elements whose index is equal to or greater than 0
// and less than 2.
luda('.example').slice(0, 2)
// @example Collect the elements whose index is equal to or greater than 1.
luda('.example').slice(1)
// @example Collect all the elements of an existed LudaInstance.
luda('.example').slice()
```

### CSS

#### .css (property, value)

```bash
@param {Object | string} property
@param {string} [value]
@returns {LudaInstance | string | undefined}
```

```javascript
// @example Get the computed font-size of an element.
luda('#example').css('font-size')
// @example Set the font-size of an element.
luda('#example').css('font-size', '2rem')
// @example Set css properties of an element.
luda('#example').css({fontSize: '2rem', color: 'black'})
```

#### .removeCss (property)

```bash
@param {string} property
@returns {LudaInstance}
```

```javascript
// @example Remove setted font-size style of an element.
luda('#example').removeCss('font-size')
```

### Data

#### .data (name, value)

```bash
@param {Object | string} [name]
@param {*} [value]
@returns {LudaInstance | *}
```

```javascript
// @example Get the value of an element's data-inited-routes attribute.
luda('#example').data('inited-routes')
// @example Collect all the data attributes of an element in an object.
luda('#example').data()
// @example Set the data-inited-routes attribute of an element.
luda('#example').data('inited-routes', ['/home', '/about'])
// @example Set an element's data attributes with an object.
luda('#example').data({initedRoutes: ['/home', '/about'], availiable: true})
// @example Remove an element's data-inited-routes attribute.
luda('#example').cache('inited-routes', null)
````

#### .hasData (name)

```bash
@param {string} name
@returns {boolean}
```

```javascript
// @example Check if an element has a specific data attribute.
luda('#example').hasData('inited-routes')
```

#### .removeData (name)

```bash
@param {string} name
@returns {LudaInstance}
```

```javascript
// @example Remove a specific data attribute from an element.
luda('#example').removeData('inited-routes')
// @example Remove specific data attributes from an element.
luda('#example').removeData('inited-routes availiable')
// @example Remove all the data attributes from an element.
luda('#example').removeData()
```

### Dimension

#### .innerHeight ()

```bash
@returns {number}
```

```javascript
// @example Get an element's clientHeight(content + paddings) in px.
luda('#example').innerHeight()
// @example Get window's innerHeight(browser viewport height) in px.
luda(window).innerHeight()
```

#### .innerWidth ()

```bash
@returns {number}
```

```javascript
// @example Get an element's clientWidth(content + paddings) in px.
luda('#example').innerWidth()
// @example Get window's innerWidth(browser viewport width) in px.
luda(window).innerWidth()
```

#### .outerHeight (includeMargin)

```bash
@param {boolean} [includeMargin]
@returns {number}
```

```javascript
// @example Get an element's offsetHeight(content + paddings + borders) in px.
luda('#example').outerHeight()
// @example Get an element's offsetHeight plus marginTop and marginBottom in px.
luda('#example').outerHeight(true)
// @example Get window's outerHeight(the whole height of browser window,
// including scrollbar, resizing handles...) in px.
luda(window).outerHeight()
```

#### .outerWidth (includeMargin)

```bash
@param {boolean} [includeMargin]
@returns {number}
```

```javascript
// @example Get an element's offsetWidth(content + paddings + borders) in px.
luda('#example').outerWidth()
// @example Get an element's offsetWidth plus marginLeft and marginRight in px.
luda('#example').outerWidth(true)
// @example Get window's outerWidth(the whole width of browser window,
// including scrollbar, resizing handles...) in px.
luda(window).outerWidth()
```

#### .height (value)

```bash
@param {number} [value]
@returns {LudaInstance | number}
```

```javascript
// @example Get an element's content height in px.
luda('#example').height()
// @example Get window's outerHeight(the whole height of browser window,
// including scrollbar, resizing handles...) in px.
luda(window).height()
// @example Set an element's content height or offsetHeight(border-box) in px.
luda('#example').height(1000)
```

#### .width (value)

```bash
@param {number} [value]
@returns {LudaInstance | number}
```

```javascript
// @example Get an element's content width in px.
luda('#example').width()
// @example Get window's outerWidth(the whole width of browser window,
// including scrollbar, resizing handles...) in px.
luda(window).width()
// @example Set an element's content width or offsetWidth(border-box) in px.
luda('#example').width(1000)
```

### Event

#### .off (name, selector, callback)

```bash
@param {string} [name]
@param {string | Function} [selector]
@param {Function} [callback]
@returns {LudaInstance}
```

```javascript
// @example Remove all event listeners.
luda('#example').off()
// @example Remove event listeners
// which has any matched types.
luda('#example').off('click keydown')
// @example Remove event listeners
// which has any matched namespaces.
luda('#example').off('.ns1.ns2')
// @example Remove event listeners
// which has any matched namespaces and types.
luda('#example').off('click.ns1 keydown.ns2')
// @example Remove delegate event listeners
// which has any matched types.
luda('#example').off('click', '.appended')
// @example Remove deletage event listeners
// which has any matched namespaces.
luda('#example').off('.ns1.ns2', '.appended')
// @example Remove delegate event listeners
// which has any matched namespaces and types.
luda('#example').off('click.ns1 keydown.ns2', '.appended')
```

#### .on (name, selector, callback)

```bash
@param {string} name
@param {string | Function} selector
@param {Function} [callback]
@returns {LudaInstance}
```

```javascript
// @example Add event listeners to an element.
luda('#example').on('click keydown', function(event, data){
  console.log(this === event.currentTarget) // true
  console.log(luda(this).is('#example')) // true
  console.log(data === event.detail) // true
  console.log(event.isDefaultPrevented()) // false
  console.log(event.isPropagationStopped()) // false
  console.log(event.isImmediatePropagationStopped()) // false
  console.log(event.eventPath()) // Event propagation path array.
})
// @example Add named event listeners to an element.
luda('#example').on('click.ns1 keydown.ns2', function(event, data){
  event.preventDefault()
  event.stopPropagation()
  event.stopImmediatePropagation()
  console.log(event.isDefaultPrevented()) // true
  console.log(event.isPropagationStopped()) // true
  console.log(event.isImmediatePropagationStopped()) // true  
})
// @example Add delegate event listeners to an element.
luda(document).on('click keydown', '.example, .appended', function(event, data){
  console.log(this === event.currentTarget) // true
  console.log(luda(this).is('.example, .appended')) // true
})
// @example Add named delegate event listeners to an element.
luda(document).on('click.ns1 keydown.ns2', '.example', function(event, data){
  // Means event.preventDefault() and event.stopPropagation().
  return false
})
// @example Add event listeners and prevent default behavior when events triggered.
// &prevent is short for event.preventDefault()
luda(document).on('click&prevent keydown&prevent', function(){})
// @example Add event listeners and stop propagation when events triggered.
// &stop is short for event.stopPropagation()
luda(document).on('click&stop keydown&stop', function(){})
// @example Add key event listeners for specfic keys.
// Availiable key shortcuts: enter, tab, ctrl, alt, shift, esc, back, space,
// cap, up, down, left, right, del, end, home, ins, pgUp, pgDown
luda(document).on('keydown@esc', function(){})
// @example Add swipe event listeners for touchable screens.
luda(document).on('swipeleft swiperight swipeup swipedown', '.example', function(){})
```

#### .one (name, selector, callback)

This method is similar to [.one](#on-name-selector-callback) method,
but binded event listeners will be removed after triggered once.

#### .trigger (name, data, callback)

```bash
@param {string | CustomEvent} name
@param {*} [data]
@param {boolean | Function} [callback]
@returns {LudaInstance | Array}
```

```javascript
// @example Trigger event hanlders which have any matched types.
luda('#example').trigger('click keydown')
// @example Trigger event handlers which have any matched types and namespaces.
luda('#example').trigger('click.ns1 keydown.ns2')
// @example Trigger event handlers with data.
luda('#example').trigger('click', 'msg')
// @example Trigger event handlers by passing in a custom event.
luda('#example').trigger(new CustomEvent('click',{
  bubbles: true,
  cancelable: true,
  composed: true,
  detail: 'msg'  
})
// @example Trigger event listeners and
// get handled event object after each listener triggered.
luda('.example').trigger('click', null, function(event, data){})
// @example Trigger event listeners and
// get all handled event objects in an array after all listeners triggered.
events = luda('.example').trigger('click', null, true)
```

### Form

#### .val (value)

```bash
@param {*} [value]
@returns {LudaInstance | *}
```

```javascript
// @example Get an input element's value.
luda('input#example').val()
// @example Get an multiple select element's selected values in an array.
luda('select[multiple]').val()
// @example Set an input element's value.
luda('input#example').val('value')
// @example Select multiple options in multiple select elements.
luda('select[multiple]').val(['one', 'two'])
// @example Unselect selected options in select elements.
luda('select').val(null)
// @example Remove files in file inputs.
luda('input[type=file]').val(null)
```

### Manipulation

#### .after (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Insert dom strings after each .example element.
luda('.example').after('<p class="source">')
// @example Insert the #source element after the first .example element,
// and cloned #source elements after the other .example elements.
luda('.example').after('#source')
```

#### .append (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Append dom strings into each .example element.
luda('.example').append('<p class="source"></p>')
// @example Append the #source element into the first .example element,
// and cloned #source elements into the other .example elements.
luda('.example').append('#source')
```

#### .appendTo (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Append dom strings into each .example element.
luda('<p class="source"></p>').appendTo('.example')
// @example Append the #source element into the first .example element,
// and cloned #source elements into the other .example elements.
luda('#source').appendTo('.example')
```

#### .before (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Insert dom strings before each .example element.
luda('.example').before('<p class="source">')
// @example Insert the #source element before the first .example element,
// and cloned #source elements before the other .example elements.
luda('.example').before('#source')
```

#### .clone (cloneCacheAndEvents, cloneDescendants)

```bash
@param {boolean} [cloneCacheAndEvents]
@param {boolean} [cloneDescendants = cloneCacheAndEvents]
@returns {LudaInstance}
```

```javascript
// @example Clone elements without cached data and binded event listeners.
luda('.example').clone()
// @example Clone elements with cached data and binded event listeners,
// but not clone the elements' descendants.
// The cloned data is not a deep copy
// which means data types like object and array are shared
// among the original elements and the cloned elements.
luda('.example').clone(true, false)
// @example Clone elements with cached data and binded event listeners,
// the elements' descendants are also cloned
// including their cached data and binded event listeners.
luda('.example').clone(true)
```

#### .detach ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Remove elements from document,
// but keep the elements' cached data and binded event listeners.
luda('.example').detach()
```

#### .empty ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Remove elements' descendants from document,
// also clean the descendants' cached data and binded event listeners.
luda('.example').empty()
```

#### .html (html)

```bash
@param {string} [html]
@returns {LudaInstance}
```

```javascript
// @example Get the innerHTML of an element.
luda('#example').html()
// @example Clean cached data and remove binded event listeners
// of an element's descendants, then set the innerHTML of the element.
luda('#example').html('<p>html</p>')
```

#### .insertAfter (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Insert dom strings after each .example element.
luda('<p class="source">').insertAfter('.example')
// @example Insert the #source element after the first .example element,
// and cloned #source elements after the other .example elements.
luda('#source').insertAfter('.example')
```

#### .insertBefore (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Insert dom strings before each .example element.
luda('<p class="source">').insertBefore('.example')
// @example Insert the #source element before the first .example element,
// and cloned #source elements before the other .example elements.
luda('#source').insertBefore('.example')
```

#### .prepend (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Prepend dom strings into each .example element.
luda('.example').prepend('<p class="source"></p>')
// @example Prepend the #source element into the first .example element,
// and cloned #source elements into the other .example elements.
luda('.example').prepend('#source')
```

#### .prependTo (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Prepend dom strings into each .example element.
luda('<p class="source"></p>').prependTo('.example')
// @example Prepend the #source element into the first .example element,
// and cloned #source elements into the other .example elements.
luda('#source').prependTo('.example')
```

#### .remove ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Remove elements from document,
// also clean the elements' cached data and remove binded event listeners.
luda('.example').remove()
```

#### .replaceAll (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Replace each .example element with dom strings.
luda('<p class="replacer>').replaceAll('.example')
// @example Replace the first .example element with the #replacer element,
// and the other .example elements with cloned #replacer elements.
luda('#replacer').replaceAll('.example')
```

#### .replaceWith (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Replace each .example element with dom strings.
luda('.example').replaceWith('<p class="replacer>')
// @example Replace the first .example element with the #replacer element,
// and the other .example elements with cloned #replacer elements.
luda('.example').replaceWith('#replacer')
```

#### .text ()

```bash
@param {string} [text]
@returns {LudaInstance}
```

```javascript
// @example Get the textContent of an element.
luda('#example').text()
// @example Clean cached data and remove binded event listeners
// of an element's descendants, then set the textContent of the element.
luda('#example').text('text')
```

#### .unwrap ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Replace the parentNodes of .example elements
// with the elements themselves.
luda('.example').unwrap()
```

#### .wrapAll (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Wrap all the .example elements into a div.
luda('.example').wrapAll('<div id="wrapper">')
// @example Insert the #wrapper element before the first .example element,
// and use the #wrapper to wrap all the .example elements.
luda('.example').wrapAll('#wrapper')
```

#### .wrapInner (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Wrap all the descendants of #example into a div.
luda('#example').wrapInner('<div id="wrapper">')
// @example Append the #wrapper element into the #example element,
// and use the #wrapper to wrap all the descendants of the #example element.
luda('#example').wrapInner('#wrapper')
```

#### .wrap (selector)

```bash
@param {LudaSelector} selector
@returns {LudaInstance}
```

```javascript
// @example Wrap each .example element into a single div.
luda('.example').wrap('<div id="wrapper">')
// @example Insert the #wrapper before the first .example element,
// and wrap the first .example element into the #wrapper
// and the other .example elements into cloned #wrappers.
luda('.example').wrap('#wrapper')
```

### Offset

#### .offset ()

```bash
@returns {Object}
```

```javascript
// @example Get the distance in px
// from the top of the element to the top of document.
luda('#example').offset().top
// @example Get the distance in px
// from the left of the element to the left of document.
luda('#example').offset().left
```

#### .offsetParent ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Create a LudaInstance which contains the element's offsetParent.
luda('#example').offsetParent()
```

#### .position ()

```bash
@returns {Object}
```

```javascript
// @example Get the distance in px
// from the top of the element to the top of the element's offsetParent.
luda('#example').position().top
// @example Get the distance in px
// from the left of the element to the left of the element's offsetParent.
luda('#example').position().left
```

### Prop

#### .prop (property, value)

```bash
@param {Object | string} property
@param {*} [value]
@returns {LudaInstance | *}
```

```javascript
// @example Get a property value from the element.
luda('input[type=checkbox]').prop('checked')
// @example Set elements' property value.
luda('input[type=checkbox]').prop('checked', true)
// @example Set elements' property value with an object.
luda('input[type=checkbox]').prop({checked: true, name: 'example'})
```

#### .removeProp (property)

```bash
@param {string} property
@returns {LudaInstance}
```

```javascript
// @example Remove property value from elements.
luda('input[type=checkbox]').removeProp('checked name')
```

### Reflow

#### .reflow ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Trigger dom reflow forcely.
luda('.example').reflow()
```

### Transition

#### .transitionDuration ()

```bash
@returns {number | undefined}
```

```javascript
// @example Get the transition duration of an element in milliseconds.
luda('#example').transitionDuration()
```

### Traversal

#### .children (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect all the child elements.
luda('.example').children()
// @example Collect the .child child elements.
luda('.example').children('.child')
// @example Collect the child elements which make the function return true.
luda('.example').children(function(el, index){
  console.log(this === el) // true
  return index > 2
})
```

#### .closest (comparator)

```bash
@param {LudaComparator} comparator
@returns {LudaInstance}
```

```javascript
// @example Collect the closest .closest elements according to
// the elements contained in the LudaInstance.
luda('.example').closest('.closest')
```

#### .contents ()

```bash
@returns {LudaInstance}
```

```javascript
// @example Collect the contents of the elements.
luda('.example').contents()
```

#### .find (selector)

```bash
@param {string} selector
@returns {LudaInstance}
```

```javascript
// @example Collect the #example element's descendant elements
// which match the .target selector.
luda('#example').find('.target')
```

#### .next (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Get the first next sibling element.
luda('#example').next()
// @example Search the next sibling elements and get
// the first which matches the .next selector.
luda('#example').next('.next')
// @example Search the next sibling elements and get
// the first which makes the function return true.
luda('#example').next(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.next')
})
```

#### .nextAll (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect all the next sibling elements.
luda('#example').nextAll()
// @example Collect all the next sibling elements
// which match the .next selector
luda('#example').nextAll('.next')
// @example Collect all the next sibling elements
// which make the function return true,
luda('#example').nextAll(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.next')
})
```

#### .parent (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Get the element's parentNode.
luda('#example').parent()
// @example Get the closest .ancestor ancestor element.
luda('#example').parent('.ancestor')
// @example Get the closest ancestor element
// which make the function return true
luda('#example').parents(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.prev')
})
```

#### .parents (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect all the ancestor elements.
luda('#example').parents()
// @example Collect the ancestor elements
// which match the .ancestor selector
luda('#example').parents('.ancestor')
// @example Collect the ancestor elements
// which make the function return true
luda('#example').parents(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.prev')
})
```

#### .prev (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect the first previous sibling element.
luda('#example').prev()
// @example Search previous sibling elements and get
// the first which matches the .prev selector
luda('#example').prev('.prev')
// @example Search previous sibling elements and get
// the first which makes the function return true.
luda('#example').prev(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.prev')
})
```

#### .prevAll (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect all the previous sibling elements.
luda('#example').prevAll()
// @example Collect all the previous sibling elements
// which match the .prev selector.
luda('#example').prevAll('.prev')
// @example Collect all the previous sibling elements
// which make the function return true,
luda('#example').prevAll(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.prev')
})
```

#### .siblings (comparator)

```bash
@param {LudaComparator} [comparator]
@returns {LudaInstance}
```

```javascript
// @example Collect all the sibling elements.
luda('#example').siblings()
// @example Collect all the sibling elements
// which match the .prev selector
luda('#example').siblings('.sibling')
// @example Collect all the sibling elements
// which make the function return true
luda('#example').siblings(function(el, index){
  console.log(this === el) // true
  return luda(el).is('.sibling')
})
```

## Luda Component

### Component Class Factory

#### luda.component (name, rootSelector)

```bash
@param {string | undefined} name
@param {string | document} rootSelector
@returns {LudaComponent}
```

```javascript
// @example Create a component class object which can auto create
// and destroy component instances for the elements which match
// the css selector.
// At the same time, a LudaComponentProxy is created since
// the name param is presented. The proxy can be accessed by calling
// luda.multiple (camel case name).
let Multiple = luda.component('multiple', '.multiple')
// @example Create a component class object which can auto create a
// single component instance for document.
// Since the name param is undefined, no proxy is created for this
// component class.
let Singleton = luda.component(undefined, document)
```

### Component Static Methods

#### .contains (selector)

```bash
@param {LudaSelector} selector
@returns {boolean}
```

```javascript
// @example Check if any component instance is created
// by a specific component class for the element.
Multiple.contains(luda('#multiple'))
Singleton.contains(document)
```

#### .each (callback)

```bash
@param {Function} callback
@returns {LudaComponent}
```

```javascript
// @example Loop the component instances created by
// a specific component class.
Multiple.each(function(instance, rootEl){
  console.log(instance) // LudaInstance
  console.log(rootEl) // Element
  console.log(instance.root.length === 1) // true
  console.log(instance.root.get(0) === rootEl) // true
})
Singleton.each(function(instance, rootEl){
  console.log(instance) // LudaInstance
  console.log(rootEl) // document
  console.log(instance.root.length === 1) // true
  console.log(instance.root.get(0) === rootEl) // true
})
```

#### .help (definition)

```bash
@param {LudaComponentHelper} definition
@param {Function} [definition.find]
@param {Function} [definition.listen]
@param {Function} [definition.watch]
@param {Function} [definition.create]
@param {Function} [definition.destroy]
@returns {LudaComponent}
```

```javascript
// @example Create a component class object and define helpers.
let Multiple = luda.component('multiple', '.multiple').help({

  find: function(){
    console.log(this === Multiple.prototype) // true
    return {
      descendants: '.descendant',  // Access by calling this.descendants
      outOfRoot: luda('#out-of-root') // Access by calling this.outOfRoot
    }
  },

  listen: function(){
    console.log(this === Multiple.prototype) // true
    return [
      ['click keydown@enter', '.descendant', this.doSomething],
      ['click', '#out-of-root', function(event, data){
        console.log(this instanceof Multiple) // false
      }, function(event, data){
        console.log(luda(this).is('#out-of-root')) // true
      }]
    ]
  },

  watch: function(){
    console.log(this === Multiple.prototype) // true
    return {
      node: [
        ['.descendant', this.doSomething, this.doSomethingElse],
        ['.descendant', function(changed, type){
          console.log(this instanceof Multiple) // false
          console.log(this === changed) // true
          console.log(luda.isArray(changed)) // true
          console.log(changed.length >= 1) // true
          console.log(type === 'added' or type === 'removed') // true
        }]
      ],
      attr: [
        ['name', '.descendant', this.doSomething],
        ['name', '.descendant', function(changed, oldVal){
          console.log(this instanceof Multiple) // false
          console.log(this === changed) // true
          console.log(changed instanceof Element) // true
          console.log(luda(changed).attr('name') === oldVal) // false
        }]
      ]
    }
  },

  create: function(){
    console.log(this instanceof Multiple) // true
    console.log(this.descendants) // LudaInstance
    console.log(this.outOfRoot) // LudaInstance
  },

  destroy: function(){
    console.log(this instanceof Multiple) // true
    console.log(this.descendants) // LudaInstance
    console.log(this.outOfRoot) // LudaInstance
  }

})
```

#### .include (definition)

```bash
@param {LudaComponentProperty} definition
@returns {LudaComponent}
```

```javascript
// @example Define public properties can be accessed through a component proxy.
Multiple.include({
  cls: {active: 'active'},
  toggle: function(){
    this.root.toggleClass(this.cls.active)
  }
})
// @example Access defined public properties through a component proxy.
luda('#multiple').toggle().cls.active
```

#### .protect (definition)

```bash
@param {LudaComponentProperty} definition
@returns {LudaComponent}
```

```javascript
// @example Define private properties can only be accessed
// through a component instance.
Multiple.protect({
  evt: {toggle: 'myComponent:toggle'},
  triggerToggleEvt: function(){
    this.root.trigger(this.evt.toggle)
  }
})
```

### Component Instance Properties

#### .id

```bash
@prop {integer} id
```

```javascript
// @example Get the global unique id of a component instance.
luda.component('multiple', '.multiple').help({
  create: function(){
    console.log(this.id)
  }
})
```

#### .con

```bash
@prop {LudaComponent} con
```

```javascript
// @example Get current component instance's component class.
let Multiple = luda.component('multiple', '.multiple').protect({
  doSomething: function(){
    console.log(this.con === Multiple) // true
    console.log(this.con === this.prototype.constructor) // true
  }
})
```

#### .root

```bash
@prop {LudaInstance} root
```

```javascript
// @example Get current component instance's root element.
luda.component('multiple', '.multiple').protect({
  doSomething: function(){
    console.log(this.root.length) // 1
    console.log(this.root.get(0)) // Element
  }
})
```

#### .win

```bash
@prop {LudaInstance} win
```

```javascript
// @example Get window object in a component instance.
luda.component(undefined, document).protect({
  doSomething: function(){
    console.log(this.win.length) // 1
    console.log(this.win.get(0) === window) // true
  }
})
```

#### .doc

```bash
@prop {LudaInstance} doc
```

```javascript
// @example Get document object in a component instance.
luda.component(undefined, document).protect({
  doSomething: function(){
    console.log(this.doc.length) // 1
    console.log(this.doc.get(0) === document) // true
    console.log(this.doc.is(this.root)) // true
  }
})
```

#### .html

```bash
@prop {LudaInstance} html
```

```javascript
// @example Get document.documentElement in a component instance.
luda.component(undefined, document).protect({
  doSomething: function(){
    console.log(this.html.length) // 1
    console.log(this.html.get(0) === document.documentElement) // true
  }
})
```

#### .body

```bash
@prop {LudaInstance} body
```

```javascript
// @example Get document.body in a component instance.
luda.component(undefined, document).protect({
  doSomething: function(){
    console.log(this.body.length) // 1
    console.log(this.body.get(0) === document.body) // true
  }
})
```

## Luda Mixin

### Mixin Constructor

#### luda.mixin(name, conf)

```bash
@param {string | undefined} name
@param {Object} [conf]
@returns {LudaMixinInstance | Luda}
```

```javascript
// @example Create a mixin instance and cache it in memory
// with an unique name.
luda.mixin('toggleable', {
  toggleableCreate: function(){
    console.log('creating a instance.')
  },
  toggleableActivate: function(){
    console.log('activate a instance.')
  }
})
// @example Get a named mixin instance.
luda.mixin('toggleable')
// @example Remove a named mixin from memory.
luda.mixin('toggleable', null)
// @example Create a anonymous mixin instance.
let toggleable = luda.mixin({
  toggleableCreate: function(){
    console.log('creating a instance.')
  },
  toggleableActivate: function(){
    console.log('activate a instance.')
  }  
})
```

### Mixin Instance Methods

#### .all ()

```bash
@returns {Object}
```

```javascript
// @example Get all defined properties in a mixin instance.
luda('toggleable').all()
```

#### .alias (options)

```bash
@param {Object} options
@returns {Object}
```

```javascript
// @example Get specific properties in a mixin instance
// and rename the properties in returned object.
luda('toggleable').alias({
  create: 'toggleableCreate',
  activate: 'toggleableActivate'
})
```

#### .except (arg1, arg2, ...)

```bash
@param {string | Array} arg1[, arg2, ...]
@returns {Object}
```

```javascript
// @example Filter mixin instance properties and collect
// left properties in an object.
luda.mixin('toggleable').except('toggleableCreate')
luda.mixin('toggleable').except('toggleableCreate', 'toggleableActivate')
luda.mixin('toggleable').except(['toggleableCreate', 'toggleableActivate'])
```

#### .get (name)

```bash
@param {string} name
@returns {*}
```

```javascript
// @example Get a specific property in a mixin instance.
luda.mixin('toggleable').get('toggleableCreate')
```

#### .only (arg1, arg2, ...)

```bash
@param {string | Array} arg1[, arg2, ...]
@returns {Object}
```

```javascript
// @example Filter mixin instance properties and collect
// specific properties in an object.
luda.mixin('toggleable').only('toggleableCreate')
luda.mixin('toggleable').only('toggleableCreate', 'toggleableActivate')
luda.mixin('toggleable').only(['toggleableCreate', 'toggleableActivate'])
```