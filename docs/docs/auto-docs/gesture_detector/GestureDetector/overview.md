# Overview for `GestureDetector`

## Description

A widget that detects gestures.

 Attempts to recognize gestures that correspond to its non-null callbacks.

 If this widget has a child, it defers to that child for its sizing behavior.
 If it does not have a child, it grows to fit the parent instead.

 

 By default a GestureDetector with an invisible child ignores touches;
 this behavior can be controlled with [behavior].

 GestureDetector also listens for accessibility events and maps
 them to the callbacks. To ignore accessibility events, set
 [excludeFromSemantics] to true.

 See <http://flutter.dev/to/gestures> for additional information.

 Material design applications typically react to touches with ink splash
 effects. The [InkWell] class implements this effect and can be used in place
 of a [GestureDetector] for handling taps.

 
 This example contains a black light bulb wrapped in a [GestureDetector]. It
 turns the light bulb yellow when the "TURN LIGHT ON" button is tapped by
 setting the `_lights` field, and off again when "TURN LIGHT OFF" is tapped.

 ** See code in examples/api/lib/widgets/gesture_detector/gesture_detector.0.dart **
 

 
 This example uses a [Container] that wraps a [GestureDetector] widget which
 detects a tap.

 Since the [GestureDetector] does not have a child, it takes on the size of its
 parent, making the entire area of the surrounding [Container] clickable. When
 tapped, the [Container] turns yellow by setting the `_color` field. When
 tapped again, it goes back to white.

 ** See code in examples/api/lib/widgets/gesture_detector/gesture_detector.1.dart **
 

 ### Troubleshooting

 Why isn't my parent [GestureDetector.onTap] method called?

 Given a parent [GestureDetector] with an onTap callback, and a child
 GestureDetector that also defines an onTap callback, when the inner
 GestureDetector is tapped, both GestureDetectors send a [GestureRecognizer]
 into the gesture arena. This is because the pointer coordinates are within the
 bounds of both GestureDetectors. The child GestureDetector wins in this
 scenario because it was the first to enter the arena, resolving as first come,
 first served. The child onTap is called, and the parent's is not as the gesture has
 been consumed.
 For more information on gesture disambiguation see:
 [Gesture disambiguation](https://flutter.dev/to/gesture-disambiguation).

 Setting [GestureDetector.behavior] to [HitTestBehavior.opaque]
 or [HitTestBehavior.translucent] has no impact on parent-child relationships:
 both GestureDetectors send a GestureRecognizer into the gesture arena, only one wins.

 Some callbacks (e.g. onTapDown) can fire before a recognizer wins the arena,
 and others (e.g. onTapCancel) fire even when it loses the arena. Therefore,
 the parent detector in the example above may call some of its callbacks even
 though it loses in the arena.

 
 This example uses a [GestureDetector] that wraps a green [Container] and a second
 GestureDetector that wraps a yellow Container. The second GestureDetector is
 a child of the green Container.
 Both GestureDetectors define an onTap callback. When the callback is called it
 adds a red border to the corresponding Container.

 When the green Container is tapped, it's parent GestureDetector enters
 the gesture arena. It wins because there is no competing GestureDetector and
 the green Container shows a red border.
 When the yellow Container is tapped, it's parent GestureDetector enters
 the gesture arena. The GestureDetector that wraps the green Container also
 enters the gesture arena (the pointer events coordinates are inside both
 GestureDetectors bounds). The GestureDetector that wraps the yellow Container
 wins because it was the first detector to enter the arena.

 This example sets [debugPrintGestureArenaDiagnostics] to true.
 This flag prints useful information about gesture arenas.

 Changing the [GestureDetector.behavior] property to [HitTestBehavior.translucent]
 or [HitTestBehavior.opaque] has no impact: both GestureDetectors send a [GestureRecognizer]
 into the gesture arena, only one wins.

 ** See code in examples/api/lib/widgets/gesture_detector/gesture_detector.2.dart **
 

 ## Debugging

 To see how large the hit test box of a [GestureDetector] is for debugging
 purposes, set [debugPaintPointersEnabled] to true.

 See also:

  * [Listener], a widget for listening to lower-level raw pointer events.
  * [MouseRegion], a widget that tracks the movement of mice, even when no
    button is pressed.
  * [RawGestureDetector], a widget that is used to detect custom gestures.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **onTapDown**: `GestureTapDownCallback?`
  A pointer that might cause a tap with a primary button has contacted the
 screen at a particular location.

 This is called after a short timeout, even if the winning gesture has not
 yet been selected. If the tap gesture wins, [onTapUp] will be called,
 otherwise [onTapCancel] will be called.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onTapUp**: `GestureTapUpCallback?`
  A pointer that will trigger a tap with a primary button has stopped
 contacting the screen at a particular location.

 This triggers immediately before [onTap] in the case of the tap gesture
 winning. If the tap gesture did not win, [onTapCancel] is called instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onTap**: `GestureTapCallback?`
  A tap with a primary button has occurred.

 This triggers when the tap gesture wins. If the tap gesture did not win,
 [onTapCancel] is called instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onTapUp], which is called at the same time but includes details
    regarding the pointer position.

