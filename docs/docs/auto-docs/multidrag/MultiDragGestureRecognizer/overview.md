# Overview for `MultiDragGestureRecognizer`

## Description

Recognizes movement on a per-pointer basis.

 In contrast to [DragGestureRecognizer], [MultiDragGestureRecognizer] watches
 each pointer separately, which means multiple drags can be recognized
 concurrently if multiple pointers are in contact with the screen.

 [MultiDragGestureRecognizer] is not intended to be used directly. Instead,
 consider using one of its subclasses to recognize specific types for drag
 gestures.

 See also:

  * [ImmediateMultiDragGestureRecognizer], the most straight-forward variant
    of multi-pointer drag gesture recognizer.
  * [HorizontalMultiDragGestureRecognizer], which only recognizes drags that
    start horizontally.
  * [VerticalMultiDragGestureRecognizer], which only recognizes drags that
    start vertically.
  * [DelayedMultiDragGestureRecognizer], which only recognizes drags that
    start after a long-press gesture.

## Dependencies

- GestureRecognizer

## Members

- **onStart**: `GestureMultiDragStartCallback?`
  Called when this class recognizes the start of a drag gesture.

 The remaining notifications for this drag gesture are delivered to the
 [Drag] object returned by this callback.

- **_pointers**: `Map&lt;int, MultiDragPointerState&gt;?`
## Constructors

### Unnamed Constructor
Initialize the object.

 

