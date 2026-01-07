# Overview for `RenderSliverConstrainedCrossAxis`

## Description

Applies a cross-axis constraint to its sliver child.

 This render object takes a [maxExtent] parameter and uses the smaller of
 [maxExtent] and the parent's [SliverConstraints.crossAxisExtent] as the
 cross axis extent of the [SliverConstraints] passed to the sliver child.

## Dependencies

- RenderProxySliver

## Members

- **_maxExtent**: `double`
## Constructors

### Unnamed Constructor
Creates a render object that constrains the cross axis extent of its sliver child.

 The [maxExtent] parameter must be nonnegative.

