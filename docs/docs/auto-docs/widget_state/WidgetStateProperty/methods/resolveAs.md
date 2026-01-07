# Method: `resolveAs`

## Description

Resolves the value for the given set of states if `value` is a
 [WidgetStateProperty], otherwise returns the value itself.

 This is useful for widgets that have parameters which can optionally be a
 [WidgetStateProperty]. For example, [InkWell.mouseCursor] can be a
 [MouseCursor] or a [WidgetStateProperty&lt;MouseCursor&gt;].

## Return Type
`T`

## Parameters

- `value`: `T`
- `states`: `Set&lt;WidgetState&gt;`
