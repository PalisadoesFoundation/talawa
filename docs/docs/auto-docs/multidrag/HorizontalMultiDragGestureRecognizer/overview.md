# Overview for `HorizontalMultiDragGestureRecognizer`

## Description

Recognizes movement in the horizontal direction on a per-pointer basis.

 In contrast to [HorizontalDragGestureRecognizer],
 [HorizontalMultiDragGestureRecognizer] watches each pointer separately,
 which means multiple drags can be recognized concurrently if multiple
 pointers are in contact with the screen.

 See also:

  * [HorizontalDragGestureRecognizer], a gesture recognizer that just
    looks at horizontal movement.
  * [ImmediateMultiDragGestureRecognizer], a similar recognizer, but without
    the limitation that the drag must start horizontally.
  * [VerticalMultiDragGestureRecognizer], which only recognizes drags that
    start vertically.

## Dependencies

- MultiDragGestureRecognizer

## Constructors

### Unnamed Constructor
Create a gesture recognizer for tracking multiple pointers at once
 but only if they first move horizontally.

 

