# Overview for `DoubleTapGestureRecognizer`

## Description

Recognizes when the user has tapped the screen at the same location twice in
 quick succession.

 [DoubleTapGestureRecognizer] competes on pointer events when it
 has a non-null callback. If it has no callbacks, it is a no-op.

## Dependencies

- GestureRecognizer

## Members

- **onDoubleTapDown**: `GestureTapDownCallback?`
  A pointer has contacted the screen with a primary button at the same
 location twice in quick succession, which might be the start of a double
 tap.

 This triggers immediately after the down event of the second tap.

 If this recognizer doesn't win the arena, [onDoubleTapCancel] is called
 next. Otherwise, [onDoubleTap] is called next.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [TapDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onDoubleTapDown], which exposes this callback.

- **onDoubleTap**: `GestureDoubleTapCallback?`
  Called when the user has tapped the screen with a primary button at the
 same location twice in quick succession.

 This triggers when the pointer stops contacting the device after the
 second tap.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [GestureDetector.onDoubleTap], which exposes this callback.

- **onDoubleTapCancel**: `GestureTapCancelCallback?`
  A pointer that previously triggered [onDoubleTapDown] will not end up
 causing a double tap.

 This triggers once the gesture loses the arena if [onDoubleTapDown] has
 previously been triggered.

 If this recognizer wins the arena, [onDoubleTap] is called instead.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [GestureDetector.onDoubleTapCancel], which exposes this callback.

- **_doubleTapTimer**: `Timer?`
- **_firstTap**: `_TapTracker?`
- **_trackers**: `Map&lt;int, _TapTracker&gt;`
## Constructors

### Unnamed Constructor
Create a gesture recognizer for double taps.

 

