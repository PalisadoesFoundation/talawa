# Method: `install`

## Description

Called when the route is inserted into the navigator.

 Uses this to populate [overlayEntries]. There must be at least one entry in
 this list after [install] has been invoked. The [Navigator] will be in charge
 to add them to the [Overlay] or remove them from it by calling
 [OverlayEntry.remove].

## Return Type
`void`

