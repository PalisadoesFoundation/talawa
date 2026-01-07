# Overview for `RenderSliverEdgeInsetsPadding`

## Description

Insets a [RenderSliver] by applying [resolvedPadding] on each side.

 A [RenderSliverEdgeInsetsPadding] subclass wraps the [SliverGeometry.layoutExtent]
 of its child. Any incoming [SliverConstraints.overlap] is ignored and not
 passed on to the child.

 
 Applying padding in the main extent of the viewport to slivers that have scroll effects is likely to have
 undesired effects. For example, wrapping a [SliverPersistentHeader] with
 `pinned:true` will cause only the appbar to stay pinned while the padding will scroll away.
 

## Dependencies

- RenderSliver, RenderObjectWithChildMixin

