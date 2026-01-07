# Method: `detach`

## Description

Mark this layer as detached from its owner.

 Typically called only from the [parent]'s [detach], and by the [owner] to
 mark the root of a tree as detached.

 Subclasses with children should override this method to
 [detach] all their children after calling the inherited method,
 as in `super.`.

## Return Type
`void`

