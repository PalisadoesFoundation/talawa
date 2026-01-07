# Method: `needsCompositing`

## Description

Whether we or one of our descendants has a compositing layer.

 If this node needs compositing as indicated by this bit, then all ancestor
 nodes will also need compositing.

 Only legal to call after [PipelineOwner.flushLayout] and
 [PipelineOwner.flushCompositingBits] have been called.

## Return Type
`bool`

