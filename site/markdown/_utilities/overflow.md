---
title: Overflow
description: Use overflow utilities to control how content overflows a container.
---

## Introduction

Overflow utilities are classes for setting the value of the
[`overflow`](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow) property.
There're three overflow classes: `.of-hidden`, `.of-auto` and `.of-visible`.
Let's see the below examples for detail.

## Example

<div class="my-small of-hidden bc-dark" style="height: 8rem">
  <div class="bc-primary" style="width: 80%; height: 200%">
    <p class="c-light px-medium">.of-hidden</p>
  </div>
</div>
``` html
<div class="of-hidden">
  <div style="height: 200%"></div>
</div>
```

<div class="mt-medium mb-small of-auto bc-dark" style="height: 8rem">
  <div class="bc-primary" style="width: 80%; height: 200%">
    <p class="c-light px-medium">.of-auto</p>
  </div>
</div>
``` html
<div class="of-auto">
  <div style="height: 200%"></div>
</div>
```

<div class="mt-medium of-visible bc-dark" style="height: 8rem; margin-bottom: 9rem">
  <div class="bc-primary" style="width: 80%; height: 200%">
    <p class="c-light px-medium">.of-visible</p>
  </div>
</div>
``` html
<div class="of-visible">
  <div style="height: 200%"></div>
</div>
```