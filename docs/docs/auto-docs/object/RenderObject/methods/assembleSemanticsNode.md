# Method: `assembleSemanticsNode`

## Description

Assemble the [SemanticsNode] for this [RenderObject].

 If [describeSemanticsConfiguration] sets
 [SemanticsConfiguration.isSemanticBoundary] to true, this method is called
 with the `node` created for this [RenderObject], the `config` to be
 applied to that node and the `children` [SemanticsNode]s that descendants
 of this RenderObject have generated.

 By default, the method will annotate `node` with `config` and add the
 `children` to it.

 Subclasses can override this method to add additional [SemanticsNode]s
 to the tree. If new [SemanticsNode]s are instantiated in this method
 they must be disposed in [clearSemantics].

## Return Type
`void`

## Parameters

- `node`: `SemanticsNode`
- `config`: `SemanticsConfiguration`
- `children`: `Iterable&lt;SemanticsNode&gt;`
