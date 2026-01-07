# Overview for `DelayedMultiDragGestureRecognizer`

## Description

Recognizes movement both horizontally and vertically on a per-pointer basis
 after a delay.

 In contrast to [ImmediateMultiDragGestureRecognizer],
 [DelayedMultiDragGestureRecognizer] waits for a [delay] before recognizing
 the drag. If the pointer moves more than [kTouchSlop] before the delay
 expires, the gesture is not recognized.

 In contrast to [PanGestureRecognizer], [DelayedMultiDragGestureRecognizer]
 watches each pointer separately, which means multiple drags can be
 recognized concurrently if multiple pointers are in contact with the screen.

 See also:

  * [ImmediateMultiDragGestureRecognizer], a similar recognizer but without
    the delay.
  * [PanGestureRecognizer], which recognizes only one drag gesture at a time,
    regardless of how many fingers are involved.

## Dependencies

- MultiDragGestureRecognizer

## Members

- **delay**: `Duration`
  The amount of time the pointer must remain in the same place for the drag
 to be recognized.

## Constructors

### Unnamed Constructor
Creates a drag recognizer that works on a per-pointer basis after a delay.

 In order for a drag to be recognized by this recognizer, the pointer must
 remain in the same place for [delay] (up to [kTouchSlop]). The [delay]
 defaults to [kLongPressTimeout] to match [LongPressGestureRecognizer] but
 can be changed for specific behaviors.

 

