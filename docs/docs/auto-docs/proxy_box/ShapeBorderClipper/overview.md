# Overview for `ShapeBorderClipper`

## Description

A [CustomClipper] that clips to the outer path of a [ShapeBorder].

## Dependencies

- CustomClipper

## Members

- **shape**: `ShapeBorder`
  The shape border whose outer path this clipper clips to.

- **textDirection**: `TextDirection?`
  The text direction to use for getting the outer path for [shape].

 [ShapeBorder]s can depend on the text direction (e.g having a "dent"
 towards the start of the shape).

## Constructors

### Unnamed Constructor
Creates a [ShapeBorder] clipper.

 The [textDirection] argument must be provided non-null if [shape]
 has a text direction dependency (for example if it is expressed in terms
 of "start" and "end" instead of "left" and "right"). It may be null if
 the border will not need the text direction to paint itself.

