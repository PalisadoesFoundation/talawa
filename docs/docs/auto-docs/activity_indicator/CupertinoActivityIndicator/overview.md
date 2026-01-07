# Overview for `CupertinoActivityIndicator`

## Description

An iOS-style activity indicator that spins clockwise.

 

 
 This example shows how [CupertinoActivityIndicator] can be customized.

 ** See code in examples/api/lib/cupertino/activity_indicator/cupertino_activity_indicator.0.dart **
 

 See also:

  * <https://developer.apple.com/design/human-interface-guidelines/progress-indicators/>

## Dependencies

- StatefulWidget

## Members

- **color**: `Color?`
  Color of the activity indicator.

 Defaults to color extracted from native iOS.

- **animating**: `bool`
  Whether the activity indicator is running its animation.

 Defaults to true.

- **radius**: `double`
  Radius of the spinner widget.

 Defaults to 10 pixels. Must be positive.

- **progress**: `double`
  Determines the percentage of spinner ticks that will be shown. Typical usage would
 display all ticks, however, this allows for more fine-grained control such as
 during pull-to-refresh when the drag-down action shows one tick at a time as
 the user continues to drag down.

 Defaults to one. Must be between zero and one, inclusive.

## Constructors

### Unnamed Constructor
Creates an iOS-style activity indicator that spins clockwise.

### partiallyRevealed
Creates a non-animated iOS-style activity indicator that displays
 a partial count of ticks based on the value of [progress].

 When provided, the value of [progress] must be between 0.0 (zero ticks
 will be shown) and 1.0 (all ticks will be shown) inclusive. Defaults
 to 1.0.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
