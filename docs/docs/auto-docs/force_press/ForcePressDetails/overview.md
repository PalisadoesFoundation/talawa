# Overview for `ForcePressDetails`

## Description

Details object for callbacks that use [GestureForcePressStartCallback],
 [GestureForcePressPeakCallback], [GestureForcePressEndCallback] or
 [GestureForcePressUpdateCallback].

 See also:

  * [ForcePressGestureRecognizer.onStart], [ForcePressGestureRecognizer.onPeak],
    [ForcePressGestureRecognizer.onEnd], and [ForcePressGestureRecognizer.onUpdate]
    which use [ForcePressDetails].

## Members

- **globalPosition**: `Offset`
  The global position at which the function was called.

- **localPosition**: `Offset`
  The local position at which the function was called.

- **pressure**: `double`
  The pressure of the pointer on the screen.

## Constructors

### Unnamed Constructor
Creates details for a [GestureForcePressStartCallback],
 [GestureForcePressPeakCallback] or [GestureForcePressEndCallback].

