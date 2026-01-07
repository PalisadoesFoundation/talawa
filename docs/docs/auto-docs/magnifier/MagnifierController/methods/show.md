# Method: `show`

## Description

Displays the magnifier.

 Returns a future that completes when the magnifier is fully shown, i.e. done
 with its entry animation.

 To control what overlays are shown in the magnifier, use `below`. See
 [overlayEntry] for more details on how to utilize `below`.

 If the magnifier already exists (i.e. [overlayEntry] != null), then [show]
 will replace the old overlay without playing an exit animation. Consider
 awaiting [hide] first, to animate from the old magnifier to the new one.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
