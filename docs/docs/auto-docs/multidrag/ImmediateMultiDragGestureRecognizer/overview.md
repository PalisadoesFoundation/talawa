# Overview for `ImmediateMultiDragGestureRecognizer`

## Description

Recognizes movement both horizontally and vertically on a per-pointer basis.

 In contrast to [PanGestureRecognizer], [ImmediateMultiDragGestureRecognizer]
 watches each pointer separately, which means multiple drags can be
 recognized concurrently if multiple pointers are in contact with the screen.

 See also:

  * [PanGestureRecognizer], which recognizes only one drag gesture at a time,
    regardless of how many fingers are involved.
  * [HorizontalMultiDragGestureRecognizer], which only recognizes drags that
    start horizontally.
  * [VerticalMultiDragGestureRecognizer], which only recognizes drags that
    start vertically.
  * [DelayedMultiDragGestureRecognizer], which only recognizes drags that
    start after a long-press gesture.

## Dependencies

- MultiDragGestureRecognizer

## Constructors

### Unnamed Constructor
Create a gesture recognizer for tracking multiple pointers at once.

 

