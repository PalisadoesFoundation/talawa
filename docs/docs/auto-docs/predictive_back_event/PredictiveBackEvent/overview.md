# Overview for `PredictiveBackEvent`

## Description

Object used to report back gesture progress in Android.

 Holds information about the touch event, swipe direction, and the animation
 progress that predictive back animations should follow.

## Members

- **touchOffset**: `Offset?`
  The global position of the touch point as an `Offset`, or `null` if the
 event is triggered by a button press.

 This represents the touch location that initiates or interacts with the
 back gesture. When `null`, it indicates the gesture was not started by a
 touch event, such as a back button press in devices with hardware buttons.

- **progress**: `double`
  Returns a value between 0.0 and 1.0 representing how far along the back
 gesture is.

 This value is driven by the horizontal location of the touch point, and
 should be used as the fraction to seek the predictive back animation with.
 Specifically,

 - The progress is 0.0 when the touch is at the starting edge of the screen
   (left or right), and the animation should seek to its start state.
 - The progress is approximately 1.0 when the touch is at the opposite side
   of the screen, and the animation should seek to its end state. Exact end
   value may vary depending on screen size.

 When the gesture is canceled, the progress value continues to update,
 animating back to 0.0 until the cancellation animation completes.

 In-between locations are linearly interpolated based on horizontal
 distance from the starting edge and smooth clamped to 1.0 when the
 distance exceeds a system-wide threshold.

- **swipeEdge**: `SwipeEdge`
  The screen edge from which the swipe gesture starts.

## Constructors

### _
Creates a new [PredictiveBackEvent] instance.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### fromMap
Creates an [PredictiveBackEvent] from a Map, typically used when converting
 data received from a platform channel.

#### Parameters

- `map`: `Map&lt;String?, Object?&gt;`
