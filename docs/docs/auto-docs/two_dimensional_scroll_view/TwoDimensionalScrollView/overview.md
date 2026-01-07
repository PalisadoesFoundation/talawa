# Overview for `TwoDimensionalScrollView`

## Description

A widget that combines a [TwoDimensionalScrollable] and a
 [TwoDimensionalViewport] to create an interactive scrolling pane of content
 in both vertical and horizontal dimensions.

 A two-way scrollable widget consist of three pieces:

  1. A [TwoDimensionalScrollable] widget, which listens for various user
     gestures and implements the interaction design for scrolling.
  2. A [TwoDimensionalViewport] widget, which implements the visual design
     for scrolling by displaying only a portion
     of the widgets inside the scroll view.
  3. A [TwoDimensionalChildDelegate], which provides the children visible in
     the scroll view.

 [TwoDimensionalScrollView] helps orchestrate these pieces by creating the
 [TwoDimensionalScrollable] and deferring to its subclass to implement
 [buildViewport], which builds a subclass of [TwoDimensionalViewport]. The
 [TwoDimensionalChildDelegate] is provided by the [delegate] parameter.

 A [TwoDimensionalScrollView] has two different [ScrollPosition]s, one for
 each [Axis]. This means that there are also two unique [ScrollController]s
 for these positions. To provide a ScrollController to access the
 ScrollPosition, use the [ScrollableDetails.controller] property of the
 associated axis that is provided to this scroll view.

## Dependencies

- StatelessWidget

## Members

- **delegate**: `TwoDimensionalChildDelegate`
  A delegate that provides the children for the [TwoDimensionalScrollView].

- **cacheExtent**: `double?`
  

- **diagonalDragBehavior**: `DiagonalDragBehavior`
  Whether scrolling gestures should lock to one axes, allow free movement
 in both axes, or be evaluated on a weighted scale.

 Defaults to [DiagonalDragBehavior.none], locking axes to receive input one
 at a time.

- **primary**: `bool?`
  

- **mainAxis**: `Axis`
  The main axis of the two.

 Used to determine how to apply [primary] when true.

 This value should also be provided to the subclass of
 [TwoDimensionalViewport], where it is used to determine paint order of
 children.

- **verticalDetails**: `ScrollableDetails`
  The configuration of the vertical Scrollable.

 These [ScrollableDetails] can be used to set the [AxisDirection],
 [ScrollController], [ScrollPhysics] and more for the vertical axis.

- **horizontalDetails**: `ScrollableDetails`
  The configuration of the horizontal Scrollable.

 These [ScrollableDetails] can be used to set the [AxisDirection],
 [ScrollController], [ScrollPhysics] and more for the horizontal axis.

- **dragStartBehavior**: `DragStartBehavior`
  

- **keyboardDismissBehavior**: `ScrollViewKeyboardDismissBehavior?`
  

 If [keyboardDismissBehavior] is null then it will fallback to the inherited
 [ScrollBehavior.getKeyboardDismissBehavior].

- **hitTestBehavior**: `HitTestBehavior`
  

 This value applies to both axes.

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates a widget that scrolls in both dimensions.

 The [primary] argument is associated with the [mainAxis]. The main axis
 [ScrollableDetails.controller] must be null if [primary] is configured for
 that axis. If [primary] is true, the nearest [PrimaryScrollController]
 surrounding the widget is attached to the scroll position of that axis.

