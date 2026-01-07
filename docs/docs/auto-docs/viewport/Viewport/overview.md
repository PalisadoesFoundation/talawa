# Overview for `Viewport`

## Description

A widget through which a portion of larger content can be viewed, typically
 in combination with a [Scrollable].

 [Viewport] is the visual workhorse of the scrolling machinery. It displays a
 subset of its children according to its own dimensions and the given
 [offset]. As the offset varies, different children are visible through
 the viewport.

 [Viewport] hosts a bidirectional list of slivers, anchored on a [center]
 sliver, which is placed at the zero scroll offset. The center widget is
 displayed in the viewport according to the [anchor] property.

 Slivers that are earlier in the child list than [center] are displayed in
 reverse order in the reverse [axisDirection] starting from the [center]. For
 example, if the [axisDirection] is [AxisDirection.down], the first sliver
 before [center] is placed above the [center]. The slivers that are later in
 the child list than [center] are placed in order in the [axisDirection]. For
 example, in the preceding scenario, the first sliver after [center] is
 placed below the [center].

 [Viewport] cannot contain box children directly. Instead, use a
 [SliverList], [SliverFixedExtentList], [SliverGrid], or a
 [SliverToBoxAdapter], for example.

 See also:

  * [ListView], [PageView], [GridView], and [CustomScrollView], which combine
    [Scrollable] and [Viewport] into widgets that are easier to use.
  * [SliverToBoxAdapter], which allows a box widget to be placed inside a
    sliver context (the opposite of this widget).
  * [ShrinkWrappingViewport], a variant of [Viewport] that shrink-wraps its
    contents along the main axis.
  * [ViewportElementMixin], which should be mixed in to the [Element] type used
    by viewport-like widgets to correctly handle scroll notifications.

## Dependencies

- MultiChildRenderObjectWidget

## Members

- **axisDirection**: `AxisDirection`
  The direction in which the [offset]'s [ViewportOffset.pixels] increases.

 For example, if the [axisDirection] is [AxisDirection.down], a scroll
 offset of zero is at the top of the viewport and increases towards the
 bottom of the viewport.

- **crossAxisDirection**: `AxisDirection?`
  The direction in which child should be laid out in the cross axis.

 If the [axisDirection] is [AxisDirection.down] or [AxisDirection.up], this
 property defaults to [AxisDirection.left] if the ambient [Directionality]
 is [TextDirection.rtl] and [AxisDirection.right] if the ambient
 [Directionality] is [TextDirection.ltr].

 If the [axisDirection] is [AxisDirection.left] or [AxisDirection.right],
 this property defaults to [AxisDirection.down].

- **anchor**: `double`
  The relative position of the zero scroll offset.

 For example, if [anchor] is 0.5 and the [axisDirection] is
 [AxisDirection.down] or [AxisDirection.up], then the zero scroll offset is
 vertically centered within the viewport. If the [anchor] is 1.0, and the
 [axisDirection] is [AxisDirection.right], then the zero scroll offset is
 on the left edge of the viewport.

 

- **offset**: `ViewportOffset`
  Which part of the content inside the viewport should be visible.

 The [ViewportOffset.pixels] value determines the scroll offset that the
 viewport uses to select which part of its content to display. As the user
 scrolls the viewport, this value changes, which changes the content that
 is displayed.

 Typically a [ScrollPosition].

- **center**: `Key?`
  The first child in the [GrowthDirection.forward] growth direction.

 Children after [center] will be placed in the [axisDirection] relative to
 the [center]. Children before [center] will be placed in the opposite of
 the [axisDirection] relative to the [center].

 The [center] must be the key of a child of the viewport.

 

- **cacheExtent**: `double?`
  

 See also:

  * [cacheExtentStyle], which controls the units of the [cacheExtent].

- **cacheExtentStyle**: `CacheExtentStyle`
  

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates a widget that is bigger on the inside.

 The viewport listens to the [offset], which means you do not need to
 rebuild this widget when the [offset] changes.

 The [cacheExtent] must be specified if the [cacheExtentStyle] is
 not [CacheExtentStyle.pixel].

