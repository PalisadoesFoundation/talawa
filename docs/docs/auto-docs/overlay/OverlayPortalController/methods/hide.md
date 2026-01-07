# Method: `hide`

## Description

Hide the [OverlayPortal]'s overlay child.

 Once hidden, the overlay child will be removed from the widget tree the
 next time the widget tree rebuilds, and stateful widgets in the overlay
 child may lose states as a result.

 This method should typically not be called while the widget tree is being
 rebuilt.

## Return Type
`void`

