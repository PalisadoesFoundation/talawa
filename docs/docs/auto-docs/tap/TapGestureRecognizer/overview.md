# Overview for `TapGestureRecognizer`

## Description

Recognizes taps.

 Gesture recognizers take part in gesture arenas to enable potential gestures
 to be disambiguated from each other. This process is managed by a
 [GestureArenaManager].

 [TapGestureRecognizer] considers all the pointers involved in the pointer
 event sequence as contributing to one gesture. For this reason, extra
 pointer interactions during a tap sequence are not recognized as additional
 taps. For example, down-1, down-2, up-1, up-2 produces only one tap on up-1.

 [TapGestureRecognizer] competes on pointer events of [kPrimaryButton] only
 when it has at least one non-null `onTap*` callback, on events of
 [kSecondaryButton] only when it has at least one non-null `onSecondaryTap*`
 callback, and on events of [kTertiaryButton] only when it has at least
 one non-null `onTertiaryTap*` callback. If it has no callbacks, it is a
 no-op.

 
 The [allowedButtonsFilter] argument only gives this recognizer the
 ability to limit the buttons it accepts. It does not provide the
 ability to recognize any buttons beyond the ones it already accepts:
 kPrimaryButton, kSecondaryButton or kTertiaryButton. Therefore, a
 combined value of `kPrimaryButton & kSecondaryButton` would be ignored,
 but `kPrimaryButton | kSecondaryButton` would be allowed, as long as
 only one of them is selected at a time.
 

 See also:

  * [GestureDetector.onTap], which uses this recognizer.
  * [MultiTapGestureRecognizer]

## Dependencies

- BaseTapGestureRecognizer

## Members

- **onTapDown**: `GestureTapDownCallback?`
  
 A pointer has contacted the screen at a particular location with a primary
 button, which might be the start of a tap.
 

 This triggers after the down event, once a short timeout ([deadline]) has
 elapsed, or once the gestures has won the arena, whichever comes first.

 If this recognizer doesn't win the arena, [onTapCancel] is called next.
 Otherwise, [onTapUp] is called next.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryTapDown], a similar callback but for a secondary button.
  * [onTertiaryTapDown], a similar callback but for a tertiary button.
  * [TapDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onTapDown], which exposes this callback.

- **onTapUp**: `GestureTapUpCallback?`
  
 A pointer has stopped contacting the screen at a particular location,
 which is recognized as a tap of a primary button.
 

 This triggers on the up event, if the recognizer wins the arena with it
 or has previously won, immediately followed by [onTap].

 If this recognizer doesn't win the arena, [onTapCancel] is called instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryTapUp], a similar callback but for a secondary button.
  * [onTertiaryTapUp], a similar callback but for a tertiary button.
  * [TapUpDetails], which is passed as an argument to this callback.
  * [GestureDetector.onTapUp], which exposes this callback.

- **onTap**: `GestureTapCallback?`
  A pointer has stopped contacting the screen, which is recognized as a tap
 of a primary button.

 This triggers on the up event, if the recognizer wins the arena with it
 or has previously won, immediately following [onTapUp].

 If this recognizer doesn't win the arena, [onTapCancel] is called instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryTap], a similar callback but for a secondary button.
  * [onTapUp], which has the same timing but with details.
  * [GestureDetector.onTap], which exposes this callback.

- **onTapMove**: `GestureTapMoveCallback?`
  A pointer that triggered a tap has moved.

 This callback is triggered after the tap gesture has been recognized and the pointer starts to move.

 If the pointer moves beyond the `postAcceptSlopTolerance` distance, the tap will be canceled.
 To make `onTapMove` more useful, consider setting `postAcceptSlopTolerance` to a larger value,
 or to `null` for no limit on movement.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [GestureDetector.onTapMove], which exposes this callback.

- **onTapCancel**: `GestureTapCancelCallback?`
  
 A pointer that previously triggered [onTapDown] will not end up causing
 a tap.
 

 This triggers once the gesture loses the arena if [onTapDown] has
 previously been triggered.

 If this recognizer wins the arena, [onTapUp] and [onTap] are called
 instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryTapCancel], a similar callback but for a secondary button.
  * [onTertiaryTapCancel], a similar callback but for a tertiary button.
  * [GestureDetector.onTapCancel], which exposes this callback.

