# Method: `getCallbackHandle`

## Description

Get a handle to a named top-level or static callback function which can
 be easily passed between isolates.

 The `callback` argument must not be null.

 Returns a [CallbackHandle] that can be provided to
 [PluginUtilities.getCallbackFromHandle] to retrieve a tear-off of the
 original callback. If `callback` is not a top-level or static function,
 null is returned.

## Return Type
`CallbackHandle?`

## Parameters

- `callback`: `Function`
