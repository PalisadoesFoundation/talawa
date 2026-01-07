# Overview for `DragGestureRecognizer`

## Description

Recognizes movement.

 In contrast to [MultiDragGestureRecognizer], [DragGestureRecognizer]
 recognizes a single gesture sequence for all the pointers it watches, which
 means that the recognizer has at most one drag sequence active at any given
 time regardless of how many pointers are in contact with the screen.

 [DragGestureRecognizer] is not intended to be used directly. Instead,
 consider using one of its subclasses to recognize specific types for drag
 gestures.

 [DragGestureRecognizer] competes on pointer events only when it has at
 least one non-null callback. If it has no callbacks, it is a no-op.

 See also:

  * [HorizontalDragGestureRecognizer], for left and right drags.
  * [VerticalDragGestureRecognizer], for up and down drags.
  * [PanGestureRecognizer], for drags that are not locked to a single axis.

## Dependencies

- OneSequenceGestureRecognizer

## Members

- **dragStartBehavior**: `DragStartBehavior`
  Configure the behavior of offsets passed to [onStart].

 If set to [DragStartBehavior.start], the [onStart] callback will be called
 with the position of the pointer at the time this gesture recognizer won
 the arena. If [DragStartBehavior.down], [onStart] will be called with
 the position of the first detected down event for the pointer. When there
 are no other gestures competing with this gesture in the arena, there's
 no difference in behavior between the two settings.

 For more information about the gesture arena:
 https://flutter.dev/to/gesture-disambiguation

 By default, the drag start behavior is [DragStartBehavior.start].

 ## Example:

 A [HorizontalDragGestureRecognizer] and a [VerticalDragGestureRecognizer]
 compete with each other. A finger presses down on the screen with
 offset (500.0, 500.0), and then moves to position (510.0, 500.0) before
 the [HorizontalDragGestureRecognizer] wins the arena. With
 [dragStartBehavior] set to [DragStartBehavior.down], the [onStart]
 callback will be called with position (500.0, 500.0). If it is
 instead set to [DragStartBehavior.start], [onStart] will be called with
 position (510.0, 500.0).

- **multitouchDragStrategy**: `MultitouchDragStrategy`
  
 Configure the multi-finger drag strategy on multi-touch devices.

 If set to [MultitouchDragStrategy.latestPointer], the drag gesture recognizer
 will only track the latest active (accepted by this recognizer) pointer, which
 appears to be only one finger dragging.

 If set to [MultitouchDragStrategy.averageBoundaryPointers], all active
 pointers will be tracked, and the result is computed from the boundary pointers.

 If set to [MultitouchDragStrategy.sumAllPointers],
 all active pointers will be tracked together and the scrolling offset
 is the sum of the offsets of all active pointers
 

 By default, the strategy is [MultitouchDragStrategy.latestPointer].

 See also:

  * [MultitouchDragStrategy], which defines several different drag strategies for
  multi-finger drag.

- **onDown**: `GestureDragDownCallback?`
  A pointer has contacted the screen with a primary button and might begin
 to move.

 The position of the pointer is provided in the callback's `details`
 argument, which is a [DragDownDetails] object.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [DragDownDetails], which is passed as an argument to this callback.

- **onStart**: `GestureDragStartCallback?`
  
 A pointer has contacted the screen with a primary button and has begun to
 move.
 

 The position of the pointer is provided in the callback's `details`
 argument, which is a [DragStartDetails] object. The [dragStartBehavior]
 determines this position.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [DragStartDetails], which is passed as an argument to this callback.

- **onUpdate**: `GestureDragUpdateCallback?`
  
 A pointer that is in contact with the screen with a primary button and
 moving has moved again.
 

 The distance traveled by the pointer since the last update is provided in
 the callback's `details` argument, which is a [DragUpdateDetails] object.

 If this gesture recognizer recognizes movement on a single axis (a
 [VerticalDragGestureRecognizer] or [HorizontalDragGestureRecognizer]),
 then `details` will reflect movement only on that axis and its
 [DragUpdateDetails.primaryDelta] will be non-null.
 If this gesture recognizer recognizes movement in all directions
 (a [PanGestureRecognizer]), then `details` will reflect movement on
 both axes and its [DragUpdateDetails.primaryDelta] will be null.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [DragUpdateDetails], which is passed as an argument to this callback.

