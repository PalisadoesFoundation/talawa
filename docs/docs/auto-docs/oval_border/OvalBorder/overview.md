# Overview for `OvalBorder`

## Description

A border that fits an elliptical shape.

 Typically used with [ShapeDecoration] to draw an oval. Instead of centering
 the [Border] to a square, like [CircleBorder], it fills the available space,
 such that it touches the edges of the box. There is no difference between
 `CircleBorder(eccentricity = 1.0)` and ``. [OvalBorder] works as
 an alias for users to discover this feature.

 See also:

  * [CircleBorder], which draws a circle, centering when the box is rectangular.
  * [Border], which, when used with [BoxDecoration], can also describe an oval.

## Dependencies

- CircleBorder

## Constructors

### Unnamed Constructor
Create an oval border.

