# Overview for `RenderSliverList`

## Description

A sliver that places multiple box children in a linear array along the main
 axis.

 Each child is forced to have the [SliverConstraints.crossAxisExtent] in the
 cross axis but determines its own main axis extent.

 [RenderSliverList] determines its scroll offset by "dead reckoning" because
 children outside the visible part of the sliver are not materialized, which
 means [RenderSliverList] cannot learn their main axis extent. Instead, newly
 materialized children are placed adjacent to existing children. If this dead
 reckoning results in a logical inconsistency (e.g., attempting to place the
 zeroth child at a scroll offset other than zero), the [RenderSliverList]
 generates a [SliverGeometry.scrollOffsetCorrection] to restore consistency.

 If the children have a fixed extent in the main axis, consider using
 [RenderSliverFixedExtentList] rather than [RenderSliverList] because
 [RenderSliverFixedExtentList] does not need to perform layout on its
 children to obtain their extent in the main axis and is therefore more
 efficient.

 See also:

  * [RenderSliverFixedExtentList], which is more efficient for children with
    the same extent in the main axis.
  * [RenderSliverGrid], which places its children in arbitrary positions.

## Dependencies

- RenderSliverMultiBoxAdaptor

## Constructors

### Unnamed Constructor
Creates a sliver that places multiple box children in a linear array along
 the main axis.