- **onEnd**: `GestureDragEndCallback?`
  
 A pointer that was previously in contact with the screen with a primary
 button and moving is no longer in contact with the screen and was moving
 at a specific velocity when it stopped contacting the screen.
 

 The velocity is provided in the callback's `details` argument, which is a
 [DragEndDetails] object.

 If this gesture recognizer recognizes movement on a single axis (a
 [VerticalDragGestureRecognizer] or [HorizontalDragGestureRecognizer]),
 then `details` will reflect movement only on that axis and its
 [DragEndDetails.primaryVelocity] will be non-null.
 If this gesture recognizer recognizes movement in all directions
 (a [PanGestureRecognizer]), then `details` will reflect movement on
 both axes and its [DragEndDetails.primaryVelocity] will be null.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.
  * [DragEndDetails], which is passed as an argument to this callback.

- **onCancel**: `GestureDragCancelCallback?`
  The pointer that previously triggered [onDown] did not complete.

 See also:

  * [allowedButtonsFilter], which decides which button will be allowed.

- **minFlingDistance**: `double?`
  The minimum distance an input pointer drag must have moved
 to be considered a fling gesture.

 This value is typically compared with the distance traveled along the
 scrolling axis. If null then [kTouchSlop] is used.

- **minFlingVelocity**: `double?`
  The minimum velocity for an input pointer drag to be considered fling.

 This value is typically compared with the magnitude of fling gesture's
 velocity along the scrolling axis. If null then [kMinFlingVelocity]
 is used.

- **maxFlingVelocity**: `double?`
  Fling velocity magnitudes will be clamped to this value.

 If null then [kMaxFlingVelocity] is used.

- **onlyAcceptDragOnThreshold**: `bool`
  Whether the drag threshold should be met before dispatching any drag callbacks.

 The drag threshold is met when the global distance traveled by a pointer has
 exceeded the defined threshold on the relevant axis, i.e. y-axis for the
 [VerticalDragGestureRecognizer], x-axis for the [HorizontalDragGestureRecognizer],
 and the entire plane for [PanGestureRecognizer]. The threshold for both
 [VerticalDragGestureRecognizer] and [HorizontalDragGestureRecognizer] are
 calculated by [computeHitSlop], while [computePanSlop] is used for
 [PanGestureRecognizer].

 If true, the drag callbacks will only be dispatched when this recognizer has
 won the arena and the drag threshold has been met.

 If false, the drag callbacks will be dispatched immediately when this recognizer
 has won the arena.

 This value defaults to false.

- **velocityTrackerBuilder**: `GestureVelocityTrackerBuilder`
  Determines the type of velocity estimation method to use for a potential
 drag gesture, when a new pointer is added.

 To estimate the velocity of a gesture, [DragGestureRecognizer] calls
 [velocityTrackerBuilder] when it starts to track a new pointer in
 [addAllowedPointer], and add subsequent updates on the pointer to the
 resulting velocity tracker, until the gesture recognizer stops tracking
 the pointer. This allows you to specify a different velocity estimation
 strategy for each allowed pointer added, by changing the type of velocity
 tracker this [GestureVelocityTrackerBuilder] returns.

 If left unspecified the default [velocityTrackerBuilder] creates a new
 [VelocityTracker] for every pointer added.

 See also:

  * [VelocityTracker], a velocity tracker that uses least squares estimation
    on the 20 most recent pointer data samples. It's a well-rounded velocity
    tracker and is used by default.
  * [IOSScrollViewFlingVelocityTracker], a specialized velocity tracker for
    determining the initial fling velocity for a [Scrollable] on iOS, to
    match the native behavior on that platform.

- **_state**: `_DragState`
- **_initialPosition**: `OffsetPair`
- **_pendingDragOffset**: `OffsetPair`
- **_lastPosition**: `OffsetPair`
- **_lastPendingEventTimestamp**: `Duration?`
- **_initialButtons**: `int?`
- **_lastTransform**: `Matrix4?`
- **_globalDistanceMoved**: `double`
- **_hasDragThresholdBeenMet**: `bool`
- **_velocityTrackers**: `Map&lt;int, VelocityTracker&gt;`
- **_moveDeltaBeforeFrame**: `Map&lt;int, Offset&gt;`
- **_frameTimeStamp**: `Duration?`
- **_lastUpdatedDeltaForPan**: `Offset`
- **_acceptedActivePointers**: `List&lt;int&gt;`
- **_activePointer**: `int?`
## Constructors

### Unnamed Constructor
Initialize the object.

 

