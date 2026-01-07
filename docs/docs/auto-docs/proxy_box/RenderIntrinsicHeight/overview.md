# Overview for `RenderIntrinsicHeight`

## Description

Sizes its child to the child's intrinsic height.

 This class is useful, for example, when unlimited height is available and
 you would like a child that would otherwise attempt to expand infinitely to
 instead size itself to a more reasonable height.

 The constraints that this object passes to its child will adhere to the
 parent's constraints, so if the constraints are not large enough to satisfy
 the child's maximum intrinsic height, then the child will get less height
 than it otherwise would. Likewise, if the minimum height constraint is
 larger than the child's maximum intrinsic height, the child will be given
 more height than it otherwise would.

 This class is relatively expensive, because it adds a speculative layout
 pass before the final layout phase. Avoid using it where possible. In the
 worst case, this render object can result in a layout that is O(N²) in the
 depth of the tree.

 See also:

  * [Align], a widget that aligns its child within itself. This can be used
    to loosen the constraints passed to the [RenderIntrinsicHeight],
    allowing the [RenderIntrinsicHeight]'s child to be smaller than that of
    its parent.
  * [Column], which when used with [CrossAxisAlignment.stretch] can be used
    to loosen just the height constraints that are passed to the
    [RenderIntrinsicHeight], allowing the [RenderIntrinsicHeight]'s child's
    height to be smaller than that of its parent.

## Dependencies

- RenderProxyBox

## Constructors

### Unnamed Constructor
Creates a render object that sizes itself to its child's intrinsic height.

