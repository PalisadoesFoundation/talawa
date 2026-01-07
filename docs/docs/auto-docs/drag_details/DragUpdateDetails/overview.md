# Overview for `DragUpdateDetails`

## Description

Details object for callbacks that use [GestureDragUpdateCallback].

 See also:

  * [DragGestureRecognizer.onUpdate], which uses [GestureDragUpdateCallback].
  * [DragDownDetails], the details for [GestureDragDownCallback].
  * [DragStartDetails], the details for [GestureDragStartCallback].
  * [DragEndDetails], the details for [GestureDragEndCallback].

## Members

- **sourceTimeStamp**: `Duration?`
  Recorded timestamp of the source pointer event that triggered the drag
 event.

 Could be null if triggered from proxied events such as accessibility.

- **delta**: `Offset`
  The amount the pointer has moved in the coordinate space of the event
 receiver since the previous update.

 If the [GestureDragUpdateCallback] is for a one-dimensional drag (e.g.,
 a horizontal or vertical drag), then this offset contains only the delta
 in that direction (i.e., the coordinate in the other direction is zero).

 Defaults to zero if not specified in the constructor.

- **primaryDelta**: `double?`
  The amount the pointer has moved along the primary axis in the coordinate
 space of the event receiver since the previous
 update.

 If the [GestureDragUpdateCallback] is for a one-dimensional drag (e.g.,
 a horizontal or vertical drag), then this value contains the component of
 [delta] along the primary axis (e.g., horizontal or vertical,
 respectively). Otherwise, if the [GestureDragUpdateCallback] is for a
 two-dimensional drag (e.g., a pan), then this value is null.

 Defaults to null if not specified in the constructor.

- **globalPosition**: `Offset`
  The pointer's global position when it triggered this update.

 See also:

  * [localPosition], which is the [globalPosition] transformed to the
    coordinate space of the event receiver.

- **localPosition**: `Offset`
  The local position in the coordinate system of the event receiver at
 which the pointer contacted the screen.

 Defaults to [globalPosition] if not specified in the constructor.

## Constructors

### Unnamed Constructor
Creates details for a [GestureDragUpdateCallback].

 If [primaryDelta] is non-null, then its value must match one of the
 coordinates of [delta] and the other coordinate must be zero.

