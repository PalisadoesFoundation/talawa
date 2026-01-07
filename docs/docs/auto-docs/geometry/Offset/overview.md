# Overview for `Offset`

## Description

An immutable 2D floating-point offset.

 Generally speaking, Offsets can be interpreted in two ways:

 1. As representing a point in Cartesian space a specified distance from a
    separately-maintained origin. For example, the top-left position of
    children in the [RenderBox] protocol is typically represented as an
    [Offset] from the top left of the parent box.

 2. As a vector that can be applied to coordinates. For example, when
    painting a [RenderObject], the parent is passed an [Offset] from the
    screen's origin which it can add to the offsets of its children to find
    the [Offset] from the screen's origin to each of the children.

 Because a particular [Offset] can be interpreted as one sense at one time
 then as the other sense at a later time, the same class is used for both
 senses.

 See also:

  * [Size], which represents a vector describing the size of a rectangle.

## Dependencies

- OffsetBase

## Members

- **zero**: `Offset`
  An offset with zero magnitude.

 This can be used to represent the origin of a coordinate space.

- **infinite**: `Offset`
  An offset with infinite x and y components.

 See also:

  * [isInfinite], which checks whether either component is infinite.
  * [isFinite], which checks whether both components are finite.

## Constructors

### Unnamed Constructor
Creates an offset. The first argument sets [dx], the horizontal component,
 and the second sets [dy], the vertical component.

### fromDirection
Creates an offset from its [direction] and [distance].

 The direction is in radians clockwise from the positive x-axis.

 The distance can be omitted, to create a unit vector (distance = 1.0).

#### Parameters

- `direction`: `double`
- ``: `dynamic`
