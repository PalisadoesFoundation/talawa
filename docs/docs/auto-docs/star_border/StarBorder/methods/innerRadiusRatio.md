# Method: `innerRadiusRatio`

## Description

The ratio of the inner radius of a star with the outer radius.

 When making a star using [StarBorder], this is the ratio of the inner
 radius that to the outer radius. If it is one, then the inner radius
 will equal the outer radius.

 For polygons created with [StarBorder.polygon], getting this value will
 return the incircle radius of the polygon (the radius of a circle
 inscribed inside the polygon).

 Defaults to 0.4 for stars, and must be between zero and one, inclusive.

## Return Type
`double`

