# Method: `defaultColor`

## Description

Returns null if [enabled] and [disabled] are null.
 Otherwise, returns a [WidgetStateProperty] that resolves to [disabled]
 when [WidgetState.disabled] is active, and [enabled] otherwise.

 A convenience method for subclasses.

## Return Type
`WidgetStateProperty<Color?>?`

## Parameters

- `enabled`: `Color?`
- `disabled`: `Color?`
