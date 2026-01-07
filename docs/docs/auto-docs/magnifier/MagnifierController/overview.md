# Overview for `MagnifierController`

## Description

A controller for a magnifier.

 [MagnifierController]'s main benefit over holding a raw [OverlayEntry] is that
 [MagnifierController] will handle logic around waiting for a magnifier to animate in or out.

 If a magnifier chooses to have an entry / exit animation, it should provide the animation
 controller to [MagnifierController.animationController]. [MagnifierController] will then drive
 the [AnimationController] and wait for it to be complete before removing it from the
 [Overlay].

 To check the status of the magnifier, see [MagnifierController.shown].

## Members

- **animationController**: `AnimationController?`
  The controller that will be driven in / out when show / hide is triggered,
 respectively.

- **_overlayEntry**: `OverlayEntry?`
## Constructors

### Unnamed Constructor
If there is no in / out animation for the magnifier, [animationController] should be left
 null.

