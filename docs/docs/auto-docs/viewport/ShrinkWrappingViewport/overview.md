# Overview for `ShrinkWrappingViewport`

## Description

A widget that is bigger on the inside and shrink wraps its children in the
 main axis.

 [ShrinkWrappingViewport] displays a subset of its children according to its
 own dimensions and the given [offset]. As the offset varies, different
 children are visible through the viewport.

 [ShrinkWrappingViewport] differs from [Viewport] in that [Viewport] expands
 to fill the main axis whereas [ShrinkWrappingViewport] sizes itself to match
 its children in the main axis. This shrink wrapping behavior is expensive
 because the children, and hence the viewport, could potentially change size
 whenever the [offset] changes (e.g., because of a collapsing header).

 [ShrinkWrappingViewport] cannot contain box children directly. Instead, use
 a [SliverList], [SliverFixedExtentList], [SliverGrid], or a
 [SliverToBoxAdapter], for example.

 See also:

  * [ListView], [PageView], [GridView], and [CustomScrollView], which combine
    [Scrollable] and [ShrinkWrappingViewport] into widgets that are easier to
    use.
  * [SliverToBoxAdapter], which allows a box widget to be placed inside a
    sliver context (the opposite of this widget).
  * [Viewport], a viewport that does not shrink-wrap its contents.

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

- **offset**: `ViewportOffset`
  Which part of the content inside the viewport should be visible.

 The [ViewportOffset.pixels] value determines the scroll offset that the
 viewport uses to select which part of its content to display. As the user
 scrolls the viewport, this value changes, which changes the content that
 is displayed.

 Typically a [ScrollPosition].

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates a widget that is bigger on the inside and shrink wraps its
 children in the main axis.

 The viewport listens to the [offset], which means you do not need to
 rebuild this widget when the [offset] changes.

