# Method: `getTransformTo`

## Description

Gets the paint transform from the [SelectionContainer] of this delegate to
 the `ancestor`.

 Returns a matrix that maps the [SelectionContainer] paint coordinate
 system to the coordinate system of `ancestor`.

 If `ancestor` is null, this method returns a matrix that maps from the
 local paint coordinate system to the coordinate system of the
 [PipelineOwner.rootNode].

 Can only be called after [SelectionContainer] is laid out.

## Return Type
`Matrix4`

## Parameters

- `ancestor`: `RenderObject?`
