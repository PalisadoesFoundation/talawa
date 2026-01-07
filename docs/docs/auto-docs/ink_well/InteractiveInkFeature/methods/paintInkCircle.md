# Method: `paintInkCircle`

## Description

Draws an ink splash or ink ripple on the passed in [Canvas].

 The [transform] argument is the [Matrix4] transform that typically
 shifts the coordinate space of the canvas to the space in which
 the ink circle is to be painted.

 [center] is the [Offset] from origin of the canvas where the center
 of the circle is drawn.

 [paint] takes a [Paint] object that describes the styles used to draw the ink circle.
 For example, [paint] can specify properties like color, strokewidth, colorFilter.

 [radius] is the radius of ink circle to be drawn on canvas.

 [clipCallback] is the callback used to obtain the [Rect] used for clipping the ink effect.
 If [clipCallback] is null, no clipping is performed on the ink circle.

 Clipping can happen in 3 different ways:
  1. If [customBorder] is provided, it is used to determine the path
     for clipping.
  2. If [customBorder] is null, and [borderRadius] is provided, the canvas
     is clipped by an [RRect] created from [clipCallback] and [borderRadius].
  3. If [borderRadius] is the default [BorderRadius.zero], then the [Rect] provided
      by [clipCallback] is used for clipping.

 [textDirection] is used by [customBorder] if it is non-null. This allows the [customBorder]'s path
 to be properly defined if it was the path was expressed in terms of "start" and "end" instead of
 "left" and "right".

 For examples on how the function is used, see [InkSplash] and [InkRipple].

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
