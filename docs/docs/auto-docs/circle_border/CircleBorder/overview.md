# Overview for `CircleBorder`

## Description

A border that fits a circle within the available space.

 Typically used with [ShapeDecoration] to draw a circle.

 The [dimensions] assume that the border is being used in a square space.
 When applied to a rectangular space, the border paints in the center of the
 rectangle.

 The [eccentricity] parameter describes how much a circle will deform to
 fit the rectangle it is a border for. A value of zero implies no
 deformation (a circle touching at least two sides of the rectangle), a
 value of one implies full deformation (an oval touching all sides of the
 rectangle).

 See also:

  * [OvalBorder], which draws a Circle touching all the edges of the box.
  * [BorderSide], which is used to describe each side of the box.
  * [Border], which, when used with [BoxDecoration], can also describe a circle.

## Dependencies

- OutlinedBorder

## Members

- **eccentricity**: `double`
  Defines the ratio (0.0-1.0) from which the border will deform
 to fit a rectangle.
 When 0.0, it draws a circle touching at least two sides of the rectangle.
 When 1.0, it draws an oval touching all sides of the rectangle.

## Constructors

### Unnamed Constructor
Create a circle border.