- **onTapMove**: `GestureTapMoveCallback?`
  A pointer that triggered a tap has moved.

 This triggers when the pointer moves after the tap gesture has been recognized.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onTapCancel**: `GestureTapCancelCallback?`
  The pointer that previously triggered [onTapDown] will not end up causing
 a tap.

 This is called after [onTapDown], and instead of [onTapUp] and [onTap], if
 the tap gesture did not win.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onSecondaryTap**: `GestureTapCallback?`
  A tap with a secondary button has occurred.

 This triggers when the tap gesture wins. If the tap gesture did not win,
 [onSecondaryTapCancel] is called instead.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onSecondaryTapUp], which is called at the same time but includes details
    regarding the pointer position.

- **onSecondaryTapDown**: `GestureTapDownCallback?`
  A pointer that might cause a tap with a secondary button has contacted the
 screen at a particular location.

 This is called after a short timeout, even if the winning gesture has not
 yet been selected. If the tap gesture wins, [onSecondaryTapUp] will be
 called, otherwise [onSecondaryTapCancel] will be called.

 See also:

  * [kSecondaryButton], the button this callback responds to.

- **onSecondaryTapUp**: `GestureTapUpCallback?`
  A pointer that will trigger a tap with a secondary button has stopped
 contacting the screen at a particular location.

 This triggers in the case of the tap gesture winning. If the tap gesture
 did not win, [onSecondaryTapCancel] is called instead.

 See also:

  * [onSecondaryTap], a handler triggered right after this one that doesn't
    pass any details about the tap.
  * [kSecondaryButton], the button this callback responds to.

- **onSecondaryTapCancel**: `GestureTapCancelCallback?`
  The pointer that previously triggered [onSecondaryTapDown] will not end up
 causing a tap.

 This is called after [onSecondaryTapDown], and instead of
 [onSecondaryTapUp], if the tap gesture did not win.

 See also:

  * [kSecondaryButton], the button this callback responds to.

- **onTertiaryTapDown**: `GestureTapDownCallback?`
  A pointer that might cause a tap with a tertiary button has contacted the
 screen at a particular location.

 This is called after a short timeout, even if the winning gesture has not
 yet been selected. If the tap gesture wins, [onTertiaryTapUp] will be
 called, otherwise [onTertiaryTapCancel] will be called.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onTertiaryTapUp**: `GestureTapUpCallback?`
  A pointer that will trigger a tap with a tertiary button has stopped
 contacting the screen at a particular location.

 This triggers in the case of the tap gesture winning. If the tap gesture
 did not win, [onTertiaryTapCancel] is called instead.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onTertiaryTapCancel**: `GestureTapCancelCallback?`
  The pointer that previously triggered [onTertiaryTapDown] will not end up
 causing a tap.

 This is called after [onTertiaryTapDown], and instead of
 [onTertiaryTapUp], if the tap gesture did not win.

 See also:

  * [kTertiaryButton], the button this callback responds to.

- **onDoubleTapDown**: `GestureTapDownCallback?`
  A pointer that might cause a double tap has contacted the screen at a
 particular location.

 Triggered immediately after the down event of the second tap.

 If the user completes the double tap and the gesture wins, [onDoubleTap]
 will be called after this callback. Otherwise, [onDoubleTapCancel] will
 be called after this callback.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onDoubleTap**: `GestureTapCallback?`
  The user has tapped the screen with a primary button at the same location
 twice in quick succession.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onDoubleTapCancel**: `GestureTapCancelCallback?`
  The pointer that previously triggered [onDoubleTapDown] will not end up
 causing a double tap.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onLongPressDown**: `GestureLongPressDownCallback?`
  The pointer has contacted the screen with a primary button, which might
 be the start of a long-press.

 This triggers after the pointer down event.

 If the user completes the long-press, and this gesture wins,
 [onLongPressStart] will be called after this callback. Otherwise,
 [onLongPressCancel] will be called after this callback.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [onSecondaryLongPressDown], a similar callback but for a secondary button.
  * [onTertiaryLongPressDown], a similar callback but for a tertiary button.
  * [LongPressGestureRecognizer.onLongPressDown], which exposes this
    callback at the gesture layer.

