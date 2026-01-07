# Method: `removeFromOverlay`

## Description

Remove the [OverlayEntry] from the [Overlay].

 This method removes the [OverlayEntry] synchronously,
 regardless of exit animation: this leads to abrupt removals
 of [OverlayEntry]s with animations.

 To allow the [OverlayEntry] to play its exit animation, consider calling
 [hide] instead, with `removeFromOverlay` set to true, and optionally await
 the returned Future.

## Return Type
`void`

