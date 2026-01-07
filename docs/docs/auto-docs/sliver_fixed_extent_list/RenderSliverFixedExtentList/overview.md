# Overview for `RenderSliverFixedExtentList`

## Description

A sliver that places multiple box children with the same main axis extent in
 a linear array.

 [RenderSliverFixedExtentList] places its children in a linear array along
 the main axis starting at offset zero and without gaps. Each child is forced
 to have the [itemExtent] in the main axis and the
 [SliverConstraints.crossAxisExtent] in the cross axis.

 [RenderSliverFixedExtentList] is more efficient than [RenderSliverList]
 because [RenderSliverFixedExtentList] does not need to perform layout on its
 children to obtain their extent in the main axis.

 See also:

  * [RenderSliverList], which does not require its children to have the same
    extent in the main axis.
  * [RenderSliverFillViewport], which determines the [itemExtent] based on
    [SliverConstraints.viewportMainAxisExtent].
  * [RenderSliverFillRemaining], which determines the [itemExtent] based on
    [SliverConstraints.remainingPaintExtent].

## Dependencies

- RenderSliverFixedExtentBoxAdaptor

## Members

- **_itemExtent**: `double`
## Constructors

### Unnamed Constructor
Creates a sliver that contains multiple box children that have a given
 extent in the main axis.

