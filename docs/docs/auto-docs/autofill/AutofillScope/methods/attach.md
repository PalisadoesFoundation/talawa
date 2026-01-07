# Method: `attach`

## Description

Allows a [TextInputClient] to attach to this scope. This method should be
 called in lieu of [TextInput.attach], when the [TextInputClient] wishes to
 participate in autofill.

## Return Type
`TextInputConnection`

## Parameters

- `trigger`: `TextInputClient`
- `configuration`: `TextInputConfiguration`
