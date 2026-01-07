# Method: `captureAll`

## Description

Returns a widget that will [wrap] `child` in all of the inherited themes
 which are present between `context` and the specified `to`
 [BuildContext].

 The `to` context must be an ancestor of `context`. If `to` is not
 specified, all inherited themes up to the root of the widget tree are
 captured.

 After calling this method, the themes present between `context` and `to`
 are frozen for the provided `child`. If the themes (or their theme data)
 change in the original subtree, those changes will not be visible to
 the wrapped `child` - unless this method is called again to re-wrap the
 child.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `child`: `Widget`
- ``: `dynamic`
