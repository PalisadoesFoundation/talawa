# Method: `describeForError`

## Description

Adds a debug representation of a [RenderObject] optimized for including in
 error messages.

 The default [style] of [DiagnosticsTreeStyle.shallow] ensures that all of
 the properties of the render object are included in the error output but
 none of the children of the object are.

 You should always include a RenderObject in an error message if it is the
 [RenderObject] causing the failure or contract violation of the error.

## Return Type
`DiagnosticsNode`

## Parameters

- `name`: `String`
- ``: `dynamic`
