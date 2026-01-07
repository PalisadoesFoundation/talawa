# Overview for `LongPressEndDetails`

## Description

Details for callbacks that use [GestureLongPressEndCallback].

 See also:

  * [LongPressGestureRecognizer.onLongPressEnd], which uses [GestureLongPressEndCallback].
  * [LongPressMoveUpdateDetails], the details for [GestureLongPressMoveUpdateCallback].
  * [LongPressStartDetails], the details for [GestureLongPressStartCallback].

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer lifted from the screen.

- **localPosition**: `Offset`
  The local position at which the pointer contacted the screen.

- **velocity**: `Velocity`
  The pointer's velocity when it stopped contacting the screen.

 Defaults to zero if not specified in the constructor.

## Constructors

### Unnamed Constructor
Creates the details for a [GestureLongPressEndCallback].

