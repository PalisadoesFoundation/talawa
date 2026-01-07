# Overview for `BoxBorder`

## Description

Base class for box borders that can paint as rectangles, circles, or rounded
 rectangles.

 This class is extended by [Border] and [BorderDirectional] to provide
 concrete versions of four-sided borders using different conventions for
 specifying the sides.

 The only API difference that this class introduces over [ShapeBorder] is
 that its [paint] method takes additional arguments.

 See also:

  * [BorderSide], which is used to describe each side of the box.
  * [RoundedRectangleBorder], another way of describing a box's border.
  * [CircleBorder], another way of describing a circle border.
  * [BoxDecoration], which uses a [BoxBorder] to describe its borders.

## Dependencies

- ShapeBorder

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### fromLTRB
Creates a [Border].

 All the sides of the border default to [BorderSide.none].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### all
A uniform [Border] with all sides the same color and width.

 The sides default to black solid borders, one logical pixel wide.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### fromBorderSide
Creates a [Border] whose sides are all the same.

#### Parameters

- `side`: `BorderSide`
### symmetric
Creates a [Border] with symmetrical vertical and horizontal sides.

 The `vertical` argument applies to the [left] and [right] sides, and the
 `horizontal` argument applies to the [top] and [bottom] sides.

 All arguments default to [BorderSide.none].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
### fromSTEB
Creates a [BorderDirectional].

 The [start] and [end] sides represent the horizontal sides; the start side
 is on the leading edge given the reading direction, and the end side is on
 the trailing edge. They are resolved during [paint].

 All the sides of the border default to [BorderSide.none].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
