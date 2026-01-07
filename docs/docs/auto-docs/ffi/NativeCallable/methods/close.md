# Method: `close`

## Description

Closes this callback and releases its resources.

 Further calls to existing [nativeFunction]s will result in undefined
 behavior.

 Subsequent calls to [close] will be ignored.

 It is safe to call [close] inside the [callback].

## Return Type
`void`

