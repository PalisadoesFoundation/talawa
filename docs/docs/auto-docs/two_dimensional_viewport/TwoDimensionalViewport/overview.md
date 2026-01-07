# Overview for `TwoDimensionalViewport`

## Description

A widget through which a portion of larger content can be viewed, typically
 in combination with a [TwoDimensionalScrollable].

 [TwoDimensionalViewport] is the visual workhorse of the two dimensional
 scrolling machinery. It displays a subset of its children according to its
 own dimensions and the given [horizontalOffset] an [verticalOffset]. As the
 offsets vary, different children are visible through the viewport.

 Subclasses must implement [createRenderObject] and [updateRenderObject].
 Both of these methods require the render object to be a subclass of
 [RenderTwoDimensionalViewport]. This class will create its own
 [RenderObjectElement] which already implements the
 [TwoDimensionalChildManager], which means subclasses should cast the
 [BuildContext] to provide as the child manager to the
 [RenderTwoDimensionalViewport].

 
 This is an example of a subclass implementation of [TwoDimensionalViewport],
 `SimpleTwoDimensionalViewport`. The `RenderSimpleTwoDimensionalViewport` is
 a subclass of [RenderTwoDimensionalViewport].

 ```dart
 class SimpleTwoDimensionalViewport extends TwoDimensionalViewport 
 ```
 

 See also:

   * [Viewport], the equivalent of this widget that scrolls in only one
     dimension.

## Dependencies

- RenderObjectWidget

## Members

- **verticalOffset**: `ViewportOffset`
  Which part of the content inside the viewport should be visible in the
 vertical axis.

 The [ViewportOffset.pixels] value determines the scroll offset that the
 viewport uses to select which part of its content to display. As the user
 scrolls the viewport vertically, this value changes, which changes the
 content that is displayed.

 Typically a [ScrollPosition].

- **verticalAxisDirection**: `AxisDirection`
  The direction in which the [verticalOffset]'s [ViewportOffset.pixels]
 increases.

 For example, if the axis direction is [AxisDirection.down], a scroll
 offset of zero is at the top of the viewport and increases towards the
 bottom of the viewport.

 Must be either [AxisDirection.down] or [AxisDirection.up] in correlation
 with an [Axis.vertical].

- **horizontalOffset**: `ViewportOffset`
  Which part of the content inside the viewport should be visible in the
 horizontal axis.

 The [ViewportOffset.pixels] value determines the scroll offset that the
 viewport uses to select which part of its content to display. As the user
 scrolls the viewport horizontally, this value changes, which changes the
 content that is displayed.

 Typically a [ScrollPosition].

- **horizontalAxisDirection**: `AxisDirection`
  The direction in which the [horizontalOffset]'s [ViewportOffset.pixels]
 increases.

 For example, if the axis direction is [AxisDirection.right], a scroll
 offset of zero is at the left of the viewport and increases towards the
 right of the viewport.

 Must be either [AxisDirection.left] or [AxisDirection.right] in correlation
 with an [Axis.horizontal].

- **mainAxis**: `Axis`
  The main axis of the two.

 Used to determine the paint order of the children of the viewport. When
 the main axis is [Axis.vertical], children will be painted in row major
 order, according to their associated [ChildVicinity]. When the main axis
 is [Axis.horizontal], the children will be painted in column major order.

- **cacheExtent**: `double?`
  

- **clipBehavior**: `Clip`
  

- **delegate**: `TwoDimensionalChildDelegate`
  A delegate that provides the children for the [TwoDimensionalViewport].

## Constructors

### Unnamed Constructor
Creates a viewport for [RenderBox] objects that extend and scroll in both
 horizontal and vertical dimensions.

 The viewport listens to the [horizontalOffset] and [verticalOffset], which
 means this widget does not need to be rebuilt when the offsets change.

