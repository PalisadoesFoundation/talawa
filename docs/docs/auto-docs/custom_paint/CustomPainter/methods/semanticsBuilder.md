# Method: `semanticsBuilder`

## Description

Returns a function that builds semantic information for the picture drawn
 by this painter.

 If the returned function is null, this painter will not contribute new
 [SemanticsNode]s to the semantics tree and the [CustomPaint] corresponding
 to this painter will not create a semantics boundary. However, if the
 child of a [CustomPaint] is not null, the child may contribute
 [SemanticsNode]s to the tree.

 See also:

  * [SemanticsConfiguration.isSemanticBoundary], which causes new
    [SemanticsNode]s to be added to the semantics tree.
  * [RenderCustomPaint], which uses this getter to build semantics.

## Return Type
`SemanticsBuilderCallback?`

