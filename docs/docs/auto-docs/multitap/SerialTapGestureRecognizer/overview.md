# Overview for `SerialTapGestureRecognizer`

## Description

Recognizes serial taps (taps in a series).

 A collection of taps are considered to be _in a series_ if they occur in
 rapid succession in the same location (within a tolerance). The number of
 taps in the series is its count. A double-tap, for instance, is a special
 case of a tap series with a count of two.

 ### Gesture arena behavior

 [SerialTapGestureRecognizer] competes on all pointer events (regardless of
 button). It will declare defeat if it determines that a gesture is not a
 tap (e.g. if the pointer is dragged too far while it's contacting the
 screen). It will immediately declare victory for every tap that it
 recognizes.

 Each time a pointer contacts the screen, this recognizer will enter that
 gesture into the arena. This means that this recognizer will yield multiple
 winning entries in the arena for a single tap series as the series
 progresses.

 If this recognizer loses the arena (either by declaring defeat or by
 another recognizer declaring victory) while the pointer is contacting the
 screen, it will fire [onSerialTapCancel], and [onSerialTapUp] will not
 be fired.

 ### Button behavior

 A tap series is defined to have the same buttons across all taps. If a tap
 with a different combination of buttons is delivered in the middle of a
 series, it will "steal" the series and begin a new series, starting the
 count over.

 ### Interleaving tap behavior

 A tap must be _completed_ in order for a subsequent tap to be considered
 "in the same series" as that tap. Thus, if tap A is in-progress (the down
 event has been received, but the corresponding up event has not yet been
 received), and tap B begins (another pointer contacts the screen), tap A
 will fire [onSerialTapCancel], and tap B will begin a new series (tap B's
 [SerialTapDownDetails.count] will be 1).

 ### Relation to `TapGestureRecognizer` and `DoubleTapGestureRecognizer`

 [SerialTapGestureRecognizer] fires [onSerialTapDown] and [onSerialTapUp]
 for every tap that it recognizes (passing the count in the details),
 regardless of whether that tap is a single-tap, double-tap, etc. This
 makes it especially useful when you want to respond to every tap in a
 series. Contrast this with [DoubleTapGestureRecognizer], which only fires
 if the user completes a double-tap, and [TapGestureRecognizer], which
 _doesn't_ fire if the recognizer is competing with a
 `DoubleTapGestureRecognizer`, and the user double-taps.

 For example, consider a list item that should be _selected_ on the first
 tap and _cause an edit dialog to open_ on a double-tap. If you use both
 [TapGestureRecognizer] and [DoubleTapGestureRecognizer], there are a few
 problems:

   1. If the user single-taps the list item, it will not select
      the list item until after enough time has passed to rule out a
      double-tap.
   2. If the user double-taps the list item, it will not select the list
      item at all.

 The solution is to use [SerialTapGestureRecognizer] and use the tap count
 to either select the list item or open the edit dialog.

 ### When competing with `TapGestureRecognizer` and `DoubleTapGestureRecognizer`

 Unlike [TapGestureRecognizer] and [DoubleTapGestureRecognizer],
 [SerialTapGestureRecognizer] aggressively declares victory when it detects
 a tap, so when it is competing with those gesture recognizers, it will beat
 them in the arena, regardless of which recognizer entered the arena first.

## Dependencies

- GestureRecognizer

## Members

- **onSerialTapDown**: `GestureSerialTapDownCallback?`
  A pointer has contacted the screen at a particular location, which might
 be the start of a serial tap.

 If this recognizer loses the arena before the serial tap is completed
 (either because the gesture does not end up being a tap or because another
 recognizer wins the arena), [onSerialTapCancel] is called next. Otherwise,
 [onSerialTapUp] is called next.

 The [SerialTapDownDetails.count] that is passed to this callback
 specifies the series tap count.

- **onSerialTapCancel**: `GestureSerialTapCancelCallback?`
  A pointer that previously triggered [onSerialTapDown] will not end up
 triggering the corresponding [onSerialTapUp].

 If the user completes the serial tap, [onSerialTapUp] is called instead.

 The [SerialTapCancelDetails.count] that is passed to this callback will
 match the [SerialTapDownDetails.count] that was passed to the
 [onSerialTapDown] callback.

- **onSerialTapUp**: `GestureSerialTapUpCallback?`
  A pointer has stopped contacting the screen at a particular location,
 representing a serial tap.

 If the user didn't complete the tap, or if another recognizer won the
 arena, then [onSerialTapCancel] is called instead.

 The [SerialTapUpDetails.count] that is passed to this callback specifies
 the series tap count and will match the [SerialTapDownDetails.count] that
 was passed to the [onSerialTapDown] callback.

- **_serialTapTimer**: `Timer?`
- **_completedTaps**: `List&lt;_TapTracker&gt;`
- **_gestureResolutions**: `Map&lt;int, GestureDisposition&gt;`
- **_pendingTap**: `_TapTracker?`
## Constructors

### Unnamed Constructor
Creates a serial tap gesture recognizer.

