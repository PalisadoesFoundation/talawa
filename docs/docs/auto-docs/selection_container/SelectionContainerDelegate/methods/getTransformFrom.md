# Method: `getTransformFrom`

## Description

Gets the paint transform from the [Selectable] child to
 [SelectionContainer] of this delegate.

 Returns a matrix that maps the [Selectable] paint coordinate system to the
 coordinate system of [SelectionContainer].

 Can only be called after [SelectionContainer] is laid out.

## Return Type
`Matrix4`

## Parameters

- `child`: `Selectable`
