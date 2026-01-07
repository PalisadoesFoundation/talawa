# Overview for `RenderTwoDimensionalViewport`

## Description

A base class for viewing render objects that scroll in two dimensions.

 The viewport listens to two [ViewportOffset]s, which determines the
 visible content.

 Subclasses must implement [layoutChildSequence], calling on
 [buildOrObtainChildFor] to manage the children of the viewport.

 Subclasses should not override [performLayout], as it handles housekeeping
 on either side of the call to [layoutChildSequence].

## Dependencies

- RenderBox, RenderAbstractViewport

## Members

- **_horizontalOffset**: `ViewportOffset`
- **_horizontalAxisDirection**: `AxisDirection`
- **_verticalOffset**: `ViewportOffset`
- **_verticalAxisDirection**: `AxisDirection`
- **_delegate**: `TwoDimensionalChildDelegate`
- **_mainAxis**: `Axis`
- **_cacheExtent**: `double?`
- **_clipBehavior**: `Clip`
- **_childManager**: `TwoDimensionalChildManager`
- **_children**: `Map&lt;ChildVicinity, RenderBox&gt;`
- **_activeChildrenForLayoutPass**: `Map&lt;ChildVicinity, RenderBox&gt;`
  Children that have been laid out (or re-used) during the course of
 performLayout, used to update the keep alive bucket at the end of
 performLayout.

- **_keepAliveBucket**: `Map&lt;ChildVicinity, RenderBox&gt;`
  The nodes being kept alive despite not being visible.

- **_debugDanglingKeepAlives**: `List&lt;RenderBox&gt;`
- **_hasVisualOverflow**: `bool`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
- **_leadingXIndex**: `int?`
- **_trailingXIndex**: `int?`
- **_leadingYIndex**: `int?`
- **_trailingYIndex**: `int?`
- **_firstChild**: `RenderBox?`
- **_lastChild**: `RenderBox?`
- **_didResize**: `bool`
- **_needsDelegateRebuild**: `bool`
- **_debugOrphans**: `List&lt;RenderBox&gt;?`
## Constructors

### Unnamed Constructor
Initializes fields for subclasses.

 The [cacheExtent], if null, defaults to
 [RenderAbstractViewport.defaultCacheExtent].

