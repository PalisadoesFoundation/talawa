# Overview for `LongPressDownDetails`

## Description

Details for callbacks that use [GestureLongPressDownCallback].

 See also:

  * [LongPressGestureRecognizer.onLongPressDown], whose callback passes
    these details.
  * [LongPressGestureRecognizer.onSecondaryLongPressDown], whose callback
    passes these details.
  * [LongPressGestureRecognizer.onTertiaryLongPressDown], whose callback
    passes these details.

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer contacted the screen.

- **kind**: `PointerDeviceKind?`
  The kind of the device that initiated the event.

- **localPosition**: `Offset`
  The local position at which the pointer contacted the screen.

## Constructors

### Unnamed Constructor
Creates the details for a [GestureLongPressDownCallback].

 If the `localPosition` argument is not specified, it will default to the
 global position.

