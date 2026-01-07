# Method: `disposeMacro`

## Description

Disposes a macro [instance] by its identifier.

 All macros should be disposed once expanded to prevent memory leaks in the
 client macro executor.

 This is a fire and forget API, it does not happen synchronously but there
 is no reason to wait for it to complete, and the client does not send a
 response.

## Return Type
`void`

## Parameters

- `instance`: `MacroInstanceIdentifier`
