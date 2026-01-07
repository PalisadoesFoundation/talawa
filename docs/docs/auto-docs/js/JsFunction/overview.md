# Overview for `JsFunction`

## Description

A proxy on a JavaScript Function object.

## Dependencies

- JsObject

## Constructors

### withThis
Returns a [JsFunction] that captures its 'this' binding and calls [f]
 with the value of JavaScript `this` passed as the first argument.

#### Parameters

- `f`: `Function`
