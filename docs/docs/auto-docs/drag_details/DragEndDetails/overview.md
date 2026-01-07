# Overview for `DragEndDetails`

## Description

Details object for callbacks that use [GestureDragEndCallback].

 See also:

  * [DragGestureRecognizer.onEnd], which uses [GestureDragEndCallback].
  * [DragDownDetails], the details for [GestureDragDownCallback].
  * [DragStartDetails], the details for [GestureDragStartCallback].
  * [DragUpdateDetails], the details for [GestureDragUpdateCallback].

## Members

- **velocity**: `Velocity`
  The velocity the pointer was moving when it stopped contacting the screen.

 Defaults to zero if not specified in the constructor.

- **primaryVelocity**: `double?`
  The velocity the pointer was moving along the primary axis when it stopped
 contacting the screen, in logical pixels per second.

 If the [GestureDragEndCallback] is for a one-dimensional drag (e.g., a
 horizontal or vertical drag), then this value contains the component of
 [velocity] along the primary axis (e.g., horizontal or vertical,
 respectively). Otherwise, if the [GestureDragEndCallback] is for a
 two-dimensional drag (e.g., a pan), then this value is null.

 Defaults to null if not specified in the constructor.

- **globalPosition**: `Offset`
  The global position the pointer is located at when the drag
 gesture has been completed.

 Defaults to the origin if not specified in the constructor.

 See also:

  * [localPosition], which is the [globalPosition] transformed to the
    coordinate space of the event receiver.

- **localPosition**: `Offset`
  The local position in the coordinate system of the event receiver when
 the drag gesture has been completed.

 Defaults to [globalPosition] if not specified in the constructor.

## Constructors

### Unnamed Constructor
Creates details for a [GestureDragEndCallback].

 If [primaryVelocity] is non-null, its value must match one of the
 coordinates of `velocity.pixelsPerSecond` and the other coordinate
 must be zero.

