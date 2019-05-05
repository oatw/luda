---
title: Introduction
description: Before we start, here is a short introduction for you
             to better understand the features and theories of Luda.
order: 1
---

## Why Luda

Think about if Luda is for you through the core feature explanations.

### Luda is Lightweight

With internal components reusing and zero external dependencies,
Luda is much more lightweight than many other UI frameworks,
but still includes many components and keeps growing. Themes can
be changed by including different theme CSS files.
The shared Javascript and each theme's CSS are only about 25KB
after gzipd.

_Before version 1.0.0, only the default theme is released,
new themes will be released after version 1.0.0._

### Luda is Modular

Luda supports modular imports, internal dependencies are carefully handled,
even for sass dependencies.
You can import the components you need in asset management tools
like Webpack, Rollup, Sprokets and many others.

### Designed for Creative Designers

There're some design concepts which professional designers
like to apply in their designs, like column grid, baseline grid,
modular type scale and more.
During the development process of Luda, these concepts are always in mind.
What's more, the Sass codes in Luda are idempotent,
all styles can be easily customized by overriding sass variables
and definations.

### Designed for Lazy Developers

Based on [Mutation Observer API](https://developer.mozilla.org/en-US/docs/Web/API/MutationObserver),
Luda handles components' lifecycles and behaviors automitaclly.
In most cases, you don't need write Javascript to control the components.
Components' layouts are very stable in Luda,
every component handles its document flow internally,
you can position it in or out of the normal document flow without any worry.

## Component Categories

Components in Luda are classified into different types,
you can follow this architecture to extend Luda.

### Element

Elements are basic visible units to create user interfaces.
Each element has a specfic function, they don't rely on other elements.
They can be used alone or combined together to create UI patterns.
For example, `button`s can exist alone or combined to create a `button group`.

### Pattern

Patterns are implementations of generally used UI design patterns.
They can be combinations or extensions based on elements or other collections.
For example, `search bar` is the combination of a `form text field` element
and a `button` element.

### Utility

Most utilities include a single css rule with an `!important` flag at the end,
they are used to define universal patterns or override built-in styles quickly.
For example, the utility `.rel` contains a single css rule `positon: relative !important`.

### Behavior

Behaviors are pure javascript components or functional CSS definations,
they are used to control or enhance interaction actions.
For example, `toggle` is a commonly used behavior to show or hide an
element without writting javascript.