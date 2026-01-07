# Overview for `StarBorder`

## Description

A border that fits a star or polygon-shaped border within the rectangle of
 the widget it is applied to.

 Typically used with a [ShapeDecoration] to draw a polygonal or star shaped
 border.

 
 This example serves both as a usage example, as well as an explorer for
 determining the parameters to use with a [StarBorder]. The resulting code
 can be copied and pasted into your app. A [Container] is just one widget
 which takes a [ShapeBorder]. [Dialog]s, [OutlinedButton]s,
 [ElevatedButton]s, etc. all can be shaped with a [ShapeBorder].

 ** See code in examples/api/lib/painting/star_border/star_border.0.dart **
 

 See also:

  * [BorderSide], which is used to describe how the edge of the shape is
  drawn.

## Dependencies

- OutlinedBorder

## Members

- **points**: `double`
  The number of points in this star, or sides on a polygon.

 This is a floating point number: if this is not a whole number, then an
 additional star point or corner shorter than the others will be added to
 finish the shape. Only whole-numbered values will yield a symmetric shape.
 (This enables the number of points to be animated smoothly.)

 For stars created with [StarBorder], this is the number of points on
 the star. For polygons created with [StarBorder.polygon], this is the
 number of sides on the polygon.

 Must be greater than or equal to two.

- **_innerRadiusRatio**: `double?`
- **pointRounding**: `double`
  The amount of rounding on the points of stars, or the corners of polygons.

 This is a value between zero and one which describes how rounded the point
 or corner should be. A value of zero means no rounding (sharp corners),
 and a value of one means that the entire point or corner is a portion of a
 circle.

 Defaults to zero. The sum of [pointRounding] and [valleyRounding] must be
 less than or equal to one.

- **valleyRounding**: `double`
  The amount of rounding of the interior corners of stars.

 This is a value between zero and one which describes how rounded the inner
 corners in a star (the "valley" between points) should be. A value of zero
 means no rounding (sharp corners), and a value of one means that the
 entire corner is a portion of a circle.

 Defaults to zero. The sum of [pointRounding] and [valleyRounding] must be
 less than or equal to one. For polygons created with [StarBorder.polygon],
 this will always be zero.

- **_rotationRadians**: `double`
- **squash**: `double`
  How much of the aspect ratio of the attached widget to take on.

 If [squash] is non-zero, the border will match the aspect ratio of the
 bounding box of the widget that it is attached to, which can give a
 squashed appearance.

 The [squash] parameter lets you control how much of that aspect ratio this
 border takes on.

 A value of zero means that the border will be drawn with a square aspect
 ratio at the size of the shortest side of the bounding rectangle, ignoring
 the aspect ratio of the widget, and a value of one means it will be drawn
 with the aspect ratio of the widget. The value of [squash] has no effect
 if the widget is square to begin with.

 Defaults to zero, and must be between zero and one, inclusive.

## Constructors

### Unnamed Constructor
Create a const star-shaped border with the given number [points] on the
 star.

### polygon
Create a const polygon border with the given number of [sides].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
