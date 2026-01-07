# Overview for `LongPressMoveUpdateDetails`

## Description

Details for callbacks that use [GestureLongPressMoveUpdateCallback].

 See also:

  * [LongPressGestureRecognizer.onLongPressMoveUpdate], which uses [GestureLongPressMoveUpdateCallback].
  * [LongPressEndDetails], the details for [GestureLongPressEndCallback]
  * [LongPressStartDetails], the details for [GestureLongPressStartCallback].

## Members

- **globalPosition**: `Offset`
  The global position of the pointer when it triggered this update.

- **localPosition**: `Offset`
  The local position of the pointer when it triggered this update.

- **offsetFromOrigin**: `Offset`
  A delta offset from the point where the long press drag initially contacted
 the screen to the point where the pointer is currently located (the
 present [globalPosition]) when this callback is triggered.

- **localOffsetFromOrigin**: `Offset`
  A local delta offset from the point where the long press drag initially contacted
 the screen to the point where the pointer is currently located (the
 present [localPosition]) when this callback is triggered.

## Constructors

### Unnamed Constructor
Creates the details for a [GestureLongPressMoveUpdateCallback].