- **onLongPressCancel**: `GestureLongPressCancelCallback?`
  A pointer that previously triggered [onLongPressDown] will not end up
 causing a long-press.

 This triggers once the gesture loses if [onLongPressDown] has previously
 been triggered.

 If the user completed the long-press, and the gesture won, then
 [onLongPressStart] and [onLongPress] are called instead.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPressCancel], which exposes this
    callback at the gesture layer.

- **onLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture with a primary button has been recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately after) [onLongPressStart].
 The only difference between the two is that this callback does not
 contain details of the position at which the pointer initially contacted
 the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPress], which exposes this
    callback at the gesture layer.

- **onLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture with a primary button has been recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately before) [onLongPress].
 The only difference between the two is that this callback contains
 details of the position at which the pointer initially contacted the
 screen, whereas [onLongPress] does not.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPressStart], which exposes this
    callback at the gesture layer.

- **onLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  A pointer has been drag-moved after a long-press with a primary button.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPressMoveUpdate], which exposes this
    callback at the gesture layer.

- **onLongPressUp**: `GestureLongPressUpCallback?`
  A pointer that has triggered a long-press with a primary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately after) [onLongPressEnd].
 The only difference between the two is that this callback does not
 contain details of the state of the pointer when it stopped contacting
 the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPressUp], which exposes this
    callback at the gesture layer.

- **onLongPressEnd**: `GestureLongPressEndCallback?`
  A pointer that has triggered a long-press with a primary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately before) [onLongPressUp].
 The only difference between the two is that this callback contains
 details of the state of the pointer when it stopped contacting the
 screen, whereas [onLongPressUp] does not.

 See also:

  * [kPrimaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onLongPressEnd], which exposes this
    callback at the gesture layer.

- **onSecondaryLongPressDown**: `GestureLongPressDownCallback?`
  The pointer has contacted the screen with a secondary button, which might
 be the start of a long-press.

 This triggers after the pointer down event.

 If the user completes the long-press, and this gesture wins,
 [onSecondaryLongPressStart] will be called after this callback. Otherwise,
 [onSecondaryLongPressCancel] will be called after this callback.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [onLongPressDown], a similar callback but for a secondary button.
  * [onTertiaryLongPressDown], a similar callback but for a tertiary button.
  * [LongPressGestureRecognizer.onSecondaryLongPressDown], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPressCancel**: `GestureLongPressCancelCallback?`
  A pointer that previously triggered [onSecondaryLongPressDown] will not
 end up causing a long-press.

 This triggers once the gesture loses if [onSecondaryLongPressDown] has
 previously been triggered.

 If the user completed the long-press, and the gesture won, then
 [onSecondaryLongPressStart] and [onSecondaryLongPress] are called instead.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPressCancel], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture with a secondary button has been
 recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately after)
 [onSecondaryLongPressStart]. The only difference between the two is that
 this callback does not contain details of the position at which the
 pointer initially contacted the screen.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPress], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture with a secondary button has been
 recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately before)
 [onSecondaryLongPress]. The only difference between the two is that this
 callback contains details of the position at which the pointer initially
 contacted the screen, whereas [onSecondaryLongPress] does not.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPressStart], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  A pointer has been drag-moved after a long press with a secondary button.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPressMoveUpdate], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPressUp**: `GestureLongPressUpCallback?`
  A pointer that has triggered a long-press with a secondary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately after)
 [onSecondaryLongPressEnd]. The only difference between the two is that
 this callback does not contain details of the state of the pointer when
 it stopped contacting the screen.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPressUp], which exposes
    this callback at the gesture layer.

