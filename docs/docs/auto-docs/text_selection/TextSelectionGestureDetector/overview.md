# Overview for `TextSelectionGestureDetector`

## Description

A gesture detector to respond to non-exclusive event chains for a text field.

 An ordinary [GestureDetector] configured to handle events like tap and
 double tap will only recognize one or the other. This widget detects both:
 the first tap and then any subsequent taps that occurs within a time limit
 after the first.

 See also:

  * [TextField], a Material text field which uses this gesture detector.
  * [CupertinoTextField], a Cupertino text field which uses this gesture
    detector.

## Dependencies

- StatefulWidget

## Members

- **onTapTrackStart**: `VoidCallback?`
  
 Callback used to indicate that a tap tracking has started upon
 a [PointerDownEvent].
 

- **onTapTrackReset**: `VoidCallback?`
  
 Callback used to indicate that a tap tracking has been reset which
 happens on the next [PointerDownEvent] after the timer between two taps
 elapses, the recognizer loses the arena, the gesture is cancelled or
 the recognizer is disposed of.
 

- **onTapDown**: `GestureTapDragDownCallback?`
  Called for every tap down including every tap down that's part of a
 double click or a long press, except touches that include enough movement
 to not qualify as taps (e.g. pans and flings).

- **onForcePressStart**: `GestureForcePressStartCallback?`
  Called when a pointer has tapped down and the force of the pointer has
 just become greater than [ForcePressGestureRecognizer.startPressure].

- **onForcePressEnd**: `GestureForcePressEndCallback?`
  Called when a pointer that had previously triggered [onForcePressStart] is
 lifted off the screen.

- **onSecondaryTap**: `GestureTapCallback?`
  Called for a tap event with the secondary mouse button.

- **onSecondaryTapDown**: `GestureTapDownCallback?`
  Called for a tap down event with the secondary mouse button.

- **onSingleTapUp**: `GestureTapDragUpCallback?`
  Called for the first tap in a series of taps, consecutive taps do not call
 this method.

 For example, if the detector was configured with [onTapDown] and
 [onDoubleTapDown], three quick taps would be recognized as a single tap
 down, followed by a tap up, then a double tap down, followed by a single tap down.

- **onSingleTapCancel**: `GestureCancelCallback?`
  Called for each touch that becomes recognized as a gesture that is not a
 short tap, such as a long tap or drag. It is called at the moment when
 another gesture from the touch is recognized.

- **onUserTap**: `GestureTapCallback?`
  Called for the first tap in a series of taps when [onUserTapAlwaysCalled] is
 disabled, which is the default behavior.

 When [onUserTapAlwaysCalled] is enabled, this is called for every tap,
 including consecutive taps.

- **onSingleLongTapStart**: `GestureLongPressStartCallback?`
  Called for a single long tap that's sustained for longer than
 [kLongPressTimeout] but not necessarily lifted. Not called for a
 double-tap-hold, which calls [onDoubleTapDown] instead.

- **onSingleLongTapMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  Called after [onSingleLongTapStart] when the pointer is dragged.

- **onSingleLongTapEnd**: `GestureLongPressEndCallback?`
  Called after [onSingleLongTapStart] when the pointer is lifted.

- **onDoubleTapDown**: `GestureTapDragDownCallback?`
  Called after a momentary hold or a short tap that is close in space and
 time (within [kDoubleTapTimeout]) to a previous short tap.

- **onTripleTapDown**: `GestureTapDragDownCallback?`
  Called after a momentary hold or a short tap that is close in space and
 time (within [kDoubleTapTimeout]) to a previous double-tap.

- **onDragSelectionStart**: `GestureTapDragStartCallback?`
  Called when a mouse starts dragging to select text.

- **onDragSelectionUpdate**: `GestureTapDragUpdateCallback?`
  Called repeatedly as a mouse moves while dragging.

- **onDragSelectionEnd**: `GestureTapDragEndCallback?`
  Called when a mouse that was previously dragging is released.

- **onUserTapAlwaysCalled**: `bool`
  Whether [onUserTap] will be called for all taps including consecutive taps.

 Defaults to false, so [onUserTap] is only called for each distinct tap.

- **behavior**: `HitTestBehavior?`
  How this gesture detector should behave during hit testing.

 This defaults to [HitTestBehavior.deferToChild].

- **child**: `Widget`
  Child below this widget.

## Constructors

### Unnamed Constructor
Create a [TextSelectionGestureDetector].

 Multiple callbacks can be called for one sequence of input gesture.

