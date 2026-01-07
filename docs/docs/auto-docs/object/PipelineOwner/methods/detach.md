# Method: `detach`

## Description

Mark this [PipelineOwner] as detached.

 Typically, this is only called directly on the root [PipelineOwner].
 Children are automatically detached from their parent's [PipelineManifold]
 when [dropChild] is called.

## Return Type
`void`

