# Overview for `DragDownDetails`

## Description

Details object for callbacks that use [GestureDragDownCallback].

 See also:

  * [DragGestureRecognizer.onDown], which uses [GestureDragDownCallback].
  * [DragStartDetails], the details for [GestureDragStartCallback].
  * [DragUpdateDetails], the details for [GestureDragUpdateCallback].
  * [DragEndDetails], the details for [GestureDragEndCallback].

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer contacted the screen.

 Defaults to the origin if not specified in the constructor.

 See also:

  * [localPosition], which is the [globalPosition] transformed to the
    coordinate space of the event receiver.

- **localPosition**: `Offset`
  The local position in the coordinate system of the event receiver at
 which the pointer contacted the screen.

 Defaults to [globalPosition] if not specified in the constructor.

## Constructors

### Unnamed Constructor
Creates details for a [GestureDragDownCallback].

