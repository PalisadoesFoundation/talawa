# Method: `semanticsEnabled`

## Description

Whether [PipelineOwner]s connected to this [PipelineManifold] should
 collect semantics information and produce a semantics tree.

 The [PipelineManifold] notifies its listeners (managed with [addListener]
 and [removeListener]) when this property changes its value.

 See also:

  * [SemanticsBinding.semanticsEnabled], which [PipelineManifold]
    implementations typically use to back this property.

## Return Type
`bool`

