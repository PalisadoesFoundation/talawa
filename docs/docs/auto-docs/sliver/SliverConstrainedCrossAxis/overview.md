# Overview for `SliverConstrainedCrossAxis`

## Description

A sliver that constrains the cross axis extent of its sliver child.

 The [SliverConstrainedCrossAxis] takes a [maxExtent] parameter and uses it as
 the cross axis extent of the [SliverConstraints] passed to the sliver child.
 The widget ensures that the [maxExtent] is a nonnegative value.

 This is useful when you want to apply a custom cross-axis extent constraint
 to a sliver child, as slivers typically consume the full cross axis extent.

 This widget also sets its parent data's [SliverPhysicalParentData.crossAxisFlex]
 to 0, so that it informs [SliverCrossAxisGroup] that it should not flex
 in the cross axis direction.

 
 In this sample the [SliverConstrainedCrossAxis] sizes its child so that the
 cross axis extent takes up less space than the actual viewport.

 ** See code in examples/api/lib/widgets/sliver/sliver_constrained_cross_axis.0.dart **
 

 See also:

  * [SliverCrossAxisGroup], the widget which makes use of 0 flex factor set by
    this widget.

## Dependencies

- StatelessWidget

## Members

- **maxExtent**: `double`
  The cross axis extent to apply to the sliver child.

 This value must be nonnegative.

- **sliver**: `Widget`
  The widget below this widget in the tree.

 Must be a sliver.

## Constructors

### Unnamed Constructor
Creates a sliver that constrains the cross axis extent of its sliver child.

 The [maxExtent] parameter is required and must be nonnegative.

