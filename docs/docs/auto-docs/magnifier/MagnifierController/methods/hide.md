# Method: `hide`

## Description

Schedules a hide of the magnifier.

 If this [MagnifierController] has an [AnimationController],
 then [hide] reverses the animation controller and waits
 for the animation to complete. Then, if [removeFromOverlay]
 is true, remove the magnifier from the overlay.

 In general, `removeFromOverlay` should be true, unless
 the magnifier needs to preserve states between shows / hides.

 See also:

  * [removeFromOverlay] which removes the [OverlayEntry] from the [Overlay]
    synchronously.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
