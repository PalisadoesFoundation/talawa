# Overview for `Dismissible`

## Description

A widget that can be dismissed by dragging in the indicated [direction].

 Dragging or flinging this widget in the [DismissDirection] causes the child
 to slide out of view. Following the slide animation, if [resizeDuration] is
 non-null, the Dismissible widget animates its height (or width, whichever is
 perpendicular to the dismiss direction) to zero over the [resizeDuration].

 

 
 This sample shows how you can use the [Dismissible] widget to
 remove list items using swipe gestures. Swipe any of the list
 tiles to the left or right to dismiss them from the [ListView].

 ** See code in examples/api/lib/widgets/dismissible/dismissible.0.dart **
 

 Backgrounds can be used to implement the "leave-behind" idiom. If a background
 is specified it is stacked behind the Dismissible's child and is exposed when
 the child moves.

 The widget calls the [onDismissed] callback either after its size has
 collapsed to zero (if [resizeDuration] is non-null) or immediately after
 the slide animation (if [resizeDuration] is null). If the Dismissible is a
 list item, it must have a key that distinguishes it from the other items and
 its [onDismissed] callback must remove the item from the list.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **background**: `Widget?`
  A widget that is stacked behind the child. If secondaryBackground is also
 specified then this widget only appears when the child has been dragged
 down or to the right.

- **secondaryBackground**: `Widget?`
  A widget that is stacked behind the child and is exposed when the child
 has been dragged up or to the left. It may only be specified when background
 has also been specified.

- **confirmDismiss**: `ConfirmDismissCallback?`
  Gives the app an opportunity to confirm or veto a pending dismissal.

 The widget cannot be dragged again until the returned future resolves.

 If the returned `Future&lt;bool&gt;` completes true, then this widget will be
 dismissed, otherwise it will be moved back to its original location.

 If the returned `Future<bool?>` completes to false or null the [onResize]
 and [onDismissed] callbacks will not run.

- **onResize**: `VoidCallback?`
  Called when the widget changes size (i.e., when contracting before being dismissed).

- **onDismissed**: `DismissDirectionCallback?`
  Called when the widget has been dismissed, after finishing resizing.

- **direction**: `DismissDirection`
  The direction in which the widget can be dismissed.

- **resizeDuration**: `Duration?`
  The amount of time the widget will spend contracting before [onDismissed] is called.

 If null, the widget will not contract and [onDismissed] will be called
 immediately after the widget is dismissed.

- **dismissThresholds**: `Map&lt;DismissDirection, double&gt;`
  The offset threshold the item has to be dragged in order to be considered
 dismissed.

 Represented as a fraction, e.g. if it is 0.4 (the default), then the item
 has to be dragged at least 40% towards one direction to be considered
 dismissed. Clients can define different thresholds for each dismiss
 direction.

 Flinging is treated as being equivalent to dragging almost to 1.0, so
 flinging can dismiss an item past any threshold less than 1.0.

 Setting a threshold of 1.0 (or greater) prevents a drag in the given
 [DismissDirection] even if it would be allowed by the [direction]
 property.

 See also:

  * [direction], which controls the directions in which the items can
    be dismissed.

- **movementDuration**: `Duration`
  Defines the duration for card to dismiss or to come back to original position if not dismissed.

- **crossAxisEndOffset**: `double`
  Defines the end offset across the main axis after the card is dismissed.

 If non-zero value is given then widget moves in cross direction depending on whether
 it is positive or negative.

- **dragStartBehavior**: `DragStartBehavior`
  Determines the way that drag start behavior is handled.

 If set to [DragStartBehavior.start], the drag gesture used to dismiss a
 dismissible will begin at the position where the drag gesture won the arena.
 If set to [DragStartBehavior.down] it will begin at the position where
 a down event is first detected.

 In general, setting this to [DragStartBehavior.start] will make drag
 animation smoother and setting it to [DragStartBehavior.down] will make
 drag behavior feel slightly more reactive.

 By default, the drag start behavior is [DragStartBehavior.start].

 See also:

  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.

- **behavior**: `HitTestBehavior`
  How to behave during hit tests.

 This defaults to [HitTestBehavior.opaque].

- **onUpdate**: `DismissUpdateCallback?`
  Called when the dismissible widget has been dragged.

 If [onUpdate] is not null, then it will be invoked for every pointer event
 to dispatch the latest state of the drag. For example, this callback
 can be used to for example change the color of the background widget
 depending on whether the dismiss threshold is currently reached.

## Constructors

### Unnamed Constructor
Creates a widget that can be dismissed.

 The [key] argument is required because [Dismissible]s are commonly used in
 lists and removed from the list when dismissed. Without keys, the default
 behavior is to sync widgets based on their index in the list, which means
 the item after the dismissed item would be synced with the state of the
 dismissed item. Using keys causes the widgets to sync according to their
 keys and avoids this pitfall.

