# Overview for `DragStartDetails`

## Description

Details object for callbacks that use [GestureDragStartCallback].

 See also:

  * [DragGestureRecognizer.onStart], which uses [GestureDragStartCallback].
  * [DragDownDetails], the details for [GestureDragDownCallback].
  * [DragUpdateDetails], the details for [GestureDragUpdateCallback].
  * [DragEndDetails], the details for [GestureDragEndCallback].

## Members

- **sourceTimeStamp**: `Duration?`
  Recorded timestamp of the source pointer event that triggered the drag
 event.

 Could be null if triggered from proxied events such as accessibility.

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

- **kind**: `PointerDeviceKind?`
  The kind of the device that initiated the event.

## Constructors

### Unnamed Constructor
Creates details for a [GestureDragStartCallback].

