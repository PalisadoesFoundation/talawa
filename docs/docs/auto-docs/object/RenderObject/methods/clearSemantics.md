# Method: `clearSemantics`

## Description

Removes all semantics from this render object and its descendants.

 Should only be called on objects whose [parent] is not a [RenderObject].

 Override this method if you instantiate new [SemanticsNode]s in an
 overridden [assembleSemanticsNode] method, to dispose of those nodes.

## Return Type
`void`

