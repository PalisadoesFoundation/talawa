# Overview for `SliverMainAxisGroup`

## Description

A sliver that places multiple sliver children in a linear array along
 the main axis, one after another.

 ## Layout algorithm

 _This section describes how the framework causes [RenderSliverMainAxisGroup]
 to position its children._

 Layout for a [RenderSliverMainAxisGroup] has four steps:

 1. Keep track of an offset variable which is the total [SliverGeometry.scrollExtent]
    of the slivers laid out so far.
 2. To determine the constraints for the next sliver child to layout, calculate the
    amount of paint extent occupied from 0.0 to the offset variable and subtract this from
    [SliverConstraints.remainingPaintExtent] minus to use as the child's
    [SliverConstraints.remainingPaintExtent]. For the [SliverConstraints.scrollOffset],
    take the provided constraint's value and subtract out the offset variable, using
    0.0 if negative.
 3. Once we finish laying out all the slivers, this offset variable represents
    the total [SliverGeometry.scrollExtent] of the sliver group. Since it is possible
    for specialized slivers to try to paint itself outside of the bounds of the
    sliver group's scroll extent (see [SliverPersistentHeader]), we must do a
    second pass to set a [SliverPhysicalParentData.paintOffset] to make sure it
    is within the bounds of the sliver group.
 4. Finally, set the [RenderSliverMainAxisGroup.geometry] with the total
    [SliverGeometry.scrollExtent], [SliverGeometry.paintExtent] calculated from
    the constraints and [SliverGeometry.scrollExtent], and [SliverGeometry.maxPaintExtent].

 
 In this sample the [CustomScrollView] renders a [SliverMainAxisGroup] and a
 [SliverToBoxAdapter] with some content. The [SliverMainAxisGroup] renders a
 [SliverAppBar], [SliverList], and [SliverToBoxAdapter]. Notice that when the
 [SliverMainAxisGroup] goes out of view, so does the pinned [SliverAppBar].

 ** See code in examples/api/lib/widgets/sliver/sliver_main_axis_group.0.dart **
 

 See also:

  * [SliverPersistentHeader], which is a [RenderObjectWidget] which may require
    adjustment to its [SliverPhysicalParentData.paintOffset] to make it fit
    within the computed [SliverGeometry.scrollExtent] of the [SliverMainAxisGroup].
  * [SliverCrossAxisGroup], which is the [RenderObjectWidget] for laying out
    multiple slivers along the cross axis.

## Dependencies

- MultiChildRenderObjectWidget

## Constructors

### Unnamed Constructor
Creates a sliver that places sliver children in a linear array along
 the main axis.

