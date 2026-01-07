# Overview for `TapMoveDetails`

## Description

Details object for callbacks that use [GestureTapMoveCallback].

 See also:

 * [GestureDetector.onTapMove], which receives this information.
 * [TapGestureRecognizer], which passes this information to one of its callbacks.

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer contacted the screen.

- **localPosition**: `Offset`
  The local position at which the pointer contacted the screen.

- **kind**: `PointerDeviceKind`
  The kind of the device that initiated the event.

- **delta**: `Offset`
  The amount the pointer has moved in the coordinate space of the
 event receiver since the previous update.

## Constructors

### Unnamed Constructor
Creates a [TapMoveDetails] data object.

