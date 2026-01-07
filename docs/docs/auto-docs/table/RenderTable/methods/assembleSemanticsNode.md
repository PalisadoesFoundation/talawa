# Method: `assembleSemanticsNode`

## Description

Provides custom semantics for tables by generating nodes for rows and maybe cells.

 Table rows are not RenderObjects, so their semantics nodes must be created separately.
 And if a cell has mutiple semantics node or has a different semantic role, we create
 a new semantics node to wrap it.

## Return Type
`void`

## Parameters

- `node`: `SemanticsNode`
- `config`: `SemanticsConfiguration`
- `children`: `Iterable&lt;SemanticsNode&gt;`
