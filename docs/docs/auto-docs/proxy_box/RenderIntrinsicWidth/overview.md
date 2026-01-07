# Overview for `RenderIntrinsicWidth`

## Description

Sizes its child to the child's maximum intrinsic width.

 This class is useful, for example, when unlimited width is available and
 you would like a child that would otherwise attempt to expand infinitely to
 instead size itself to a more reasonable width.

 The constraints that this object passes to its child will adhere to the
 parent's constraints, so if the constraints are not large enough to satisfy
 the child's maximum intrinsic width, then the child will get less width
 than it otherwise would. Likewise, if the minimum width constraint is
 larger than the child's maximum intrinsic width, the child will be given
 more width than it otherwise would.

 If [stepWidth] is non-null, the child's width will be snapped to a multiple
 of the [stepWidth]. Similarly, if [stepHeight] is non-null, the child's
 height will be snapped to a multiple of the [stepHeight].

 This class is relatively expensive, because it adds a speculative layout
 pass before the final layout phase. Avoid using it where possible. In the
 worst case, this render object can result in a layout that is O(N²) in the
 depth of the tree.

 See also:

  * [Align], a widget that aligns its child within itself. This can be used
    to loosen the constraints passed to the [RenderIntrinsicWidth],
    allowing the [RenderIntrinsicWidth]'s child to be smaller than that of
    its parent.
  * [Row], which when used with [CrossAxisAlignment.stretch] can be used
    to loosen just the width constraints that are passed to the
    [RenderIntrinsicWidth], allowing the [RenderIntrinsicWidth]'s child's
    width to be smaller than that of its parent.

## Dependencies

- RenderProxyBox

## Members

- **_stepWidth**: `double?`
- **_stepHeight**: `double?`
## Constructors

### Unnamed Constructor
Creates a render object that sizes itself to its child's intrinsic width.

 If [stepWidth] is non-null it must be > 0.0. Similarly If [stepHeight] is
 non-null it must be > 0.0.

