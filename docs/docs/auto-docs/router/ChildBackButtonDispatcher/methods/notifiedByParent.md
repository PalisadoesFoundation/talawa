# Method: `notifiedByParent`

## Description

The parent of this child back button dispatcher decide to let this
 child to handle the invoke the callback request in
 [BackButtonDispatcher.invokeCallback].

 Return a boolean future with true if this child will handle the request;
 otherwise, return a boolean future with false.

## Return Type
`Future&lt;bool&gt;`

## Parameters

- `defaultValue`: `Future&lt;bool&gt;`
