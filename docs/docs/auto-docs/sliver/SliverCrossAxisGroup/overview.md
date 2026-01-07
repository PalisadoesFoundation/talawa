# Overview for `SliverCrossAxisGroup`

## Description

A sliver that places multiple sliver children in a linear array along
 the cross axis.

 ## Layout algorithm

 _This section describes how the framework causes [RenderSliverCrossAxisGroup]
 to position its children._

 Layout for a [RenderSliverCrossAxisGroup] has four steps:

 1. Layout each child with a null or zero flex factor with cross axis constraint
    being whatever cross axis space is remaining after laying out any previous
    sliver. Slivers with null or zero flex factor should determine their own
    [SliverGeometry.crossAxisExtent]. For example, the [SliverConstrainedCrossAxis]
    widget uses either [SliverConstrainedCrossAxis.maxExtent] or
    [SliverConstraints.crossAxisExtent], deciding between whichever is smaller.
 2. Divide up the remaining cross axis space among the children with non-zero flex
    factors according to their flex factor. For example, a child with a flex
    factor of 2.0 will receive twice the amount of cross axis space as a child
    with a flex factor 1.0.
 3. Layout each of the remaining children with the cross axis constraint
    allocated in the previous step.
 4. Set the geometry to that of whichever child has the longest
    [SliverGeometry.scrollExtent] with the [SliverGeometry.crossAxisExtent] adjusted
    to [SliverConstraints.crossAxisExtent].

 
 In this sample the [SliverCrossAxisGroup] sizes its three [children] so that
 the first normal [SliverList] has a flex factor of 1, the second [SliverConstrainedCrossAxis]
 has a flex factor of 0 and a maximum cross axis extent of 200.0, and the third
 [SliverCrossAxisExpanded] has a flex factor of 2.

 ** See code in examples/api/lib/widgets/sliver/sliver_cross_axis_group.0.dart **
 

 See also:

  * [SliverCrossAxisExpanded], which is the [ParentDataWidget] for setting a flex
    value to a widget.
  * [SliverConstrainedCrossAxis], which is a [RenderObjectWidget] for setting
    an extent to constrain the widget to.
  * [SliverMainAxisGroup], which is the [RenderObjectWidget] for laying out
    multiple slivers along the main axis.

## Dependencies

- MultiChildRenderObjectWidget

## Constructors

### Unnamed Constructor
Creates a sliver that places sliver children in a linear array along
 the cross axis.