- **onSecondaryLongPressEnd**: `GestureLongPressEndCallback?`
  A pointer that has triggered a long-press with a secondary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately before)
 [onSecondaryLongPressUp]. The only difference between the two is that
 this callback contains details of the state of the pointer when it
 stopped contacting the screen, whereas [onSecondaryLongPressUp] does not.

 See also:

  * [kSecondaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onSecondaryLongPressEnd], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressDown**: `GestureLongPressDownCallback?`
  The pointer has contacted the screen with a tertiary button, which might
 be the start of a long-press.

 This triggers after the pointer down event.

 If the user completes the long-press, and this gesture wins,
 [onTertiaryLongPressStart] will be called after this callback. Otherwise,
 [onTertiaryLongPressCancel] will be called after this callback.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [onLongPressDown], a similar callback but for a primary button.
  * [onSecondaryLongPressDown], a similar callback but for a secondary button.
  * [LongPressGestureRecognizer.onTertiaryLongPressDown], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressCancel**: `GestureLongPressCancelCallback?`
  A pointer that previously triggered [onTertiaryLongPressDown] will not
 end up causing a long-press.

 This triggers once the gesture loses if [onTertiaryLongPressDown] has
 previously been triggered.

 If the user completed the long-press, and the gesture won, then
 [onTertiaryLongPressStart] and [onTertiaryLongPress] are called instead.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPressCancel], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPress**: `GestureLongPressCallback?`
  Called when a long press gesture with a tertiary button has been
 recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately after)
 [onTertiaryLongPressStart]. The only difference between the two is that
 this callback does not contain details of the position at which the
 pointer initially contacted the screen.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPress], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressStart**: `GestureLongPressStartCallback?`
  Called when a long press gesture with a tertiary button has been
 recognized.

 Triggered when a pointer has remained in contact with the screen at the
 same location for a long period of time.

 This is equivalent to (and is called immediately before)
 [onTertiaryLongPress]. The only difference between the two is that this
 callback contains details of the position at which the pointer initially
 contacted the screen, whereas [onTertiaryLongPress] does not.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPressStart], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressMoveUpdate**: `GestureLongPressMoveUpdateCallback?`
  A pointer has been drag-moved after a long press with a tertiary button.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPressMoveUpdate], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressUp**: `GestureLongPressUpCallback?`
  A pointer that has triggered a long-press with a tertiary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately after)
 [onTertiaryLongPressEnd]. The only difference between the two is that
 this callback does not contain details of the state of the pointer when
 it stopped contacting the screen.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPressUp], which exposes
    this callback at the gesture layer.

- **onTertiaryLongPressEnd**: `GestureLongPressEndCallback?`
  A pointer that has triggered a long-press with a tertiary button has
 stopped contacting the screen.

 This is equivalent to (and is called immediately before)
 [onTertiaryLongPressUp]. The only difference between the two is that
 this callback contains details of the state of the pointer when it
 stopped contacting the screen, whereas [onTertiaryLongPressUp] does not.

 See also:

  * [kTertiaryButton], the button this callback responds to.
  * [LongPressGestureRecognizer.onTertiaryLongPressEnd], which exposes
    this callback at the gesture layer.

- **onVerticalDragDown**: `GestureDragDownCallback?`
  A pointer has contacted the screen with a primary button and might begin
 to move vertically.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onVerticalDragStart**: `GestureDragStartCallback?`
  A pointer has contacted the screen with a primary button and has begun to
 move vertically.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onVerticalDragUpdate**: `GestureDragUpdateCallback?`
  A pointer that is in contact with the screen with a primary button and
 moving vertically has moved in the vertical direction.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onVerticalDragEnd**: `GestureDragEndCallback?`
  A pointer that was previously in contact with the screen with a primary
 button and moving vertically is no longer in contact with the screen and
 was moving at a specific velocity when it stopped contacting the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onVerticalDragCancel**: `GestureDragCancelCallback?`
  The pointer that previously triggered [onVerticalDragDown] did not
 complete.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onHorizontalDragDown**: `GestureDragDownCallback?`
  A pointer has contacted the screen with a primary button and might begin
 to move horizontally.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onHorizontalDragStart**: `GestureDragStartCallback?`
  A pointer has contacted the screen with a primary button and has begun to
 move horizontally.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onHorizontalDragUpdate**: `GestureDragUpdateCallback?`
  A pointer that is in contact with the screen with a primary button and
 moving horizontally has moved in the horizontal direction.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onHorizontalDragEnd**: `GestureDragEndCallback?`
  A pointer that was previously in contact with the screen with a primary
 button and moving horizontally is no longer in contact with the screen and
 was moving at a specific velocity when it stopped contacting the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onHorizontalDragCancel**: `GestureDragCancelCallback?`
  The pointer that previously triggered [onHorizontalDragDown] did not
 complete.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onPanDown**: `GestureDragDownCallback?`
  A pointer has contacted the screen with a primary button and might begin
 to move.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onPanStart**: `GestureDragStartCallback?`
  A pointer has contacted the screen with a primary button and has begun to
 move.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onPanUpdate**: `GestureDragUpdateCallback?`
  A pointer that is in contact with the screen with a primary button and
 moving has moved again.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onPanEnd**: `GestureDragEndCallback?`
  A pointer that was previously in contact with the screen with a primary
 button and moving is no longer in contact with the screen and was moving
 at a specific velocity when it stopped contacting the screen.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onPanCancel**: `GestureDragCancelCallback?`
  The pointer that previously triggered [onPanDown] did not complete.

 See also:

  * [kPrimaryButton], the button this callback responds to.

