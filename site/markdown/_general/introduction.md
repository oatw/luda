---
title: Introduction
description: Before we start, here is a short introduction for you
             to better understand the concepts and features of Luda.
order: 1
---

## What is Luda

**Luda is a library helps to build cross-framework UI components.**

As the time of writting, 2020 is coming. There're already awosome frameworks
great for UI and application development in front-end community. Why something
called Luda jumped out? Because this is the front-end community.
(Don't be serious, just a joke :)

If you stick to a specific framework or UI library, please just close the
page, I don't want to waste your time. But If you're looking for something
helps to create reusable components across framewoks speaking different
languages, you could give Luda a try.

Luda takes part in the process after templates parsed and leaves the parsing work
like data binding and custom tag packaging to your faviroute frameworks.
In this way, you can package reusable Luda components with utmost flexibility,
no matter in a front-end framework or a back-end framework.

## Features

### Kernel Engine

Inspired by
[Cash](https://github.com/kenwheeler/cash)(A library like jQuery),
the javascript part of Luda was rewritten in version 0.3.0.
Most commonly used functions and classes for creating UI components were bundled
together, I call them the kernel engine. You'll learn Luda fast if you're already
familiar with jQuery.

#### Automatic Component Lifecycle Handling

Luda handles component lifecycle automatically based on
[Document Ready State](https://developer.mozilla.org/en-US/docs/Web/API/Document/readystatechange_event)
and [Mutation Observer](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver).
You don't have to watch component changes manually,
just define component helpers and everything else is taken care by Luda.

#### Automatic Component Dom Searching And Cache Management

Dom elements and event listeners maintained in component helpers are cached
by the kernel engine when necessary. Caches are updated or removed automatically
when component dom tree mutated.

#### Automatic Proxy Creating For Accessing Components Safely

Proxies which protect private properties are automitically created for named
components. If a component user tries to access protected properties or methods of
your components, warning messages will be printed on the dev console pannel.

#### Native Attributes And Events For Component Communication

Luda uses native html attributes as component props and native
[CustomEvents](https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent)
to dispatch messages and transfer data among components. No matter
what framework you use, these native features work well.

#### Mixins For Component Code Reusing

The kernel engine includes a mixin module for sharing code snippets. You can
package component properties and methods in a named or an anonymous mixin instance,
and use it among different components.

### Built-in Components

Luda provides a set of built-in components which are created under a multiple
theme architecture. These components are lightweight and modular, internal
dependencies are carefully handled, even for sass dependencies. The implemented
baseline grid is the most proud part of the built-in components. You can choose
these components as a start.

_Before version 1.0.0, only the default theme is released,
new themes will be released after version 1.0.0._

#### Element

Elements are basic visible units to create user interfaces.
Each element has a specfic function, they don't rely on other elements.
They can be used alone or combined together to create UI patterns.
For example, `button`s can exist alone or combined to create a `button group`.

#### Pattern

Patterns are implementations of generally used UI design patterns.
They can be combinations or extensions based on elements or other collections.
For example, `search bar` is the combination of a `form text field` element
and a `button` element.

#### Utility

Most utilities include a single css rule with an `!important` flag at the end,
they are used to define universal patterns or override built-in styles quickly.
For example, the utility `.rel` contains a single css rule `positon: relative !important`.

#### Behavior

Behaviors are pure javascript components or functional CSS definations,
they are used to control or enhance interaction actions.
For example, `toggle` is a commonly used behavior to show or hide an
element without writting javascript.

## FAQ

### Why No Template Parsing

Luda is not such a "cool" thing totally counts on client-side rendering.
Using server-side rendering or client-side rendering should be decided by developers,
but not Luda. As an UI library, Luda just fits in both situations. No matter
what kind of techs you use, you can create component based applications
with Luda.

On the other hand, no matter you're using a front-end framework or a back-end framework,
the template part of it has already been mature enough and I believe you are already
familiar with it. Packaging component html tags in one template language is easier
than mixing different template languages together, right? It's unnecessary to embed
another template language to confuse you when to use which one.

### Why Not Web Components

Web components seem like the future of component based applications, and some great
tools like [Stencil](https://stenciljs.com/) has already taken this approach to build
cross-framework components. If you need a web components based tool, Stencil is
highly recommended.

Luda doesn't aim to be another web components based library. The more things
packaged in a component the less flexible the component is. As a flexible library,
Luda repects your ways of packaging components. You can package a Luda component
in any way you like, a custom element, a custom tag, or just a partial template.
Not everybody is a big fun of web components, and every framework has its own way
of packaging custom elements, but the choice is yours.

### Why Not VanillaJs

In earlier versions, the javascript part of Luda was written in vanilla js.
It was painful and inefficient to build components if without additional helpers.
After a lot helpers builded, it seemed developers could build components more efficiently.
But actually, it was not, developers had to take time to get familiar with the unkown
helper functions.

So in version 0.3.0, the javascript part of Luda was totally rewritten,
provided a familiar experience like using jQuery, and a better experience of
building components. Luda takes developing experience higher priority over following
the trends.

### Is Luda A Library Or A Framework

As mentioned, Luda is a library. If you noticed alpha versions of Luda, you may
saw _"Luda is a lightweight and responsive UI framework for modern web development."_
at the home page. That's because at the begining of creating Luda, I planned
to make it a framework, but soon I realized building a new framework was overkill
for sovling the problems Luda focued on.
So I changed my mind, just a library is enough.

Sorry for confusing you.
