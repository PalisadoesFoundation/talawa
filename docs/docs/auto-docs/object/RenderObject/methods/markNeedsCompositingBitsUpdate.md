# Method: `markNeedsCompositingBitsUpdate`

## Description

Mark the compositing state for this render object as dirty.

 This is called to indicate that the value for [needsCompositing] needs to
 be recomputed during the next [PipelineOwner.flushCompositingBits] engine
 phase.

 When the subtree is mutated, we need to recompute our
 [needsCompositing] bit, and some of our ancestors need to do the
 same (in case ours changed in a way that will change theirs). To
 this end, [adoptChild] and [dropChild] call this method, and, as
 necessary, this method calls the parent's, etc, walking up the
 tree to mark all the nodes that need updating.

 This method does not schedule a rendering frame, because since
 it cannot be the case that _only_ the compositing bits changed,
 something else will have scheduled a frame for us.

## Return Type
`void`

