# Method: `dropChild`

## Description

Removes a child [PipelineOwner] previously added via [adoptChild].

 This node will cease to call the flush methods on the `child` during frame
 production.

 No children may be removed after the [PipelineOwner] has started calling
 [flushLayout] on any of its children until the end of the current frame.

## Return Type
`void`

## Parameters

- `child`: `PipelineOwner`
