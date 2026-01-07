# Overview for `RenderViewportBase`

## Description

A base class for render objects that are bigger on the inside.

 This render object provides the shared code for render objects that host
 [RenderSliver] render objects inside a [RenderBox]. The viewport establishes
 an [axisDirection], which orients the sliver's coordinate system, which is
 based on scroll offsets rather than Cartesian coordinates.

 The viewport also listens to an [offset], which determines the
 [SliverConstraints.scrollOffset] input to the sliver layout protocol.

 Subclasses typically override [performLayout] and call
 [layoutChildSequence], perhaps multiple times.

 See also:

  * [RenderSliver], which explains more about the Sliver protocol.
  * [RenderBox], which explains more about the Box protocol.
  * [RenderSliverToBoxAdapter], which allows a [RenderBox] object to be
    placed inside a [RenderSliver] (the opposite of this class).

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderAbstractViewport

## Members

- **_axisDirection**: `AxisDirection`
- **_crossAxisDirection**: `AxisDirection`
- **_offset**: `ViewportOffset`
- **_cacheExtent**: `double`
- **_calculatedCacheExtent**: `double?`
  This value is set during layout based on the [CacheExtentStyle].

 When the style is [CacheExtentStyle.viewport], it is the main axis extent
 of the viewport multiplied by the requested cache extent, which is still
 expressed in pixels.

- **_cacheExtentStyle**: `CacheExtentStyle`
- **_clipBehavior**: `Clip`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
## Constructors

### Unnamed Constructor
Initializes fields for subclasses.

 The [cacheExtent], if null, defaults to [RenderAbstractViewport.defaultCacheExtent].

 The [cacheExtent] must be specified if [cacheExtentStyle] is not [CacheExtentStyle.pixel].

