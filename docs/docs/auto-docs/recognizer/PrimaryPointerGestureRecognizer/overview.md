# Overview for `PrimaryPointerGestureRecognizer`

## Description

A base class for gesture recognizers that track a single primary pointer.

 Gestures based on this class will stop tracking the gesture if the primary
 pointer travels beyond [preAcceptSlopTolerance] or [postAcceptSlopTolerance]
 pixels from the original contact point of the gesture.

 If the [preAcceptSlopTolerance] was breached before the gesture was accepted
 in the gesture arena, the gesture will be rejected.

## Dependencies

- OneSequenceGestureRecognizer

## Members

- **deadline**: `Duration?`
  If non-null, the recognizer will call [didExceedDeadline] after this
 amount of time has elapsed since starting to track the primary pointer.

 The [didExceedDeadline] will not be called if the primary pointer is
 accepted, rejected, or all pointers are up or canceled before [deadline].

- **preAcceptSlopTolerance**: `double?`
  The maximum distance in logical pixels the gesture is allowed to drift
 from the initial touch down position before the gesture is accepted.

 Drifting past the allowed slop amount causes the gesture to be rejected.

 Can be null to indicate that the gesture can drift for any distance.
 Defaults to 18 logical pixels.

- **postAcceptSlopTolerance**: `double?`
  The maximum distance in logical pixels the gesture is allowed to drift
 after the gesture has been accepted.

 Drifting past the allowed slop amount causes the gesture to stop tracking
 and signaling subsequent callbacks.

 Can be null to indicate that the gesture can drift for any distance.
 Defaults to 18 logical pixels.

- **_state**: `GestureRecognizerState`
- **_primaryPointer**: `int?`
- **_initialPosition**: `OffsetPair?`
- **_gestureAccepted**: `bool`
- **_timer**: `Timer?`
## Constructors

### Unnamed Constructor
Initializes the [deadline] field during construction of subclasses.

 

