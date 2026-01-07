# Method: `flushSemantics`

## Description

Update the semantics for render objects marked as needing a semantics
 update.

 Initially, only the root node, as scheduled by
 [RenderObject.scheduleInitialSemantics], needs a semantics update.

 This function is one of the core stages of the rendering pipeline. The
 semantics are compiled after painting and only after
 [RenderObject.scheduleInitialSemantics] has been called.

 See [RendererBinding] for an example of how this function is used.

## Return Type
`void`

