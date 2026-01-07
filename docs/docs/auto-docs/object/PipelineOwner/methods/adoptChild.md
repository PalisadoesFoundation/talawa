# Method: `adoptChild`

## Description

Adds `child` to this [PipelineOwner].

 During the phases of frame production (see [RendererBinding.drawFrame]),
 the parent [PipelineOwner] will complete a phase for the nodes it owns
 directly before invoking the flush method corresponding to the current
 phase on its child [PipelineOwner]s. For example, during layout, the
 parent [PipelineOwner] will first lay out its own nodes before calling
 [flushLayout] on its children. During paint, it will first paint its own
 nodes before calling [flushPaint] on its children. This order also applies
 for all the other phases.

 No assumptions must be made about the order in which child
 [PipelineOwner]s are flushed.

 No new children may be added after the [PipelineOwner] has started calling
 [flushLayout] on any of its children until the end of the current frame.

 To remove a child, call [dropChild].

## Return Type
`void`

## Parameters

- `child`: `PipelineOwner`
