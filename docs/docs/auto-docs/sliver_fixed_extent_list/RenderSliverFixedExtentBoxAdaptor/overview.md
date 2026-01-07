# Overview for `RenderSliverFixedExtentBoxAdaptor`

## Description

A sliver that contains multiple box children that have the explicit extent in
 the main axis.

 [RenderSliverFixedExtentBoxAdaptor] places its children in a linear array
 along the main axis. Each child is forced to have the returned value of [itemExtentBuilder]
 when the [itemExtentBuilder] is non-null or the [itemExtent] when [itemExtentBuilder]
 is null in the main axis and the [SliverConstraints.crossAxisExtent] in the cross axis.

 Subclasses should override [itemExtent] or [itemExtentBuilder] to control
 the size of the children in the main axis. For a concrete subclass with a
 configurable [itemExtent], see [RenderSliverFixedExtentList] or [RenderSliverVariedExtentList].

 [RenderSliverFixedExtentBoxAdaptor] is more efficient than
 [RenderSliverList] because [RenderSliverFixedExtentBoxAdaptor] does not need
 to perform layout on its children to obtain their extent in the main axis.

 See also:

  * [RenderSliverFixedExtentList], which has a configurable [itemExtent].
  * [RenderSliverFillViewport], which determines the [itemExtent] based on
    [SliverConstraints.viewportMainAxisExtent].
  * [RenderSliverFillRemaining], which determines the [itemExtent] based on
    [SliverConstraints.remainingPaintExtent].
  * [RenderSliverList], which does not require its children to have the same
    extent in the main axis.

## Dependencies

- RenderSliverMultiBoxAdaptor

## Members

- **_currentLayoutDimensions**: `SliverLayoutDimensions`
## Constructors

### Unnamed Constructor
Creates a sliver that contains multiple box children that have the same
 extent in the main axis.

