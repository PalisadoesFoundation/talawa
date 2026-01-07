# Method: `pipelineOwnerOf`

## Description

Returns the [PipelineOwner] parent to which a child [View] should attach
 its [PipelineOwner] to.

 If `context` has a [View] ancestor, it returns the [PipelineOwner]
 responsible for managing the render tree of that view. If there is no
 [View] ancestor, [RendererBinding.rootPipelineOwner] is returned instead.

## Return Type
`PipelineOwner`

## Parameters

- `context`: `BuildContext`
