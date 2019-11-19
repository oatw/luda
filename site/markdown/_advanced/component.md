---
title: Build A Component
order: 3
description: You'll learn the most important things of building components
             with Luda in this chapter. 
---

## Live Demos

There are some [live demos](https://codepen.io/collection/nmBYVv) built with Luda,
you can play with them at codepen.

## How Luda Component Works

### Component Class Execution Process

<figure class="media media-contain w-100 media-zoom">
  <a href="{{ '/assets/img/execution.png' | relative_url }}" target="_blank" class="d-block">
    <picture class="media-content" style="padding-top:144%">
      <img src="{{ '/assets/img/execution.png' | relative_url }}"
      alt="component class execution process">
    </picture>
  </a>
</figure>

### Component Instance Lifecycle

<figure class="media media-contain w-100 media-zoom">
  <a href="{{ '/assets/img/lifecycle.png' | relative_url }}" target="_blank" class="d-block">
    <picture class="media-content" style="padding-top:206.4%">
      <img src="{{ '/assets/img/lifecycle.png' | relative_url }}"
      alt="component instance lifecycle">
    </picture>
  </a>
</figure>

## Define Component Classes

When you create components with Luda, you actually define component class objects.
Luda will maintain component instances automatically according to your definitions.

A component class can be created by calling the `luda.component` factory function.
This function accepts two parameters, the name and the root selector of a class.

### Named Component

If a string is passed in as the name parameter, Luda treats the component as
a named component which can be accessed by component users.

```javascript
// @example Create a named component class.
luda.component('myComponent', '.my-component')
```

Component users can use the automatically created proxy of a named component to
pick component instances by passing in a selector, and access public properties
and methods of the instances.

```javascript
// @example Component users can access a specific component instance
// of a named component class.
luda.myComponent('#my-component').doSomething().doSomethingElse()
// @example Component users can access multiple component instances
// of a named component class.
luda.myComponent('.my-component').doSomething().doSomethingElse()
```

### Anonymous Component

If you pass in `undefined` as the name parameter, Luda treats your component as an
anonymous component which can not be accessed by component users.

```javascript
// @example Create an anonymous component class.
luda.component(undefined, '.my-anonymous-component')
```

### Multition Component

By passing in a valid css selector as the root selector parameter, you get
a component class which can create multiple instances.
Any element matches the selector will be treated as a component root element.
An instance will be created for each root element, after document ready or a root
element appended to document. A created instance will be destroied after its root
element removed from document or attributes changed which makes it don't match the
root selector anymore.

```javascript
// @example Create a multition component class.
luda.component('myComponent', '.my-component')
```

### Singleton Component

You won't need a singleton component except you want to handle global behaviors.
A singleton component class can be defined by passing in
`document` as the root selector. Only one instance will be created after document
ready and it will never be destroied since the document object is always there,
except current web page is destroied or redirected.

```javascript
// @example Create a singleton component class.
luda.component('mySingletonComponent', document)
```

You may wonder why a singleton component class cannot be created by passing in
a specfic html element but only the `document` object? That's because in single
page applications, you can not ensure the element picked is the same object
after page redirections. That may lead to instance lifecycles not able to be
tracked.

## Define Component Properties

Component properties and methods are defined on prototypes of component classes.
The execution context of defined methods is the current component instance, which
means `this` points to the instance itself except you manually change the
execution context.

### Private Property

All properties of a component instance are treated private by default.
Additionally, you can define private properties with the `.protect` method for
a clear meaning. If a component user tries to access private properties of
components, warning messages will be shown on the console pannel.

```javascript
// @example Define private properties and methods.
luda.component('myComponent', '.my-component')
.protect({
  // Define a self maintained property
  // with a default value.
  counts: 0,
  // Define a parent maintained property,
  // which is passed in to this component
  // through the data-max-toggle-counts attribute.
  maxCounts(){
    return this.root.data('max-toggle-counts')
  }
})
```

### Public Property

If you want to expose public properties of named components to component users,
you can define them with the `.include` method.

```javascript
// @example Define public properties and methods.
luda.component('myComponent', '.my-component')
.include({
  // Do something and dispatch an event
  // to transfer data to ancestor components.
  toggle(){
    if(this.counts < this.maxCounts()){
      this.counts += 1
      this.root.toggleClass('active').trigger('toggled', this.counts)
    }
  }
})
```

## Define Component Helpers

Component helpers are functions used to bind event listeners, watch dom changes,
and collect dom elements for components. The create helper and destroy helper's
execution context is the current component instance, and the execution context
of the other helpers is the component class's prototype.

### The Find Helper

The find helper should return definitions of element searching rules in an
object for creating element getters on the component class's prototype.
These getters works under the context of component instances. Searching rules
can be defined as css selectors, functions and any other objects.

If a rule is defined as css selectors, the searching range is inside the
current instance's root element. Matched elements will be collected and cached
when necessary. After matched elements added to or removed from the root element
dom tree, cached results of the getters will be updated automatically.
(For nested components, only elements directly warpped in current instance's
root element but not nested in descendant root elements will be collected.)

If a rule is not defined as css selectors, the searching range, return
value and cache of the getter are totally controlled by the rule itself.

```javascript
// @example Define dom getters for a component.
luda.component('myComponent', '.my-component')
.help({
  find(){
    return {
      descendants: '.descendant',
      outOfRoot: luda('#out-of-root')
    }
  }
})
```

### The Listen Helper

The listen helper should return event listener definitions in an array for
binding component event listeners. All listeners will be binded to document
only once and triggered under delegation mode. The binding syntax is similiar
to the [`luda(selector).on`](./api#on-name-selector-callback) method but allows
multiple callbacks.

The execution context of an event callback is the current component instance
if the callback is defined on the component class's prototype. In this situation,
only events dispatched from the current component's root element dom tree will
be captured. (For nested components, events dispatched from nested descendant
root element dom trees will not be captured.)

If an event callback isn't defined on the component class's prototype, its execution
context is the currentTarget of the captured event. And any events dispatched from
document will be captured. It's just like define event listeners by calling
`luda(document).on(...)`.

```javascript
// @example Define event listeners for a component.
luda.component('myComponent', '.my-component')
.help({
  listen(){
    return [
      ['click keydown@enter', '.descendant', this.doSomething, this.doSomethingElse],
      ['click', '#out-of-root', function(event, data){}, function(event, data){}]
    ]
  }
})
```

### The Watch Helper

The watch helper is used to watch node and attribute changes on component dom trees.
An mutation observer will be created for each component instance according to the
definitions. The syntax of defining observers is similiar to binding event listeners
in the listen helper.

If a callback is defined on the current component's prototype, the callback's
execution context is the current component instance. Otherwise, the execution
context is the target of the mutation. (For nested components, mutations in nested
descendant root element dom trees will not be captured.)

```javascript
// @example Define an observer for a component.
luda.component('myComponent', '.my-component')
.help({
  watch(){
    return {
      node: [
        ['.descendant', this.doSomething, this.doSomethingElse],
        ['.descendant', function(elements, type){}, function(elements, type){}]
      ],
      attr: [
        ['name value', '.descendant', this.doSomething],
        ['name', '.descendant', function(element, oldValue){}]
      ]
    }
  }
})
```

### The Create Helper

The create helper executes after the find, listen and watch helper executed.
It executes whenever a component instance is created, you can use this helper
to rewrite properties inherited from the component class's prototype.

```javascript
luda.component('myComponent', '.my-component')
.help({
  create(){
    if(this.root.hasClass('countable')){
      this.counter = setTimeout(() => { this.counts ++ })
    }
  }
})
```

### The Destroy Helper

The destroy helper executes whenever a created component instance is going to
be destroied.

```javascript
luda.component('myComponent', '.my-component')
.help({
  destroy(){
    if('counter' in this){
      clearTimeout(this.counter)
    }
  }
})
```

## Use Mixins

Mixins are useful when you need share codes among components, Luda mixins are
flexible and easy to use.

### Define Mixins

Mixins can be defined by calling the `luda.mixin` function. This function
accepts two parameters, the name and the property definitions.

#### Named Mixin

You can create a named mixin by passing in a string type name and an object type
definition to the `luda.mixin` function.

```javascript
// @example Create a named mixin.
luda.mixin('myMixin', {
  cls: 'active',
  activate(){
    this.root.addClass(this.cls)
  },
  deactivate(){
    this.root.removeClass(this.cls)
  },
  toggle(){
    this.root.toggleClass(this.cls)
  }
})
```

Named mixins can be accessed by passing in a name to the `luda.mixin` function.

```javascript
// @example Access a named mixin.
luda.mixin('myMixin')
```

#### Anonymous Mixin

An anonymous mixin can be created by passing in only an object type definition
to the `luda.mixin` function, and the created mixin will be returned.

```javascript
// @example Create an anonymous mixin.
let myMixin = luda.mixin({
  cls: 'active',
  activate(){
    this.root.addClass(this.cls)
  },
  deactivate(){
    this.root.removeClass(this.cls)
  },
  toggle(){
    this.root.toggleClass(this.cls)
  }
})
```

### Include Mixins

Luda provides some convenient methods to use mixins in components, you can pick
needed mixin properties to include them into different components.

#### Pick Wanted Mixin Properties

You can use the `.only` method of a created mixin to pick the properties needed
in an object, and include the object into a component.

```javascript
// @example Pick wanted mixin properties.
luda.component('myComponent', '.my-component')
.include(
  myMixin.only('toggle')
)
.protect(
  myMixin.only('cls', 'activate', 'deactivate')
)
```

#### Filter Out Unwanted Mixin Properties

Unwanted mixin properties can be filtered out by calling the `.except` method
of a created mixin, the left properties will be assigned into an object and
returned.

```javascript
// @example Filter out unwanted mixin properties.
luda.component('myComponent', '.my-component')
.include(
  myMixin.except('cls', 'activate', 'deactivate')
)
.protect(
  myMixin.except('toggle')
)
```

#### Pick And Rename Wanted Mixin Properties

If you need pick mixin properties and rename them, you can use the `.alias`
method, the picked properties will be assigned in an object using the new names.

```javascript
// @example Pick and rename mixin properties.
luda.component('myComponent', '.my-component')
.include(
  myMixin.alias({exposedToggle: 'toggle'})
)
.protect(
  myMixin.only('cls', 'activate', 'deactivate')
)
```

#### Pick All Mixin Properties

If you need pick all properties of a created mixin, you can use the `.all` method.
All defined mixin properties will be assigned in an object and returned.

```javascript
// @example Pick all mixin properties.
luda.component('myComponent', '.my-component')
.include(
  myMixin.alias({exposedToggle: 'toggle'})
)
.protect(
  myMixin.all()
)
```

#### Directly Access A Mixin Property

If you don't want to pick mixin properties in an object, but need directly access
the property, you can use the `.get` method.

```javascript
// @example Directly access a mixin property.
luda.component('myComponent', '.my-component')
.include({
  toggle(){
    if(this.root.hasClass('active')){
      myMixin.get('deactivate').call(this)
    }else{
      myMixin.get('activate').call(this)
    }
  }
})
```

## Other Things

- In some cases, you may handle component creating and destroying manually.
  If so, you can add the `data-auto="false"` attribute to the component's
  root element.

- If a component user calls instance methods through a component proxy, the return
  value will be the proxy itself. This provides a chain api experience for convinence.
  If the methods' return values are needed, an additional option parameter can be
  passed into the methods to break the chain, and the method's return values will
  be collected in an array.

```javascript
// @example Returns a proxy.
luda.myComponent('.my-component').doSomething(arg).doSomethingElse(arg)
// @example Returns an array which contains the return values.
luda.myComponent('.my-component').doSomething(arg, {chain: false})
```

- Get to know more about building Luda components at
  the [API](./api#luda-component) page.