# Overview for `RenderShrinkWrappingViewport`

## Description

A render object that is bigger on the inside and shrink wraps its children
 in the main axis.

 [RenderShrinkWrappingViewport] displays a subset of its children according
 to its own dimensions and the given [offset]. As the offset varies, different
 children are visible through the viewport.

 [RenderShrinkWrappingViewport] differs from [RenderViewport] in that
 [RenderViewport] expands to fill the main axis whereas
 [RenderShrinkWrappingViewport] sizes itself to match its children in the
 main axis. This shrink wrapping behavior is expensive because the children,
 and hence the viewport, could potentially change size whenever the [offset]
 changes (e.g., because of a collapsing header).

 [RenderShrinkWrappingViewport] cannot contain [RenderBox] children directly.
 Instead, use a [RenderSliverList], [RenderSliverFixedExtentList],
 [RenderSliverGrid], or a [RenderSliverToBoxAdapter], for example.

 See also:

  * [RenderViewport], a viewport that does not shrink-wrap its contents.
  * [RenderSliver], which explains more about the Sliver protocol.
  * [RenderBox], which explains more about the Box protocol.
  * [RenderSliverToBoxAdapter], which allows a [RenderBox] object to be
    placed inside a [RenderSliver] (the opposite of this class).

## Dependencies

- RenderViewportBase

## Members

- **_maxScrollExtent**: `double`
- **_shrinkWrapExtent**: `double`
- **_hasVisualOverflow**: `bool`
## Constructors

### Unnamed Constructor
Creates a viewport (for [RenderSliver] objects) that shrink-wraps its
 contents.

 The [offset] must be specified. For testing purposes, consider passing a
 [ViewportOffset.zero] or [ViewportOffset.fixed].

