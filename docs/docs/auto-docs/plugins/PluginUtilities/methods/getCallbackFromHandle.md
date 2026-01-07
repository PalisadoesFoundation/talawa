# Method: `getCallbackFromHandle`

## Description

Get a tear-off of a named top-level or static callback represented by a
 handle.

 The `handle` argument must not be null.

 If `handle` is not a valid handle returned by
 [PluginUtilities.getCallbackHandle], null is returned. Otherwise, a
 tear-off of the callback associated with `handle` is returned.

## Return Type
`Function?`

## Parameters

- `handle`: `CallbackHandle`
