# Overview for `LongPressGestureRecognizer`

## Description

Recognizes when the user has pressed down at the same location for a long
 period of time.

 The gesture must not deviate in position from its touch down point for 500ms
 until it's recognized. Once the gesture is accepted, the finger can be
 moved, triggering [onLongPressMoveUpdate] callbacks, unless the
 [postAcceptSlopTolerance] constructor argument is specified.

 [LongPressGestureRecognizer] may compete on pointer events of
 [kPrimaryButton], [kSecondaryButton], and/or [kTertiaryButton] if at least
 one corresponding callback is non-null. If it has no callbacks, it is a no-op.

## Dependencies

- PrimaryPointerGestureRecognizer

## Members

- **_longPressAccepted**: `bool`
- **_longPressOrigin**: `OffsetPair?`
- **_initialButtons**: `int?`
- **onLongPressDown**: `GestureLongPressDownCallback?`
  Called when a pointer has contacted the screen at a particular location
 with a primary button, which might be the start of a long-press.

 This triggers after the pointer down event.

 If this recognizer doesn't win the arena, [onLongPressCancel] is called
 next. Otherwise, [onLongPressStart] is called next.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryLongPressDown], a similar callback but for a secondary button.
  * [onTertiaryLongPressDown], a similar callback but for a tertiary button.
  * [LongPressDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onLongPressDown], which exposes this callback in a widget.

- **onLongPressCancel**: `GestureLongPressCancelCallback?`
  Called when a pointer that previously triggered [onLongPressDown] will
 not end up causing a long-press.

 This triggers once the gesture loses the arena if [onLongPressDown] has
 previously been triggered.

 If this recognizer wins the arena, [onLongPressStart] and [onLongPress]
 are called instead.

 If the gesture is deactivated due to [postAcceptSlopTolerance] having
 been exceeded, this callback will not be called, since the gesture will
 have already won the arena at that point.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture by a primary button has been recognized.

 This is equivalent to (and is called immediately after) [onLongPressStart].
 The only difference between the two is that this callback does not
 contain details of the position at which the pointer initially contacted
 the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture by a primary button has been recognized.

 This is equivalent to (and is called immediately before) [onLongPress].
 The only difference between the two is that this callback contains
 details of the position at which the pointer initially contacted the
 screen, whereas [onLongPress] does not.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressStartDetails], which is passed as an argument to this callback.

- **onLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  Called when moving after the long press by a primary button is recognized.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressMoveUpdateDetails], which is passed as an argument to this
    callback.

- **onLongPressUp**: `GestureLongPressUpCallback?`
  Called when the pointer stops contacting the screen after a long-press
 by a primary button.

 This is equivalent to (and is called immediately after) [onLongPressEnd].
 The only difference between the two is that this callback does not
 contain details of the state of the pointer when it stopped contacting
 the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onLongPressEnd**: `GestureLongPressEndCallback?`
  Called when the pointer stops contacting the screen after a long-press
 by a primary button.

 This is equivalent to (and is called immediately before) [onLongPressUp].
 The only difference between the two is that this callback contains
 details of the state of the pointer when it stopped contacting the
 screen, whereas [onLongPressUp] does not.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressEndDetails], which is passed as an argument to this
    callback.

- **onSecondaryLongPressDown**: `GestureLongPressDownCallback?`
  Called when a pointer has contacted the screen at a particular location
 with a secondary button, which might be the start of a long-press.

 This triggers after the pointer down event.

 If this recognizer doesn't win the arena, [onSecondaryLongPressCancel] is
 called next. Otherwise, [onSecondaryLongPressStart] is called next.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onLongPressDown], a similar callback but for a primary button.
  * [onTertiaryLongPressDown], a similar callback but for a tertiary button.
  * [LongPressDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onSecondaryLongPressDown], which exposes this callback
    in a widget.

- **onSecondaryLongPressCancel**: `GestureLongPressCancelCallback?`
  Called when a pointer that previously triggered [onSecondaryLongPressDown]
 will not end up causing a long-press.

 This triggers once the gesture loses the arena if
 [onSecondaryLongPressDown] has previously been triggered.

 If this recognizer wins the arena, [onSecondaryLongPressStart] and
 [onSecondaryLongPress] are called instead.

 If the gesture is deactivated due to [postAcceptSlopTolerance] having
 been exceeded, this callback will not be called, since the gesture will
 have already won the arena at that point.

 See also:

  * [kSecondaryButton], the button this callback responds to.

- **onSecondaryLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture by a secondary button has been
 recognized.

 This is equivalent to (and is called immediately after)
 [onSecondaryLongPressStart]. The only difference between the two is that
 this callback does not contain details of the position at which the
 pointer initially contacted the screen.

 See also:

  * [kSecondaryButton], the button this callback responds to.