- **onSecondaryTap**: `GestureTapCallback?`
  
 A pointer has stopped contacting the screen, which is recognized as a tap
 of a secondary button.
 

 This triggers on the up event, if the recognizer wins the arena with it or
 has previously won, immediately following [onSecondaryTapUp].

 If this recognizer doesn't win the arena, [onSecondaryTapCancel] is called
 instead.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onSecondaryTapUp], which has the same timing but with details.
  * [GestureDetector.onSecondaryTap], which exposes this callback.

- **onSecondaryTapDown**: `GestureTapDownCallback?`
  
 A pointer has contacted the screen at a particular location with a
 secondary button, which might be the start of a secondary tap.
 

 This triggers after the down event, once a short timeout ([deadline]) has
 elapsed, or once the gestures has won the arena, whichever comes first.

 If this recognizer doesn't win the arena, [onSecondaryTapCancel] is called
 next. Otherwise, [onSecondaryTapUp] is called next.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onTapDown], a similar callback but for a primary button.
  * [onTertiaryTapDown], a similar callback but for a tertiary button.
  * [TapDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onSecondaryTapDown], which exposes this callback.

- **onSecondaryTapUp**: `GestureTapUpCallback?`
  
 A pointer has stopped contacting the screen at a particular location,
 which is recognized as a tap of a secondary button.
 

 This triggers on the up event if the recognizer wins the arena with it
 or has previously won.

 If this recognizer doesn't win the arena, [onSecondaryTapCancel] is called
 instead.

 See also:

  * [onSecondaryTap], a handler triggered right after this one that doesn't
    pass any details about the tap.
  * [kSecondaryButton], the button this callback responds to.
  * [onTapUp], a similar callback but for a primary button.
  * [onTertiaryTapUp], a similar callback but for a tertiary button.
  * [TapUpDetails], which is passed as an argument to this callback.
  * [GestureDetector.onSecondaryTapUp], which exposes this callback.

- **onSecondaryTapCancel**: `GestureTapCancelCallback?`
  
 A pointer that previously triggered [onSecondaryTapDown] will not end up
 causing a tap.
 

 This triggers once the gesture loses the arena if [onSecondaryTapDown]
 has previously been triggered.

 If this recognizer wins the arena, [onSecondaryTapUp] is called instead.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onTapCancel], a similar callback but for a primary button.
  * [onTertiaryTapCancel], a similar callback but for a tertiary button.
  * [GestureDetector.onSecondaryTapCancel], which exposes this callback.

- **onTertiaryTapDown**: `GestureTapDownCallback?`
  A pointer has contacted the screen at a particular location with a
 tertiary button, which might be the start of a tertiary tap.

 This triggers after the down event, once a short timeout ([deadline]) has
 elapsed, or once the gestures has won the arena, whichever comes first.

 If this recognizer doesn't win the arena, [onTertiaryTapCancel] is called
 next. Otherwise, [onTertiaryTapUp] is called next.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [onTapDown], a similar callback but for a primary button.
  * [onSecondaryTapDown], a similar callback but for a secondary button.
  * [TapDownDetails], which is passed as an argument to this callback.
  * [GestureDetector.onTertiaryTapDown], which exposes this callback.

- **onTertiaryTapUp**: `GestureTapUpCallback?`
  A pointer has stopped contacting the screen at a particular location,
 which is recognized as a tap of a tertiary button.

 This triggers on the up event if the recognizer wins the arena with it
 or has previously won.

 If this recognizer doesn't win the arena, [onTertiaryTapCancel] is called
 instead.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [onTapUp], a similar callback but for a primary button.
  * [onSecondaryTapUp], a similar callback but for a secondary button.
  * [TapUpDetails], which is passed as an argument to this callback.
  * [GestureDetector.onTertiaryTapUp], which exposes this callback.

- **onTertiaryTapCancel**: `GestureTapCancelCallback?`
  A pointer that previously triggered [onTertiaryTapDown] will not end up
 causing a tap.

 This triggers once the gesture loses the arena if [onTertiaryTapDown]
 has previously been triggered.

 If this recognizer wins the arena, [onTertiaryTapUp] is called instead.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onTapCancel], a similar callback but for a primary button.
  * [onSecondaryTapCancel], a similar callback but for a secondary button.
  * [GestureDetector.onTertiaryTapCancel], which exposes this callback.

## Constructors

### Unnamed Constructor
Creates a tap gesture recognizer.

 

