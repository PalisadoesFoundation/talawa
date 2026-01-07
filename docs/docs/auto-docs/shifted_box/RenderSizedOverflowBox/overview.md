# Overview for `RenderSizedOverflowBox`

## Description

A render object that is a specific size but passes its original constraints
 through to its child, which it allows to overflow.

 If the child's resulting size differs from this render object's size, then
 the child is aligned according to the [alignment] property.

 See also:

  * [RenderConstraintsTransformBox] for a render object that applies an
    arbitrary transform to its constraints before sizing its child using
    the new constraints, treating any overflow as error.
  * [RenderConstrainedOverflowBox] for a render object that imposes
    different constraints on its child than it gets from its parent,
    possibly allowing the child to overflow the parent.

## Dependencies

- RenderAligningShiftedBox

## Members

- **_requestedSize**: `Size`
## Constructors

### Unnamed Constructor
Creates a render box of a given size that lets its child overflow.

 The [textDirection] argument must not be null if the [alignment] is
 direction-sensitive.

