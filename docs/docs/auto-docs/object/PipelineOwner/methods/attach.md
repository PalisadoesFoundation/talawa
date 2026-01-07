# Method: `attach`

## Description

Mark this [PipelineOwner] as attached to the given [PipelineManifold].

 Typically, this is only called directly on the root [PipelineOwner].
 Children are automatically attached to their parent's [PipelineManifold]
 when [adoptChild] is called.

## Return Type
`void`

## Parameters

- `manifold`: `PipelineManifold`