- **onSecondaryLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture by a secondary button has been recognized.

 This is equivalent to (and is called immediately before)
 [onSecondaryLongPress]. The only difference between the two is that this
 callback contains details of the position at which the pointer initially
 contacted the screen, whereas [onSecondaryLongPress] does not.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressStartDetails], which is passed as an argument to this
    callback.

- **onSecondaryLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  Called when moving after the long press by a secondary button is
 recognized.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressMoveUpdateDetails], which is passed as an argument to this
    callback.

- **onSecondaryLongPressUp**: `GestureLongPressUpCallback?`
  Called when the pointer stops contacting the screen after a long-press by
 a secondary button.

 This is equivalent to (and is called immediately after)
 [onSecondaryLongPressEnd]. The only difference between the two is that
 this callback does not contain details of the state of the pointer when
 it stopped contacting the screen.

 See also:

  * [kSecondaryButton], the button this callback responds to.

- **onSecondaryLongPressEnd**: `GestureLongPressEndCallback?`
  Called when the pointer stops contacting the screen after a long-press by
 a secondary button.

 This is equivalent to (and is called immediately before)
 [onSecondaryLongPressUp]. The only difference between the two is that
 this callback contains details of the state of the pointer when it
 stopped contacting the screen, whereas [onSecondaryLongPressUp] does not.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressEndDetails], which is passed as an argument to this callback.

- **onTertiaryLongPressDown**: `GestureLongPressDownCallback?`
  Called when a pointer has contacted the screen at a particular location
 with a tertiary button, which might be the start of a long-press.

 This triggers after the pointer down event.

 If this recognizer doesn't win the arena, [onTertiaryLongPressCancel] is
 called next. Otherwise, [onTertiaryLongPressStart] is called next.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [onLongPressDown], a similar callback but for a primary button.
  * [onSecondaryLongPressDown], a similar callback but for a secondary button.
  * [LongPressDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onTertiaryLongPressDown], which exposes this callback
    in a widget.

- **onTertiaryLongPressCancel**: `GestureLongPressCancelCallback?`
  Called when a pointer that previously triggered [onTertiaryLongPressDown]
 will not end up causing a long-press.

 This triggers once the gesture loses the arena if
 [onTertiaryLongPressDown] has previously been triggered.

 If this recognizer wins the arena, [onTertiaryLongPressStart] and
 [onTertiaryLongPress] are called instead.

 If the gesture is deactivated due to [postAcceptSlopTolerance] having
 been exceeded, this callback will not be called, since the gesture will
 have already won the arena at that point.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onTertiaryLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture by a tertiary button has been
 recognized.

 This is equivalent to (and is called immediately after)
 [onTertiaryLongPressStart]. The only difference between the two is that
 this callback does not contain details of the position at which the
 pointer initially contacted the screen.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onTertiaryLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture by a tertiary button has been recognized.

 This is equivalent to (and is called immediately before)
 [onTertiaryLongPress]. The only difference between the two is that this
 callback contains details of the position at which the pointer initially
 contacted the screen, whereas [onTertiaryLongPress] does not.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressStartDetails], which is passed as an argument to this
    callback.

- **onTertiaryLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  Called when moving after the long press by a tertiary button is
 recognized.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressMoveUpdateDetails], which is passed as an argument to this
    callback.

- **onTertiaryLongPressUp**: `GestureLongPressUpCallback?`
  Called when the pointer stops contacting the screen after a long-press by
 a tertiary button.

 This is equivalent to (and is called immediately after)
 [onTertiaryLongPressEnd]. The only difference between the two is that
 this callback does not contain details of the state of the pointer when
 it stopped contacting the screen.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onTertiaryLongPressEnd**: `GestureLongPressEndCallback?`
  Called when the pointer stops contacting the screen after a long-press by
 a tertiary button.

 This is equivalent to (and is called immediately before)
 [onTertiaryLongPressUp]. The only difference between the two is that
 this callback contains details of the state of the pointer when it
 stopped contacting the screen, whereas [onTertiaryLongPressUp] does not.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressEndDetails], which is passed as an argument to this callback.

- **_velocityTracker**: `VelocityTracker?`
## Constructors

### Unnamed Constructor
Creates a long-press gesture recognizer.

 Consider assigning the [onLongPressStart] callback after creating this
 object.

 The [postAcceptSlopTolerance] argument can be used to specify a maximum
 allowed distance for the gesture to deviate from the starting point once
 the long press has triggered. If the gesture deviates past that point,
 subsequent callbacks ([onLongPressMoveUpdate], [onLongPressUp],
 [onLongPressEnd]) will stop. Defaults to null, which means the gesture
 can be moved without limit once the long press is accepted.

 The [duration] argument can be used to overwrite the default duration
 after which the long press will be recognized.

 

 

