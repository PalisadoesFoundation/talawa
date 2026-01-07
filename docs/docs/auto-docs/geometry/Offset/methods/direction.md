# Method: `direction`

## Description

The angle of this offset as radians clockwise from the positive x-axis, in
 the range -[pi] to [pi], assuming positive values of the x-axis go to the
 right and positive values of the y-axis go down.

 Zero means that [dy] is zero and [dx] is zero or positive.

 Values from zero to [pi]/2 indicate positive values of [dx] and [dy], the
 bottom-right quadrant.

 Values from [pi]/2 to [pi] indicate negative values of [dx] and positive
 values of [dy], the bottom-left quadrant.

 Values from zero to -[pi]/2 indicate positive values of [dx] and negative
 values of [dy], the top-right quadrant.

 Values from -[pi]/2 to -[pi] indicate negative values of [dx] and [dy],
 the top-left quadrant.

 When [dy] is zero and [dx] is negative, the [direction] is [pi].

 When [dx] is zero, [direction] is [pi]/2 if [dy] is positive and -[pi]/2
 if [dy] is negative.

 See also:

  * [distance], to compute the magnitude of the vector.
  * [Canvas.rotate], which uses the same convention for its angle.

## Return Type
`double`

