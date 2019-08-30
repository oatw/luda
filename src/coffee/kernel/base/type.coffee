export default

  isArray: Array.isArray

  isString: (x) -> typeof x is 'string'

  isFunction: (x) -> typeof x is 'function'

  isObject: (x) -> typeof x is 'object'

  isBool: (x) -> typeof x is 'boolean'

  isNumeric: (x) -> not isNaN(parseFloat x) and isFinite x

  isDecimalism: (x) -> /^\d*\.?\d+$/.test x and not /^0+\d+\.?/.test x

  isId: (x) -> /^#[\w-]*$/.test x

  isClass: (x) -> /^\.[\w-]*$/.test x

  isTag: (x) -> /^\w+$/.test x

  isSingleTag: (x) -> /^\s*<(\w+)\s*\/?>(?:<\/\1>)?\s*$/.test x

  isHtml: (x) -> /<.+>/.test x

  isScript: (x) ->
    x.tagName is 'SCRIPT' and /^$|^module$|\/(?:java|ecma)script/i.test x.type

  isFragment: (x) -> /^\s*<(\w+)[^>]*>/.test x

  isWindow: (x) -> x and x is window

  isDocument: (x) -> x and x.nodeType is 9

  isElement: (x) -> x and x.nodeType is 1