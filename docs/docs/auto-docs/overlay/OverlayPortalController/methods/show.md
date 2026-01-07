# Method: `show`

## Description

Show the overlay child of the [OverlayPortal] this controller is attached
 to, at the top of the target [Overlay].

 When there are more than one [OverlayPortal]s that target the same
 [Overlay], the overlay child of the last [OverlayPortal] to have called
 [show] appears at the top level, unobstructed.

 If [isShowing] is already true, calling this method brings the overlay
 child it controls to the top.

 This method should typically not be called while the widget tree is being
 rebuilt.

## Return Type
`void`

