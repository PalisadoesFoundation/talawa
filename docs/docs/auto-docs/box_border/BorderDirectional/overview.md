# Overview for `BorderDirectional`

## Description

A border of a box, comprised of four sides, the lateral sides of which
 flip over based on the reading direction.

 The lateral sides are called [start] and [end]. When painted in
 left-to-right environments, the [start] side will be painted on the left and
 the [end] side on the right; in right-to-left environments, it is the
 reverse. The other two sides are [top] and [bottom].

 The sides are represented by [BorderSide] objects.

 If the [start] and [end] sides are the same, then it is slightly more
 efficient to use a [Border] object rather than a [BorderDirectional] object.

 See also:

  * [BoxDecoration], which uses this class to describe its edge decoration.
  * [BorderSide], which is used to describe each side of the box.
  * [Theme], from the material layer, which can be queried to obtain appropriate colors
    to use for borders in a [MaterialApp], as shown in the "divider" sample above.
  * <https://pub.dev/packages/non_uniform_border>, a package that implements
    a Non-Uniform Border on ShapeBorder, which is used by Material Design
    buttons and other widgets, under the "shape" field.

## Dependencies

- BoxBorder

## Members

- **top**: `BorderSide`
- **start**: `BorderSide`
  The start side of this border.

 This is the side on the left in left-to-right text and on the right in
 right-to-left text.

 See also:

  * [TextDirection], which is used to describe the reading direction.

- **end**: `BorderSide`
  The end side of this border.

 This is the side on the right in left-to-right text and on the left in
 right-to-left text.

 See also:

  * [TextDirection], which is used to describe the reading direction.

- **bottom**: `BorderSide`
## Constructors

### Unnamed Constructor
Creates a border.

 The [start] and [end] sides represent the horizontal sides; the start side
 is on the leading edge given the reading direction, and the end side is on
 the trailing edge. They are resolved during [paint].

 All the sides of the border default to [BorderSide.none].

