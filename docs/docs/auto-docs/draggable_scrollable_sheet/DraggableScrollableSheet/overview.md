# Overview for `DraggableScrollableSheet`

## Description

A container for a [Scrollable] that responds to drag gestures by resizing
 the scrollable until a limit is reached, and then scrolling.

 

 This widget can be dragged along the vertical axis between its
 [minChildSize], which defaults to `0.25` and [maxChildSize], which defaults
 to `1.0`. These sizes are percentages of the height of the parent container.

 The widget coordinates resizing and scrolling of the widget returned by
 builder as the user drags along the horizontal axis.

 The widget will initially be displayed at its initialChildSize which
 defaults to `0.5`, meaning half the height of its parent. Dragging will work
 between the range of minChildSize and maxChildSize (as percentages of the
 parent container's height) as long as the builder creates a widget which
 uses the provided [ScrollController]. If the widget created by the
 [ScrollableWidgetBuilder] does not use the provided [ScrollController], the
 sheet will remain at the initialChildSize.

 By default, the widget will stay at whatever size the user drags it to. To
 make the widget snap to specific sizes whenever they lift their finger
 during a drag, set [snap] to `true`. The sheet will snap between
 [minChildSize] and [maxChildSize]. Use [snapSizes] to add more sizes for
 the sheet to snap between.

 The snapping effect is only applied on user drags. Programmatically
 manipulating the sheet size via [DraggableScrollableController.animateTo] or
 [DraggableScrollableController.jumpTo] will ignore [snap] and [snapSizes].

 By default, the widget will expand its non-occupied area to fill available
 space in the parent. If this is not desired, e.g. because the parent wants
 to position sheet based on the space it is taking, the [expand] property
 may be set to false.

 

 This is a sample widget which shows a [ListView] that has 25 [ListTile]s.
 It starts out as taking up half the body of the [Scaffold], and can be
 dragged up to the full height of the scaffold or down to 25% of the height
 of the scaffold. Upon reaching full height, the list contents will be
 scrolled up or down, until they reach the top of the list again and the user
 drags the sheet back down.

 On desktop and web running on desktop platforms, dragging to scroll with a mouse is disabled by default
 to align with the natural behavior found in other desktop applications.

 This behavior is dictated by the [ScrollBehavior], and can be changed by adding
 [PointerDeviceKind.mouse] to [ScrollBehavior.dragDevices].
 For more info on this, please refer to https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag

 Alternatively, this example illustrates how to add a drag handle for desktop applications.

 ** See code in examples/api/lib/widgets/draggable_scrollable_sheet/draggable_scrollable_sheet.0.dart **
 

## Dependencies

- StatefulWidget

## Members

- **initialChildSize**: `double`
  The initial fractional value of the parent container's height to use when
 displaying the widget.

 Rebuilding the sheet with a new [initialChildSize] will only move
 the sheet to the new value if the sheet has not yet been dragged since it
 was first built or since the last call to [DraggableScrollableActuator.reset].

 The default value is `0.5`.

- **minChildSize**: `double`
  The minimum fractional value of the parent container's height to use when
 displaying the widget.

 The default value is `0.25`.

- **maxChildSize**: `double`
  The maximum fractional value of the parent container's height to use when
 displaying the widget.

 The default value is `1.0`.

- **expand**: `bool`
  Whether the widget should expand to fill the available space in its parent
 or not.

 In most cases, this should be true. However, in the case of a parent
 widget that will position this one based on its desired size (such as a
 [Center]), this should be set to false.

 The default value is true.

- **snap**: `bool`
  Whether the widget should snap between [snapSizes] when the user lifts
 their finger during a drag.

 If the user's finger was still moving when they lifted it, the widget will
 snap to the next snap size (see [snapSizes]) in the direction of the drag.
 If their finger was still, the widget will snap to the nearest snap size.

 Snapping is not applied when the sheet is programmatically moved by
 calling [DraggableScrollableController.animateTo] or [DraggableScrollableController.jumpTo].

 Rebuilding the sheet with snap newly enabled will immediately trigger a
 snap unless the sheet has not yet been dragged away from
 [initialChildSize] since first being built or since the last call to
 [DraggableScrollableActuator.reset].

- **snapSizes**: `List&lt;double&gt;?`
  A list of target sizes that the widget should snap to.

 Snap sizes are fractional values of the parent container's height. They
 must be listed in increasing order and be between [minChildSize] and
 [maxChildSize].

 The [minChildSize] and [maxChildSize] are implicitly included in snap
 sizes and do not need to be specified here. For example, `snapSizes = [.5]`
 will result in a sheet that snaps between [minChildSize], `.5`, and
 [maxChildSize].

 Any modifications to the [snapSizes] list will not take effect until the
 `build` function containing this widget is run again.

 Rebuilding with a modified or new list will trigger a snap unless the
 sheet has not yet been dragged away from [initialChildSize] since first
 being built or since the last call to [DraggableScrollableActuator.reset].

- **snapAnimationDuration**: `Duration?`
  Defines a duration for the snap animations.

 If it's not set, then the animation duration is the distance to the snap
 target divided by the velocity of the widget.

- **controller**: `DraggableScrollableController?`
  A controller that can be used to programmatically control this sheet.

- **shouldCloseOnMinExtent**: `bool`
  Whether the sheet, when dragged (or flung) to its minimum size, should
 cause its parent sheet to close.

 Set on emitted [DraggableScrollableNotification]s. It is up to parent
 classes to properly read and handle this value.

- **builder**: `ScrollableWidgetBuilder`
  The builder that creates a child to display in this widget, which will
 use the provided [ScrollController] to enable dragging and scrolling
 of the contents.

## Constructors

### Unnamed Constructor
Creates a widget that can be dragged and scrolled in a single gesture.

