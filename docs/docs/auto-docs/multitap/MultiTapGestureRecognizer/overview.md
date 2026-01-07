# Overview for `MultiTapGestureRecognizer`

## Description

Recognizes taps on a per-pointer basis.

 [MultiTapGestureRecognizer] considers each sequence of pointer events that
 could constitute a tap independently of other pointers: For example, down-1,
 down-2, up-1, up-2 produces two taps, on up-1 and up-2.

 See also:

  * [TapGestureRecognizer]

## Dependencies

- GestureRecognizer

## Members

- **onTapDown**: `GestureMultiTapDownCallback?`
  A pointer that might cause a tap has contacted the screen at a particular
 location.

- **onTapUp**: `GestureMultiTapUpCallback?`
  A pointer that will trigger a tap has stopped contacting the screen at a
 particular location.

- **onTap**: `GestureMultiTapCallback?`
  A tap has occurred.

- **onTapCancel**: `GestureMultiTapCancelCallback?`
  The pointer that previously triggered [onTapDown] will not end up causing
 a tap.

- **longTapDelay**: `Duration`
  The amount of time between [onTapDown] and [onLongTapDown].

- **onLongTapDown**: `GestureMultiTapDownCallback?`
  A pointer that might cause a tap is still in contact with the screen at a
 particular location after [longTapDelay].

- **_gestureMap**: `Map&lt;int, _TapGesture&gt;`
## Constructors

### Unnamed Constructor
Creates a multi-tap gesture recognizer.

 The [longTapDelay] defaults to [Duration.zero], which means
 [onLongTapDown] is called immediately after [onTapDown].

 