- **onScaleStart**: `GestureScaleStartCallback?`
  The pointers in contact with the screen have established a focal point and
 initial scale of 1.0.

- **onScaleUpdate**: `GestureScaleUpdateCallback?`
  The pointers in contact with the screen have indicated a new focal point
 and/or scale.

- **onScaleEnd**: `GestureScaleEndCallback?`
  The pointers are no longer in contact with the screen.

- **onForcePressStart**: `GestureForcePressStartCallback?`
  The pointer is in contact with the screen and has pressed with sufficient
 force to initiate a force press. The amount of force is at least
 [ForcePressGestureRecognizer.startPressure].

 This callback will only be fired on devices with pressure
 detecting screens.

- **onForcePressPeak**: `GestureForcePressPeakCallback?`
  The pointer is in contact with the screen and has pressed with the maximum
 force. The amount of force is at least
 [ForcePressGestureRecognizer.peakPressure].

 This callback will only be fired on devices with pressure
 detecting screens.

- **onForcePressUpdate**: `GestureForcePressUpdateCallback?`
  A pointer is in contact with the screen, has previously passed the
 [ForcePressGestureRecognizer.startPressure] and is either moving on the
 plane of the screen, pressing the screen with varying forces or both
 simultaneously.

 This callback will only be fired on devices with pressure
 detecting screens.

- **onForcePressEnd**: `GestureForcePressEndCallback?`
  The pointer tracked by [onForcePressStart] is no longer in contact with the screen.

 This callback will only be fired on devices with pressure
 detecting screens.

- **behavior**: `HitTestBehavior?`
  How this gesture detector should behave during hit testing when deciding
 how the hit test propagates to children and whether to consider targets
 behind this one.

 This defaults to [HitTestBehavior.deferToChild] if [child] is not null and
 [HitTestBehavior.translucent] if child is null.

 See [HitTestBehavior] for the allowed values and their meanings.

- **excludeFromSemantics**: `bool`
  Whether to exclude these gestures from the semantics tree. For
 example, the long-press gesture for showing a tooltip is
 excluded because the tooltip itself is included in the semantics
 tree directly and so having a gesture to show it would result in
 duplication of information.

- **dragStartBehavior**: `DragStartBehavior`
  Determines the way that drag start behavior is handled.

 If set to [DragStartBehavior.start], gesture drag behavior will
 begin at the position where the drag gesture won the arena. If set to
 [DragStartBehavior.down] it will begin at the position where a down event
 is first detected.

 In general, setting this to [DragStartBehavior.start] will make drag
 animation smoother and setting it to [DragStartBehavior.down] will make
 drag behavior feel slightly more reactive.

 By default, the drag start behavior is [DragStartBehavior.start].

 Only the [DragGestureRecognizer.onStart] callbacks for the
 [VerticalDragGestureRecognizer], [HorizontalDragGestureRecognizer] and
 [PanGestureRecognizer] are affected by this setting.

 See also:

  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.

- **supportedDevices**: `Set&lt;PointerDeviceKind&gt;?`
  The kind of devices that are allowed to be recognized.

 If set to null, events from all device types will be recognized. Defaults to null.

- **trackpadScrollCausesScale**: `bool`
  

- **trackpadScrollToScaleFactor**: `Offset`
  

## Constructors

### Unnamed Constructor
Creates a widget that detects gestures.

 Pan and scale callbacks cannot be used simultaneously because scale is a
 superset of pan. Use the scale callbacks instead.

 Horizontal and vertical drag callbacks cannot be used simultaneously
 because a combination of a horizontal and vertical drag is a pan.
 Use the pan callbacks instead.

 

 By default, gesture detectors contribute semantic information to the tree
 that is used by assistive technology.

